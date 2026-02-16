import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/domain/entities/room_entity.dart';
import 'dart:math' as math;

class RoomCanvasPage extends StatefulWidget {
  final List<RoomEntity> existingRooms;

  const RoomCanvasPage({
    super.key,
    required this.existingRooms,
  });

  @override
  State<RoomCanvasPage> createState() => _RoomCanvasPageState();
}

class _RoomCanvasPageState extends State<RoomCanvasPage> {
  List<_CanvasRoom> _rooms = [];
  _CanvasRoom? _selectedRoom;
  _CanvasRoom? _draggingRoom;
  _ResizeHandle? _activeHandle;
  Offset? _dragStart;
  Offset? _dragStartRoomPos;
  Rect? _dragStartRect;
  bool _hasOverlap = false;

  final TransformationController _transformController = TransformationController();
  static const double _gridSpacing = 20.0;
  static const double _minRoomSize = 60.0;
  static const double _handleSize = 12.0;

  @override
  void initState() {
    super.initState();
    _rooms = widget.existingRooms.map((room) => _CanvasRoom.fromEntity(room)).toList();
  }

  @override
  void dispose() {
    _transformController.dispose();
    super.dispose();
  }

  Offset _snapToGrid(Offset point) {
    return Offset(
      (point.dx / _gridSpacing).round() * _gridSpacing,
      (point.dy / _gridSpacing).round() * _gridSpacing,
    );
  }

  bool _checkRoomOverlap(_CanvasRoom room, {String? excludeId}) {
    for (final existingRoom in _rooms) {
      if (excludeId != null && existingRoom.id == excludeId) continue;
      if (_rectsOverlap(room.rect, existingRoom.rect)) {
        return true;
      }
    }
    return false;
  }

  bool _rectsOverlap(Rect a, Rect b) {
    final inflatedA = a.inflate(-0.1);
    final inflatedB = b.inflate(-0.1);
    return inflatedA.overlaps(inflatedB);
  }

  Offset _screenToCanvas(Offset screenPoint) {
    final transform = _transformController.value;
    final inverseTransform = Matrix4.inverted(transform);
    return MatrixUtils.transformPoint(inverseTransform, screenPoint);
  }

  _ResizeHandle? _getHandleAtPoint(Offset canvasPoint, _CanvasRoom room) {
    final handlePositions = _getHandlePositions(room);
    
    for (final entry in handlePositions.entries) {
      if ((entry.value - canvasPoint).distance <= _handleSize) {
        return entry.key;
      }
    }
    return null;
  }

  Map<_ResizeHandle, Offset> _getHandlePositions(_CanvasRoom room) {
    final rect = room.rect;
    return {
      _ResizeHandle.topLeft: rect.topLeft,
      _ResizeHandle.topRight: rect.topRight,
      _ResizeHandle.bottomLeft: rect.bottomLeft,
      _ResizeHandle.bottomRight: rect.bottomRight,
      _ResizeHandle.top: Offset(rect.center.dx, rect.top),
      _ResizeHandle.bottom: Offset(rect.center.dx, rect.bottom),
      _ResizeHandle.left: Offset(rect.left, rect.center.dy),
      _ResizeHandle.right: Offset(rect.right, rect.center.dy),
    };
  }

  void _handleTapDown(TapDownDetails details) {
    final canvasPoint = _snapToGrid(_screenToCanvas(details.localPosition));
    
    for (final room in _rooms) {
      if (room.rect.contains(canvasPoint)) {
        setState(() {
          _selectedRoom = room;
          _hasOverlap = false;
        });
        return;
      }
    }
    
    setState(() {
      _selectedRoom = null;
      _hasOverlap = false;
    });
  }

  void _handlePanStart(DragStartDetails details) {
    final canvasPoint = _snapToGrid(_screenToCanvas(details.localPosition));
    
    if (_selectedRoom != null && !_selectedRoom!.isLocked) {
      final handle = _getHandleAtPoint(canvasPoint, _selectedRoom!);
      if (handle != null) {
        setState(() {
          _activeHandle = handle;
          _dragStart = canvasPoint;
          _dragStartRect = _selectedRoom!.rect;
        });
        return;
      }
    }
    
    for (final room in _rooms) {
      if (room.isLocked) continue;
      if (room.rect.contains(canvasPoint)) {
        setState(() {
          _draggingRoom = room;
          _selectedRoom = room;
          _dragStart = canvasPoint;
          _dragStartRoomPos = room.rect.topLeft;
        });
        return;
      }
    }
    
    final snappedPoint = _snapToGrid(canvasPoint);
    final newRoom = _CanvasRoom(
      id: 'temp_${DateTime.now().millisecondsSinceEpoch}',
      name: '新房间',
      rect: Rect.fromLTWH(snappedPoint.dx, snappedPoint.dy, _gridSpacing * 4, _gridSpacing * 3),
    );
    
    if (!_checkRoomOverlap(newRoom)) {
      setState(() {
        _rooms.add(newRoom);
        _selectedRoom = newRoom;
        _hasOverlap = false;
      });
    }
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    final canvasPoint = _snapToGrid(_screenToCanvas(details.localPosition));
    
    if (_activeHandle != null && _selectedRoom != null && _dragStartRect != null) {
      final newRect = _calculateNewRect(_dragStartRect!, _activeHandle!, canvasPoint, _dragStart!);
      
      if (newRect.width >= _minRoomSize && newRect.height >= _minRoomSize) {
        final tempRoom = _CanvasRoom(
          id: _selectedRoom!.id,
          name: _selectedRoom!.name,
          rect: newRect,
          isLocked: _selectedRoom!.isLocked,
          color: _selectedRoom!.color,
        );
        
        setState(() {
          _hasOverlap = _checkRoomOverlap(tempRoom, excludeId: _selectedRoom!.id);
          if (!_hasOverlap) {
            final index = _rooms.indexWhere((r) => r.id == _selectedRoom!.id);
            if (index != -1) {
              _rooms[index] = tempRoom;
              _selectedRoom = tempRoom;
            }
          }
        });
      }
    } else if (_draggingRoom != null && _dragStartRoomPos != null) {
      final delta = canvasPoint - _dragStart!;
      final newRect = Rect.fromLTWH(
        _dragStartRoomPos!.dx + delta.dx,
        _dragStartRoomPos!.dy + delta.dy,
        _draggingRoom!.rect.width,
        _draggingRoom!.rect.height,
      );
      
      final tempRoom = _CanvasRoom(
        id: _draggingRoom!.id,
        name: _draggingRoom!.name,
        rect: newRect,
        isLocked: _draggingRoom!.isLocked,
        color: _draggingRoom!.color,
      );
      
      setState(() {
        _hasOverlap = _checkRoomOverlap(tempRoom, excludeId: _draggingRoom!.id);
        if (!_hasOverlap) {
          final index = _rooms.indexWhere((r) => r.id == _draggingRoom!.id);
          if (index != -1) {
            _rooms[index] = tempRoom;
            _selectedRoom = tempRoom;
          }
        }
      });
    }
  }

  Rect _calculateNewRect(Rect original, _ResizeHandle handle, Offset current, Offset start) {
    final delta = current - start;
    
    switch (handle) {
      case _ResizeHandle.topLeft:
        return Rect.fromLTRB(
          original.left + delta.dx,
          original.top + delta.dy,
          original.right,
          original.bottom,
        );
      case _ResizeHandle.topRight:
        return Rect.fromLTRB(
          original.left,
          original.top + delta.dy,
          original.right + delta.dx,
          original.bottom,
        );
      case _ResizeHandle.bottomLeft:
        return Rect.fromLTRB(
          original.left + delta.dx,
          original.top,
          original.right,
          original.bottom + delta.dy,
        );
      case _ResizeHandle.bottomRight:
        return Rect.fromLTRB(
          original.left,
          original.top,
          original.right + delta.dx,
          original.bottom + delta.dy,
        );
      case _ResizeHandle.top:
        return Rect.fromLTRB(
          original.left,
          original.top + delta.dy,
          original.right,
          original.bottom,
        );
      case _ResizeHandle.bottom:
        return Rect.fromLTRB(
          original.left,
          original.top,
          original.right,
          original.bottom + delta.dy,
        );
      case _ResizeHandle.left:
        return Rect.fromLTRB(
          original.left + delta.dx,
          original.top,
          original.right,
          original.bottom,
        );
      case _ResizeHandle.right:
        return Rect.fromLTRB(
          original.left,
          original.top,
          original.right + delta.dx,
          original.bottom,
        );
    }
  }

  void _handlePanEnd(DragEndDetails details) {
    setState(() {
      _draggingRoom = null;
      _dragStart = null;
      _dragStartRoomPos = null;
      _activeHandle = null;
      _dragStartRect = null;
      _hasOverlap = false;
    });
  }

  void _toggleLock(_CanvasRoom room) {
    setState(() {
      final index = _rooms.indexWhere((r) => r.id == room.id);
      if (index != -1) {
        _rooms[index] = _CanvasRoom(
          id: room.id,
          name: room.name,
          rect: room.rect,
          isLocked: !room.isLocked,
          color: room.color,
        );
        if (_selectedRoom?.id == room.id) {
          _selectedRoom = _rooms[index];
        }
      }
    });
  }

  void _deleteRoom(_CanvasRoom room) {
    setState(() {
      _rooms.removeWhere((r) => r.id == room.id);
      if (_selectedRoom?.id == room.id) {
        _selectedRoom = null;
      }
    });
  }

  void _confirmRooms() {
    if (_rooms.isEmpty) {
      Navigator.of(context).pop();
      return;
    }
    
    final lastRoom = _rooms.last;
    final points = [
      Offset(lastRoom.rect.left, lastRoom.rect.top),
      Offset(lastRoom.rect.right, lastRoom.rect.top),
      Offset(lastRoom.rect.right, lastRoom.rect.bottom),
      Offset(lastRoom.rect.left, lastRoom.rect.bottom),
    ];
    Navigator.of(context).pop(points);
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          '房间画布',
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
          if (_rooms.isNotEmpty)
            IconButton(
              icon: Icon(Icons.check_rounded, color: colors.primary),
              onPressed: _confirmRooms,
            ),
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTapDown: _handleTapDown,
            onPanStart: _handlePanStart,
            onPanUpdate: _handlePanUpdate,
            onPanEnd: _handlePanEnd,
            onLongPressStart: _handleLongPressStart,
            child: InteractiveViewer(
              transformationController: _transformController,
              boundaryMargin: const EdgeInsets.all(500),
              minScale: 0.3,
              maxScale: 3.0,
              child: SizedBox(
                width: 2000,
                height: 2000,
                child: CustomPaint(
                  painter: _RoomCanvasPainter(
                    rooms: _rooms,
                    selectedRoom: _selectedRoom,
                    activeHandle: _activeHandle,
                    hasOverlap: _hasOverlap,
                    colors: colors,
                    gridSpacing: _gridSpacing,
                    handleSize: _handleSize,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).padding.bottom + 16.h,
            child: _buildInstructions(colors),
          ),
          Positioned(
            right: 16.w,
            top: 16.h,
            child: _buildZoomControls(colors),
          ),
        ],
      ),
    );
  }

  void _handleLongPressStart(LongPressStartDetails details) {
    final canvasPoint = _screenToCanvas(details.localPosition);
    
    for (final room in _rooms) {
      if (room.rect.contains(canvasPoint)) {
        setState(() {
          _selectedRoom = room;
        });
        _showRoomContextMenu(room);
        return;
      }
    }
  }

  void _showRoomContextMenu(_CanvasRoom room) {
    final colors = AppColors.of(context);
    
    showModalBottomSheet(
      context: context,
      backgroundColor: colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: colors.border,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              room.name,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: colors.textPrimary,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              '尺寸: ${(room.rect.width / _gridSpacing).round()}×${(room.rect.height / _gridSpacing).round()} 格',
              style: TextStyle(
                fontSize: 14.sp,
                color: colors.textSecondary,
              ),
            ),
            if (room.isLocked)
              Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Text(
                  '已锁定',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: colors.warning,
                  ),
                ),
              ),
            SizedBox(height: 20.h),
            _buildContextMenuButton(
              colors,
              icon: room.isLocked ? Icons.lock_open_rounded : Icons.lock_rounded,
              label: room.isLocked ? '解锁房间' : '锁定房间',
              subtitle: room.isLocked ? '解锁后可移动和调整大小' : '锁定后位置和大小不可更改',
              color: colors.primary,
              onTap: () {
                Navigator.pop(context);
                _toggleLock(room);
              },
            ),
            _buildContextMenuButton(
              colors,
              icon: Icons.edit_rounded,
              label: '编辑房间',
              subtitle: '修改房间名称',
              color: colors.accent,
              onTap: () {
                Navigator.pop(context);
                _showEditRoomDialog(room);
              },
            ),
            _buildContextMenuButton(
              colors,
              icon: Icons.delete_rounded,
              label: '删除房间',
              subtitle: '移除此房间',
              color: colors.error,
              onTap: () {
                Navigator.pop(context);
                _showDeleteConfirmDialog(room);
              },
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }

  Widget _buildContextMenuButton(
    AppColorsData colors, {
    required IconData icon,
    required String label,
    String? subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 22.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: colors.textSecondary,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditRoomDialog(_CanvasRoom room) {
    final colors = AppColors.of(context);
    final controller = TextEditingController(text: room.name);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          '编辑房间',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: colors.textPrimary,
          ),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
            hintText: '输入房间名称',
            hintStyle: TextStyle(color: colors.textTertiary),
            filled: true,
            fillColor: colors.background,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(
            fontSize: 16.sp,
            color: colors.textPrimary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              '取消',
              style: TextStyle(color: colors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _updateRoomName(room, controller.text);
            },
            child: Text(
              '保存',
              style: TextStyle(color: colors.primary),
            ),
          ),
        ],
      ),
    );
  }

  void _updateRoomName(_CanvasRoom room, String newName) {
    setState(() {
      final index = _rooms.indexWhere((r) => r.id == room.id);
      if (index != -1) {
        _rooms[index] = _CanvasRoom(
          id: room.id,
          name: newName.isEmpty ? '房间' : newName,
          rect: room.rect,
          isLocked: room.isLocked,
          color: room.color,
        );
        if (_selectedRoom?.id == room.id) {
          _selectedRoom = _rooms[index];
        }
      }
    });
  }

  void _showDeleteConfirmDialog(_CanvasRoom room) {
    final colors = AppColors.of(context);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          '删除房间',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: colors.textPrimary,
          ),
        ),
        content: Text(
          '确定要删除「${room.name}」吗？',
          style: TextStyle(
            fontSize: 14.sp,
            color: colors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              '取消',
              style: TextStyle(color: colors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteRoom(room);
            },
            child: Text(
              '删除',
              style: TextStyle(color: colors.error),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructions(AppColorsData colors) {
    String instruction;
    Color iconColor = colors.primary;
    IconData iconData = Icons.info_outline_rounded;
    
    if (_hasOverlap) {
      instruction = '房间重叠，请调整位置';
      iconColor = colors.error;
      iconData = Icons.warning_rounded;
    } else if (_selectedRoom != null) {
      if (_selectedRoom!.isLocked) {
        instruction = '房间已锁定，长按解锁';
        iconData = Icons.lock_rounded;
      } else {
        instruction = '拖动调整位置，拖动角落调整大小';
        iconData = Icons.open_with_rounded;
      }
    } else {
      instruction = '点击空白处添加房间，点击房间选中，长按显示菜单';
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(iconData, color: iconColor, size: 20.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              instruction,
              style: TextStyle(
                fontSize: 14.sp,
                color: _hasOverlap ? colors.error : colors.textPrimary,
              ),
            ),
          ),
          if (_rooms.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                '${_rooms.length} 个房间',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: colors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildZoomControls(AppColorsData colors) {
    return Container(
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.1),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildZoomButton(colors, Icons.add_rounded, () {
            final matrix = _transformController.value.clone();
            matrix.scaleByDouble(1.2, 1.2, 1.2, 1.0);
            _transformController.value = matrix;
          }),
          Container(width: 1, height: 1, color: colors.border),
          _buildZoomButton(colors, Icons.remove_rounded, () {
            final matrix = _transformController.value.clone();
            matrix.scaleByDouble(0.8, 0.8, 0.8, 1.0);
            _transformController.value = matrix;
          }),
          Container(width: 1, height: 1, color: colors.border),
          _buildZoomButton(colors, Icons.fit_screen_rounded, () {
            _transformController.value = Matrix4.identity();
          }),
        ],
      ),
    );
  }

  Widget _buildZoomButton(AppColorsData colors, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        alignment: Alignment.center,
        child: Icon(icon, color: colors.textSecondary, size: 20.sp),
      ),
    );
  }
}

enum _ResizeHandle {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  top,
  bottom,
  left,
  right,
}

class _CanvasRoom {
  final String id;
  final String name;
  final Rect rect;
  final bool isLocked;
  final Color color;

  _CanvasRoom({
    required this.id,
    required this.name,
    required this.rect,
    this.isLocked = false,
    Color? color,
  }) : color = color ?? _generateColor();

  factory _CanvasRoom.fromEntity(RoomEntity entity) {
    if (entity.points.isEmpty) {
      return _CanvasRoom(
        id: entity.id,
        name: entity.name,
        rect: Rect.zero,
      );
    }
    
    double minX = entity.points.first.dx;
    double maxX = entity.points.first.dx;
    double minY = entity.points.first.dy;
    double maxY = entity.points.first.dy;
    
    for (final point in entity.points) {
      if (point.dx < minX) minX = point.dx;
      if (point.dx > maxX) maxX = point.dx;
      if (point.dy < minY) minY = point.dy;
      if (point.dy > maxY) maxY = point.dy;
    }
    
    return _CanvasRoom(
      id: entity.id,
      name: entity.name,
      rect: Rect.fromLTRB(minX, minY, maxX, maxY),
    );
  }

  static Color _generateColor() {
    final random = math.Random();
    return Color.fromARGB(
      255,
      150 + random.nextInt(100),
      150 + random.nextInt(100),
      150 + random.nextInt(100),
    );
  }
}

class _RoomCanvasPainter extends CustomPainter {
  final List<_CanvasRoom> rooms;
  final _CanvasRoom? selectedRoom;
  final _ResizeHandle? activeHandle;
  final bool hasOverlap;
  final AppColorsData colors;
  final double gridSpacing;
  final double handleSize;

  _RoomCanvasPainter({
    required this.rooms,
    this.selectedRoom,
    this.activeHandle,
    required this.hasOverlap,
    required this.colors,
    required this.gridSpacing,
    required this.handleSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawGrid(canvas, size);
    
    for (final room in rooms) {
      _drawRoom(canvas, room, isSelected: room.id == selectedRoom?.id);
    }
    
    if (selectedRoom != null && !selectedRoom!.isLocked) {
      _drawResizeHandles(canvas, selectedRoom!);
    }
  }

  void _drawGrid(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = colors.border.withValues(alpha: 0.15)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = colors.border.withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;

    for (double x = 0; x <= size.width; x += gridSpacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    
    for (double y = 0; y <= size.height; y += gridSpacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    for (double x = 0; x <= size.width; x += gridSpacing) {
      for (double y = 0; y <= size.height; y += gridSpacing) {
        canvas.drawCircle(Offset(x, y), 2, dotPaint);
      }
    }
  }

  void _drawRoom(Canvas canvas, _CanvasRoom room, {bool isSelected = false}) {
    if (room.rect.width < 1 || room.rect.height < 1) return;

    final roomColor = isSelected ? colors.primary : room.color;

    final fillPaint = Paint()
      ..color = roomColor.withValues(alpha: isSelected ? 0.2 : 0.15)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = roomColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = isSelected ? 2.5 : 1.5;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(room.rect, const Radius.circular(4)));

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, borderPaint);

    if (isSelected) {
      final glowPaint = Paint()
        ..color = roomColor.withValues(alpha: 0.15)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
      canvas.drawPath(path, glowPaint);
    }

    final textPainter = TextPainter(
      text: TextSpan(
        text: room.name,
        style: TextStyle(
          color: roomColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final center = room.rect.center;
    textPainter.paint(
      canvas,
      center.translate(-textPainter.width / 2, -textPainter.height / 2 - 8),
    );

    final sizeText = '${(room.rect.width / gridSpacing).round()}×${(room.rect.height / gridSpacing).round()}';
    final sizePainter = TextPainter(
      text: TextSpan(
        text: sizeText,
        style: TextStyle(
          color: roomColor.withValues(alpha: 0.7),
          fontSize: 10,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    sizePainter.paint(
      canvas,
      center.translate(-sizePainter.width / 2, -sizePainter.height / 2 + 8),
    );

    if (room.isLocked) {
      final lockPainter = TextPainter(
        text: TextSpan(
          text: '🔒',
          style: const TextStyle(fontSize: 14),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      lockPainter.paint(
        canvas,
        room.rect.topRight.translate(-lockPainter.width - 6, 6),
      );
    }
  }

  void _drawResizeHandles(Canvas canvas, _CanvasRoom room) {
    final handlePositions = {
      _ResizeHandle.topLeft: room.rect.topLeft,
      _ResizeHandle.topRight: room.rect.topRight,
      _ResizeHandle.bottomLeft: room.rect.bottomLeft,
      _ResizeHandle.bottomRight: room.rect.bottomRight,
      _ResizeHandle.top: Offset(room.rect.center.dx, room.rect.top),
      _ResizeHandle.bottom: Offset(room.rect.center.dx, room.rect.bottom),
      _ResizeHandle.left: Offset(room.rect.left, room.rect.center.dy),
      _ResizeHandle.right: Offset(room.rect.right, room.rect.center.dy),
    };

    for (final entry in handlePositions.entries) {
      final isActive = entry.key == activeHandle;
      final isCorner = entry.key == _ResizeHandle.topLeft ||
                       entry.key == _ResizeHandle.topRight ||
                       entry.key == _ResizeHandle.bottomLeft ||
                       entry.key == _ResizeHandle.bottomRight;
      
      final handlePaint = Paint()
        ..color = isActive ? colors.error : colors.primary
        ..style = PaintingStyle.fill;

      final borderPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      final size = isCorner ? handleSize : handleSize * 0.8;
      
      if (isCorner) {
        canvas.drawRect(
          Rect.fromCenter(center: entry.value, width: size, height: size),
          borderPaint,
        );
        canvas.drawRect(
          Rect.fromCenter(center: entry.value, width: size, height: size),
          handlePaint,
        );
      } else {
        canvas.drawCircle(entry.value, size / 2, borderPaint);
        canvas.drawCircle(entry.value, size / 2, handlePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _RoomCanvasPainter oldDelegate) {
    return oldDelegate.rooms != rooms ||
           oldDelegate.selectedRoom != selectedRoom ||
           oldDelegate.activeHandle != activeHandle ||
           oldDelegate.hasOverlap != hasOverlap;
  }
}
