import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/domain/entities/room_entity.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'dart:math' as math;

/// 2D 平面图房间绘制页 —— 类似设计工具的拖拽编辑器
///
/// 交互方式:
///   单指: 拖拽房间本体/角点/边 → 移动/调整大小
///   双指: 缩放 + 平移画布 (InteractiveViewer)
///   底部面板: 手动输入 X, Y, W, H 精确定位
class RoomDrawingPage extends StatefulWidget {
  final List<RoomEntity> existingRooms;
  final List<Offset>? initialPoints;

  const RoomDrawingPage({
    super.key,
    required this.existingRooms,
    this.initialPoints,
  });

  @override
  State<RoomDrawingPage> createState() => _RoomDrawingPageState();
}

class _RoomDrawingPageState extends State<RoomDrawingPage> {
  // ---- 房间矩形 ----
  // [topLeft, topRight, bottomRight, bottomLeft]
  late List<Offset> _roomPoints;
  bool _hasRoom = false;

  // ---- 拖拽 ----
  _DragMode? _dragMode;
  Offset _dragStartCanvas = Offset.zero;
  List<Offset> _dragInitialPoints = [];

  // ---- 状态 ----
  bool _hasOverlap = false;
  bool _isLocked = false;
  bool _showXYWH = false;

  // ---- 画布 ----
  final TransformationController _transformCtrl = TransformationController();

  // ---- XYWH 输入 ----
  final _xCtrl = TextEditingController();
  final _yCtrl = TextEditingController();
  final _wCtrl = TextEditingController();
  final _hCtrl = TextEditingController();

  // ---- 常量 ----
  static const double _gridSize = 20.0;
  static const double _snapDist = 12.0;
  static const double _defaultW = 150.0;
  static const double _defaultH = 100.0;
  static const double _minSize = 40.0;
  /// 画布整体偏移，让 (0,0) 大致在中间
  static const double _canvasOffset = 1000.0;

  @override
  void initState() {
    super.initState();
    if (widget.initialPoints != null && widget.initialPoints!.length >= 4) {
      _roomPoints = List.from(widget.initialPoints!.take(4));
      _hasRoom = true;
      _syncXYWH();
    } else {
      _roomPoints = [];
    }
    // 初始时将画布移动，让 offset 区域居中显示
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      _transformCtrl.value = Matrix4.identity()
        ..setTranslation(Vector3(
          size.width / 2 - _canvasOffset,
          size.height / 2 - _canvasOffset,
          0,
        ));
    });
  }

  @override
  void dispose() {
    _transformCtrl.dispose();
    _xCtrl.dispose();
    _yCtrl.dispose();
    _wCtrl.dispose();
    _hCtrl.dispose();
    super.dispose();
  }

  // ===========================================================================
  // 坐标转换
  // ===========================================================================

  /// 从屏幕坐标（相对于 Listener widget）转换到画布坐标
  Offset _screenToCanvas(Offset screenLocal) {
    final matrix = _transformCtrl.value;
    final inverse = Matrix4.tryInvert(matrix);
    if (inverse == null) return screenLocal;
    return MatrixUtils.transformPoint(inverse, screenLocal);
  }

  // ===========================================================================
  // 吸附
  // ===========================================================================

  double _snapAxis(double value, List<double> targets) {
    for (final t in targets) {
      if ((t - value).abs() < _snapDist) return t;
    }
    // 网格吸附
    return (value / _gridSize).round() * _gridSize;
  }

  ({List<double> xs, List<double> ys}) _existingEdges() {
    final xs = <double>[];
    final ys = <double>[];
    for (final room in widget.existingRooms) {
      for (final p in room.points) {
        if (!xs.contains(p.dx)) xs.add(p.dx);
        if (!ys.contains(p.dy)) ys.add(p.dy);
      }
    }
    return (xs: xs, ys: ys);
  }

  // ===========================================================================
  // 碰撞检测 (AABB)
  // ===========================================================================

  Rect _rectFrom(List<Offset> pts) {
    if (pts.length < 4) return Rect.zero;
    double l = pts[0].dx, r = pts[0].dx, t = pts[0].dy, b = pts[0].dy;
    for (final p in pts) {
      l = math.min(l, p.dx);
      r = math.max(r, p.dx);
      t = math.min(t, p.dy);
      b = math.max(b, p.dy);
    }
    return Rect.fromLTRB(l, t, r, b);
  }

  bool _checkOverlap() {
    if (!_hasRoom || _roomPoints.length < 4) return false;
    final nr = _rectFrom(_roomPoints).deflate(1.0);
    for (final room in widget.existingRooms) {
      if (room.points.length < 4) continue;
      if (nr.overlaps(_rectFrom(room.points))) return true;
    }
    return false;
  }

  // ===========================================================================
  // 添加默认房间
  // ===========================================================================

  void _addDefaultRoom() {
    Offset base = Offset(_canvasOffset, _canvasOffset);
    if (widget.existingRooms.isNotEmpty) {
      double maxRight = double.negativeInfinity;
      double topY = _canvasOffset;
      for (final room in widget.existingRooms) {
        final rect = _rectFrom(room.points);
        if (rect.right > maxRight) {
          maxRight = rect.right;
          topY = rect.top;
        }
      }
      base = Offset(maxRight, topY);
    }
    setState(() {
      _roomPoints = [
        base,
        Offset(base.dx + _defaultW, base.dy),
        Offset(base.dx + _defaultW, base.dy + _defaultH),
        Offset(base.dx, base.dy + _defaultH),
      ];
      _hasRoom = true;
      _hasOverlap = _checkOverlap();
      _syncXYWH();
    });
  }

  // ===========================================================================
  // Hit Testing（使用画布坐标）
  // ===========================================================================

  static const double _touchSlop = 24.0; // 手指触控容差区域

  _DragMode? _hitTest(Offset canvasPos) {
    if (!_hasRoom || _roomPoints.length < 4 || _isLocked) return null;

    // 1) 角点 (最高优先级)
    for (int i = 0; i < 4; i++) {
      if ((_roomPoints[i] - canvasPos).distance <= _touchSlop) {
        return _DragMode.corner(i);
      }
    }

    // 2) 边中点
    for (int i = 0; i < 4; i++) {
      final next = (i + 1) % 4;
      final mid = (_roomPoints[i] + _roomPoints[next]) / 2;
      if ((mid - canvasPos).distance <= _touchSlop) {
        return _DragMode.edge(i);
      }
    }

    // 3) 房间内部
    if (_rectFrom(_roomPoints).inflate(4).contains(canvasPos)) {
      return _DragMode.body();
    }

    return null;
  }

  // ===========================================================================
  // Pointer 事件处理 (使用 Listener 绕过手势竞争)
  // ===========================================================================

  void _onPointerDown(PointerDownEvent event) {
    if (_isLocked || !_hasRoom) return;
    final canvasPos = _screenToCanvas(event.localPosition);
    final mode = _hitTest(canvasPos);
    if (mode != null) {
      setState(() {
        _dragMode = mode;
        _dragStartCanvas = canvasPos;
        _dragInitialPoints = List.from(_roomPoints);
      });
    }
  }

  void _onPointerMove(PointerMoveEvent event) {
    if (_dragMode == null) return;
    final canvasPos = _screenToCanvas(event.localPosition);
    final delta = canvasPos - _dragStartCanvas;

    setState(() {
      _roomPoints = _applyDrag(_dragInitialPoints, _dragMode!, delta);
      _hasOverlap = _checkOverlap();
      _syncXYWH();
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    if (_dragMode != null) {
      setState(() {
        _dragMode = null;
      });
    }
  }

  // ===========================================================================
  // 拖拽计算
  // ===========================================================================

  List<Offset> _applyDrag(List<Offset> initial, _DragMode mode, Offset delta) {
    final res = List<Offset>.from(initial);
    final edges = _existingEdges();

    if (mode.type == 'body') {
      for (int i = 0; i < 4; i++) {
        res[i] = initial[i] + delta;
      }
      // 吸附左上角
      final snX = _snapAxis(res[0].dx, edges.xs);
      final snY = _snapAxis(res[0].dy, edges.ys);
      final diff = Offset(snX, snY) - res[0];
      for (int i = 0; i < 4; i++) {
        res[i] = res[i] + diff;
      }
      return res;
    }

    if (mode.type == 'corner') {
      final moved = initial[mode.index] + delta;
      final snapped = Offset(
        _snapAxis(moved.dx, edges.xs),
        _snapAxis(moved.dy, edges.ys),
      );
      res[mode.index] = snapped;
      // 保持矩形
      if (mode.index == 0) {
        res[1] = Offset(res[1].dx, snapped.dy);
        res[3] = Offset(snapped.dx, res[3].dy);
      } else if (mode.index == 1) {
        res[0] = Offset(res[0].dx, snapped.dy);
        res[2] = Offset(snapped.dx, res[2].dy);
      } else if (mode.index == 2) {
        res[1] = Offset(snapped.dx, res[1].dy);
        res[3] = Offset(res[3].dx, snapped.dy);
      } else if (mode.index == 3) {
        res[0] = Offset(snapped.dx, res[0].dy);
        res[2] = Offset(res[2].dx, snapped.dy);
      }
      return _enforceMin(res);
    }

    if (mode.type == 'edge') {
      if (mode.index == 0) {
        final ny = _snapAxis(initial[0].dy + delta.dy, edges.ys);
        res[0] = Offset(res[0].dx, ny);
        res[1] = Offset(res[1].dx, ny);
      } else if (mode.index == 1) {
        final nx = _snapAxis(initial[1].dx + delta.dx, edges.xs);
        res[1] = Offset(nx, res[1].dy);
        res[2] = Offset(nx, res[2].dy);
      } else if (mode.index == 2) {
        final ny = _snapAxis(initial[2].dy + delta.dy, edges.ys);
        res[2] = Offset(res[2].dx, ny);
        res[3] = Offset(res[3].dx, ny);
      } else if (mode.index == 3) {
        final nx = _snapAxis(initial[3].dx + delta.dx, edges.xs);
        res[3] = Offset(nx, res[3].dy);
        res[0] = Offset(nx, res[0].dy);
      }
      return _enforceMin(res);
    }

    return res;
  }

  List<Offset> _enforceMin(List<Offset> pts) {
    final r = _rectFrom(pts);
    final w = math.max(r.width, _minSize);
    final h = math.max(r.height, _minSize);
    return [
      r.topLeft,
      Offset(r.left + w, r.top),
      Offset(r.left + w, r.top + h),
      Offset(r.left, r.top + h),
    ];
  }

  // ===========================================================================
  // XYWH 输入同步
  // ===========================================================================

  void _syncXYWH() {
    if (_roomPoints.length < 4) return;
    final r = _rectFrom(_roomPoints);
    _xCtrl.text = r.left.round().toString();
    _yCtrl.text = r.top.round().toString();
    _wCtrl.text = r.width.round().toString();
    _hCtrl.text = r.height.round().toString();
  }

  void _applyXYWH() {
    final x = double.tryParse(_xCtrl.text) ?? 0;
    final y = double.tryParse(_yCtrl.text) ?? 0;
    final w = math.max(double.tryParse(_wCtrl.text) ?? _defaultW, _minSize);
    final h = math.max(double.tryParse(_hCtrl.text) ?? _defaultH, _minSize);
    setState(() {
      _roomPoints = [
        Offset(x, y),
        Offset(x + w, y),
        Offset(x + w, y + h),
        Offset(x, y + h),
      ];
      _hasRoom = true;
      _hasOverlap = _checkOverlap();
    });
  }

  // ===========================================================================
  // 操作
  // ===========================================================================

  void _resetDrawing() {
    setState(() {
      _roomPoints = [];
      _hasRoom = false;
      _hasOverlap = false;
      _isLocked = false;
      _dragMode = null;
    });
  }

  void _toggleLock() => setState(() => _isLocked = !_isLocked);

  void _confirmDrawing() {
    if (_roomPoints.length >= 4 && !_hasOverlap) {
      Navigator.of(context).pop(_roomPoints);
    }
  }

  // ===========================================================================
  // Build
  // ===========================================================================

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          '编辑房间',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: colors.textPrimary,
          ),
        ),
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: colors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          if (_hasRoom)
            IconButton(
              icon: Icon(Icons.refresh_rounded, color: colors.textSecondary),
              onPressed: _resetDrawing,
              tooltip: '重置',
            ),
        ],
      ),
      body: Column(
        children: [
          // ---- 画布区域 ----
          Expanded(
            child: Stack(
              children: [
                // Listener 在 InteractiveViewer 外面，拦截 pointer 进行房间拖拽
                Listener(
                  behavior: HitTestBehavior.translucent,
                  onPointerDown: _onPointerDown,
                  onPointerMove: _onPointerMove,
                  onPointerUp: _onPointerUp,
                  child: InteractiveViewer(
                    transformationController: _transformCtrl,
                    boundaryMargin: const EdgeInsets.all(2000),
                    minScale: 0.15,
                    maxScale: 5.0,
                    // 关键：禁止单指平移，避免与房间拖拽冲突
                    // 双指缩放+平移仍然有效 (scaleEnabled: true)
                    panEnabled: _dragMode == null,
                    scaleEnabled: true,
                    child: CustomPaint(
                      painter: _FloorPlanPainter(
                        existingRooms: widget.existingRooms,
                        newRoomPoints: _hasRoom ? _roomPoints : [],
                        hasOverlap: _hasOverlap,
                        isLocked: _isLocked,
                        dragMode: _dragMode,
                        colors: colors,
                      ),
                      size: const Size(2000, 2000),
                    ),
                  ),
                ),

                // ---- 顶部提示 ----
                Positioned(
                  left: 16.w,
                  right: 16.w,
                  top: 12.h,
                  child: _buildInstructions(colors),
                ),
              ],
            ),
          ),

          // ---- XYWH 输入面板 ----
          if (_showXYWH && _hasRoom) _buildXYWHPanel(colors),

          // ---- 底部操作栏 ----
          _buildBottomBar(colors),
        ],
      ),
    );
  }

  // ===========================================================================
  // 提示条
  // ===========================================================================

  Widget _buildInstructions(AppColorsData colors) {
    String text;
    Color iconColor = colors.primary;
    IconData icon = Icons.info_outline_rounded;

    if (_hasOverlap) {
      text = '房间与现有房间重叠，请调整';
      iconColor = colors.error;
      icon = Icons.warning_rounded;
    } else if (!_hasRoom) {
      text = '点击下方「添加房间」放置新房间';
    } else if (_isLocked) {
      text = '已锁定 — 解锁后可拖拽';
      iconColor = colors.warning;
      icon = Icons.lock_rounded;
    } else {
      text = '单指拖拽移动/调整 · 双指缩放画布';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 18.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13.sp,
                color: _hasOverlap ? colors.error : colors.textPrimary,
              ),
            ),
          ),
          if (_hasRoom)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: (_hasOverlap ? colors.error : colors.primary)
                    .withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Text(
                _sizeLabel(),
                style: TextStyle(
                  fontSize: 11.sp,
                  color: _hasOverlap ? colors.error : colors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _sizeLabel() {
    if (_roomPoints.length < 4) return '';
    final r = _rectFrom(_roomPoints);
    return '${r.width.round()} × ${r.height.round()}';
  }

  // ===========================================================================
  // XYWH 输入面板
  // ===========================================================================

  Widget _buildXYWHPanel(AppColorsData colors) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(top: BorderSide(color: colors.border.withValues(alpha: 0.3))),
      ),
      child: Row(
        children: [
          _xywhField('X', _xCtrl, colors),
          SizedBox(width: 8.w),
          _xywhField('Y', _yCtrl, colors),
          SizedBox(width: 8.w),
          _xywhField('W', _wCtrl, colors),
          SizedBox(width: 8.w),
          _xywhField('H', _hCtrl, colors),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: _applyXYWH,
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(Icons.check, color: Colors.white, size: 20.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _xywhField(String label, TextEditingController ctrl, AppColorsData colors) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 10.sp,
                  color: colors.textTertiary,
                  fontWeight: FontWeight.w600)),
          SizedBox(height: 4.h),
          SizedBox(
            height: 36.h,
            child: TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 13.sp, color: colors.textPrimary),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                isDense: true,
                filled: true,
                fillColor: colors.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: colors.border.withValues(alpha: 0.3)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: colors.border.withValues(alpha: 0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: colors.primary),
                ),
              ),
              onSubmitted: (_) => _applyXYWH(),
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // 底部操作栏
  // ===========================================================================

  Widget _buildBottomBar(AppColorsData colors) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16.w,
        12.h,
        16.w,
        MediaQuery.of(context).padding.bottom + 12.h,
      ),
      decoration: BoxDecoration(
        color: colors.surface,
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: !_hasRoom
          ? SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _addDefaultRoom,
                icon: Icon(Icons.add_rounded, size: 20.sp),
                label: Text('添加房间', style: TextStyle(fontSize: 14.sp)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            )
          : Row(
              children: [
                // 锁定
                _toolBtn(
                  icon: _isLocked ? Icons.lock_rounded : Icons.lock_open_rounded,
                  label: _isLocked ? '解锁' : '锁定',
                  color: _isLocked ? colors.warning : colors.textSecondary,
                  onTap: _toggleLock,
                  colors: colors,
                ),
                SizedBox(width: 10.w),
                // XYWH 输入
                _toolBtn(
                  icon: Icons.straighten_rounded,
                  label: 'XYWH',
                  color: _showXYWH ? colors.primary : colors.textSecondary,
                  onTap: () => setState(() => _showXYWH = !_showXYWH),
                  colors: colors,
                ),
                SizedBox(width: 10.w),
                // 重置
                _toolBtn(
                  icon: Icons.refresh_rounded,
                  label: '重置',
                  color: colors.textSecondary,
                  onTap: _resetDrawing,
                  colors: colors,
                ),
                SizedBox(width: 12.w),
                // 确认
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: !_hasOverlap && _hasRoom ? _confirmDrawing : null,
                    icon: Icon(Icons.check_circle_rounded, size: 18.sp),
                    label: Text('确认', style: TextStyle(fontSize: 14.sp)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _hasOverlap ? colors.error : colors.primary,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: colors.border,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _toolBtn({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    required AppColorsData colors,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: color.withValues(alpha: 0.3)),
            ),
            child: Icon(icon, color: color, size: 20.sp),
          ),
          SizedBox(height: 3.h),
          Text(label, style: TextStyle(fontSize: 10.sp, color: color)),
        ],
      ),
    );
  }
}

// =============================================================================
// 拖拽模式
// =============================================================================

class _DragMode {
  final String type; // 'body', 'corner', 'edge'
  final int index;

  const _DragMode._(this.type, this.index);
  factory _DragMode.body() => const _DragMode._('body', 0);
  factory _DragMode.corner(int i) => _DragMode._('corner', i);
  factory _DragMode.edge(int i) => _DragMode._('edge', i);
}

// =============================================================================
// Painter —— 2D 平面图
// =============================================================================

class _FloorPlanPainter extends CustomPainter {
  final List<RoomEntity> existingRooms;
  final List<Offset> newRoomPoints;
  final bool hasOverlap;
  final bool isLocked;
  final _DragMode? dragMode;
  final AppColorsData colors;

  static const double _gridSize = 20.0;

  _FloorPlanPainter({
    required this.existingRooms,
    required this.newRoomPoints,
    required this.hasOverlap,
    required this.isLocked,
    this.dragMode,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawGrid(canvas, size);
    for (final room in existingRooms) {
      _drawExisting(canvas, room);
    }
    if (newRoomPoints.length >= 4) {
      _drawNewRoom(canvas);
    }
  }

  void _drawGrid(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colors.border.withValues(alpha: 0.08)
      ..strokeWidth = 1;

    for (double x = 0; x <= size.width; x += _gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += _gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  void _drawExisting(Canvas canvas, RoomEntity room) {
    if (room.points.length < 4) return;
    final rect = _rectOf(room.points);
    final rr = RRect.fromRectAndRadius(rect, const Radius.circular(4));

    canvas.drawRRect(
        rr,
        Paint()
          ..color = colors.surface.withValues(alpha: 0.65)
          ..style = PaintingStyle.fill);
    canvas.drawRRect(
        rr,
        Paint()
          ..color = colors.border.withValues(alpha: 0.55)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0);

    final tp = TextPainter(
      text: TextSpan(
          text: room.name,
          style: TextStyle(color: colors.textSecondary, fontSize: 12)),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, rect.center - Offset(tp.width / 2, tp.height / 2));
  }

  void _drawNewRoom(Canvas canvas) {
    final rect = _rectOf(newRoomPoints);
    final rr = RRect.fromRectAndRadius(rect, const Radius.circular(4));
    final rc = hasOverlap ? colors.error : colors.primary;

    // 阴影
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          rect.shift(const Offset(3, 3)), const Radius.circular(4)),
      Paint()
        ..color = colors.shadow.withValues(alpha: 0.12)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
    );

    // 填充
    canvas.drawRRect(
        rr,
        Paint()
          ..color = rc.withValues(alpha: 0.15)
          ..style = PaintingStyle.fill);

    // 描边
    canvas.drawRRect(
        rr,
        Paint()
          ..color = rc
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0);

    // 尺寸标注
    final label = '${rect.width.round()} × ${rect.height.round()}';
    final tp = TextPainter(
      text: TextSpan(
          text: label,
          style: TextStyle(
              color: rc, fontSize: 11, fontWeight: FontWeight.w500)),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, Offset(rect.center.dx - tp.width / 2, rect.bottom + 6));

    // 手柄
    if (!isLocked) _drawHandles(canvas, rc);

    // 锁定图标
    if (isLocked) {
      final lk = TextPainter(
        text: TextSpan(
          text: String.fromCharCode(Icons.lock.codePoint),
          style: TextStyle(
            color: colors.warning,
            fontSize: 22,
            fontFamily: Icons.lock.fontFamily,
            package: Icons.lock.fontPackage,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      lk.paint(canvas, rect.center - Offset(lk.width / 2, lk.height / 2));
    }
  }

  void _drawHandles(Canvas canvas, Color rc) {
    final white = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final fill = Paint()
      ..color = rc
      ..style = PaintingStyle.fill;
    final stroke = Paint()
      ..color = rc
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // 角点 — 方形手柄，更直观
    for (int i = 0; i < 4; i++) {
      final p = newRoomPoints[i];
      final active = dragMode?.type == 'corner' && dragMode?.index == i;
      final s = active ? 12.0 : 9.0;
      canvas.drawRect(
          Rect.fromCenter(center: p, width: s + 4, height: s + 4), white);
      canvas.drawRect(
          Rect.fromCenter(center: p, width: s, height: s), fill);
      if (active) {
        canvas.drawCircle(
            p,
            18,
            Paint()
              ..color = rc.withValues(alpha: 0.2)
              ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6));
      }
    }

    // 边中点 — 圆形手柄
    for (int i = 0; i < 4; i++) {
      final next = (i + 1) % 4;
      final mid = (newRoomPoints[i] + newRoomPoints[next]) / 2;
      final active = dragMode?.type == 'edge' && dragMode?.index == i;
      final r = active ? 7.0 : 5.0;
      canvas.drawCircle(mid, r + 2, white);
      canvas.drawCircle(mid, r, stroke);
    }
  }

  Rect _rectOf(List<Offset> pts) {
    double l = pts[0].dx, r = pts[0].dx, t = pts[0].dy, b = pts[0].dy;
    for (final p in pts) {
      l = math.min(l, p.dx);
      r = math.max(r, p.dx);
      t = math.min(t, p.dy);
      b = math.max(b, p.dy);
    }
    return Rect.fromLTRB(l, t, r, b);
  }

  @override
  bool shouldRepaint(covariant _FloorPlanPainter old) {
    return old.newRoomPoints != newRoomPoints ||
        old.hasOverlap != hasOverlap ||
        old.isLocked != isLocked ||
        old.dragMode != dragMode ||
        old.existingRooms != existingRooms;
  }
}
