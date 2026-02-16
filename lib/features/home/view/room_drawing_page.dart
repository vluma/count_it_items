import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/domain/entities/room_entity.dart';
import 'dart:math' as math;

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
  List<Offset> _points = [];
  bool _isDrawing = true;
  int? _draggingPointIndex;
  bool _hasOverlap = false;
  static const double _pointRadius = 12.0;
  static const double _snapDistance = 20.0;
  static const double _isoAngle = math.pi / 6;
  static const double _gridSpacing = 30.0;

  @override
  void initState() {
    super.initState();
    if (widget.initialPoints != null && widget.initialPoints!.isNotEmpty) {
      _points = List.from(widget.initialPoints!);
      _isDrawing = false;
    }
  }

  Offset _toIso(Offset p) {
    return Offset(
      (p.dx - p.dy) * math.cos(_isoAngle),
      (p.dx + p.dy) * math.sin(_isoAngle),
    );
  }

  Offset _fromIso(Offset p) {
    final cosA = math.cos(_isoAngle);
    final sinA = math.sin(_isoAngle);
    return Offset(
      (p.dx / cosA + p.dy / sinA) / 2,
      (p.dy / sinA - p.dx / cosA) / 2,
    );
  }

  void _handleTap(TapDownDetails details, Size size) {
    if (!_isDrawing) return;

    final renderBox = context.findRenderObject() as RenderBox;
    final localPosition = renderBox.globalToLocal(details.globalPosition);

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final translatedPoint = Offset(
      localPosition.dx - centerX,
      localPosition.dy - centerY,
    );
    final gridPoint = _fromIso(translatedPoint);

    final snappedPoint = _snapToExistingPoints(gridPoint);

    setState(() {
      _points.add(snappedPoint);
      _hasOverlap = _checkOverlap();
    });
  }

  Offset _snapToExistingPoints(Offset point) {
    final snappedToGrid = _snapToGrid(point);
    
    for (final room in widget.existingRooms) {
      for (final existingPoint in room.points) {
        if ((existingPoint - snappedToGrid).distance < _snapDistance) {
          return existingPoint;
        }
      }
    }
    for (int i = 0; i < _points.length - 1; i++) {
      if ((_points[i] - snappedToGrid).distance < _snapDistance) {
        return _points[i];
      }
    }
    return snappedToGrid;
  }

  Offset _snapToGrid(Offset point) {
    final snappedX = (point.dx / _gridSpacing).round() * _gridSpacing;
    final snappedY = (point.dy / _gridSpacing).round() * _gridSpacing;
    return Offset(snappedX, snappedY);
  }

  bool _checkOverlap() {
    if (_points.length < 3) return false;
    
    for (final room in widget.existingRooms) {
      if (_polygonsOverlap(_points, room.points)) {
        return true;
      }
    }
    return false;
  }

  bool _polygonsOverlap(List<Offset> poly1, List<Offset> poly2) {
    for (int i = 0; i < poly1.length; i++) {
      final p1 = poly1[i];
      final p2 = poly1[(i + 1) % poly1.length];
      
      for (int j = 0; j < poly2.length; j++) {
        final p3 = poly2[j];
        final p4 = poly2[(j + 1) % poly2.length];
        
        if (_linesIntersect(p1, p2, p3, p4)) {
          return true;
        }
      }
    }
    
    if (_isPointInPolygon(poly1[0], poly2) || _isPointInPolygon(poly2[0], poly1)) {
      return true;
    }
    
    return false;
  }

  bool _linesIntersect(Offset p1, Offset p2, Offset p3, Offset p4) {
    double d1 = _direction(p3, p4, p1);
    double d2 = _direction(p3, p4, p2);
    double d3 = _direction(p1, p2, p3);
    double d4 = _direction(p1, p2, p4);

    if (((d1 > 0 && d2 < 0) || (d1 < 0 && d2 > 0)) &&
        ((d3 > 0 && d4 < 0) || (d3 < 0 && d4 > 0))) {
      return true;
    }

    if (d1 == 0 && _onSegment(p3, p4, p1)) return true;
    if (d2 == 0 && _onSegment(p3, p4, p2)) return true;
    if (d3 == 0 && _onSegment(p1, p2, p3)) return true;
    if (d4 == 0 && _onSegment(p1, p2, p4)) return true;

    return false;
  }

  double _direction(Offset pi, Offset pj, Offset pk) {
    return (pk.dx - pi.dx) * (pj.dy - pi.dy) - (pj.dx - pi.dx) * (pk.dy - pi.dy);
  }

  bool _onSegment(Offset pi, Offset pj, Offset pk) {
    return pk.dx >= math.min(pi.dx, pj.dx) &&
           pk.dx <= math.max(pi.dx, pj.dx) &&
           pk.dy >= math.min(pi.dy, pj.dy) &&
           pk.dy <= math.max(pi.dy, pj.dy);
  }

  bool _isPointInPolygon(Offset point, List<Offset> polygon) {
    int crossings = 0;
    for (int i = 0; i < polygon.length; i++) {
      final j = (i + 1) % polygon.length;
      if (((polygon[i].dy <= point.dy && polygon[j].dy > point.dy) ||
           (polygon[j].dy <= point.dy && polygon[i].dy > point.dy)) &&
          (point.dx < (polygon[j].dx - polygon[i].dx) * (point.dy - polygon[i].dy) /
              (polygon[j].dy - polygon[i].dy) + polygon[i].dx)) {
        crossings++;
      }
    }
    return crossings % 2 == 1;
  }

  void _finishDrawing() {
    if (_points.length >= 3 && !_hasOverlap) {
      setState(() {
        _isDrawing = false;
      });
    }
  }

  void _handlePanStart(DragStartDetails details, Size size) {
    if (_isDrawing) return;

    final renderBox = context.findRenderObject() as RenderBox;
    final localPosition = renderBox.globalToLocal(details.globalPosition);

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    for (int i = 0; i < _points.length; i++) {
      final isoPoint = _toIso(_points[i]);
      final screenPoint = Offset(
        isoPoint.dx + centerX,
        isoPoint.dy + centerY,
      );

      if ((screenPoint - localPosition).distance < _pointRadius * 1.5) {
        setState(() {
          _draggingPointIndex = i;
        });
        return;
      }
    }
  }

  void _handlePanUpdate(DragUpdateDetails details, Size size) {
    if (_draggingPointIndex == null) return;

    final renderBox = context.findRenderObject() as RenderBox;
    final localPosition = renderBox.globalToLocal(details.globalPosition);

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final translatedPoint = Offset(
      localPosition.dx - centerX,
      localPosition.dy - centerY,
    );
    final gridPoint = _fromIso(translatedPoint);

    setState(() {
      _points[_draggingPointIndex!] = _snapToExistingPoints(gridPoint);
      _hasOverlap = _checkOverlap();
    });
  }

  void _handlePanEnd(DragEndDetails details) {
    setState(() {
      _draggingPointIndex = null;
    });
  }

  void _resetDrawing() {
    setState(() {
      _points = [];
      _isDrawing = true;
      _hasOverlap = false;
    });
  }

  void _confirmDrawing() {
    if (_points.length >= 3) {
      Navigator.of(context).pop(_points);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          _isDrawing ? '绘制房间' : '调整房间',
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
          if (_points.isNotEmpty)
            IconButton(
              icon: Icon(Icons.refresh_rounded, color: colors.textSecondary),
              onPressed: _resetDrawing,
            ),
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTapDown: (details) => _handleTap(details, size),
            onPanStart: (details) => _handlePanStart(details, size),
            onPanUpdate: (details) => _handlePanUpdate(details, size),
            onPanEnd: _handlePanEnd,
            child: CustomPaint(
              painter: _RoomDrawingPainter(
                existingRooms: widget.existingRooms,
                points: _points,
                isDrawing: _isDrawing,
                draggingPointIndex: _draggingPointIndex,
                hasOverlap: _hasOverlap,
                colors: colors,
              ),
              size: Size.infinite,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).padding.bottom + 16.h,
            child: _buildBottomControls(colors),
          ),
          Positioned(
            left: 16.w,
            right: 16.w,
            top: 16.h,
            child: _buildInstructions(colors),
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
      instruction = '房间与现有房间重叠，请调整位置';
      iconColor = colors.error;
      iconData = Icons.warning_rounded;
    } else if (_isDrawing) {
      if (_points.isEmpty) {
        instruction = '点击地图添加第一个顶点';
      } else if (_points.length < 3) {
        instruction = '继续点击添加顶点（至少需要3个）';
      } else {
        instruction = '点击"完成绘制"或继续添加顶点';
      }
    } else {
      instruction = '拖拽顶点调整房间形状';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.9),
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
          Icon(
            iconData,
            color: iconColor,
            size: 20.sp,
          ),
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
          if (_points.isNotEmpty) ...[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: _hasOverlap 
                    ? colors.error.withValues(alpha: 0.1)
                    : colors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                '${_points.length} 个顶点',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: _hasOverlap ? colors.error : colors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBottomControls(AppColorsData colors) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: _points.isNotEmpty ? _resetDrawing : null,
              icon: Icon(Icons.refresh_rounded, size: 18.sp),
              label: Text(
                '重新绘制',
                style: TextStyle(fontSize: 14.sp),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: colors.textSecondary,
                side: BorderSide(color: colors.border),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: _points.length >= 3 && !_hasOverlap
                  ? (_isDrawing ? _finishDrawing : _confirmDrawing)
                  : null,
              icon: Icon(
                _isDrawing ? Icons.check_rounded : Icons.check_circle_rounded,
                size: 18.sp,
              ),
              label: Text(
                _isDrawing ? '完成绘制' : '确认形状',
                style: TextStyle(fontSize: 14.sp),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _hasOverlap ? colors.error : colors.primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: colors.border,
                padding: EdgeInsets.symmetric(vertical: 12.h),
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
}

class _RoomDrawingPainter extends CustomPainter {
  final List<RoomEntity> existingRooms;
  final List<Offset> points;
  final bool isDrawing;
  final int? draggingPointIndex;
  final bool hasOverlap;
  final AppColorsData colors;

  static const double _isoAngle = math.pi / 6;
  static const double _cornerRadius = 12.0;
  static const double _roomScale = 0.94;
  static const double _gridSpacing = 30.0;

  _RoomDrawingPainter({
    required this.existingRooms,
    required this.points,
    required this.isDrawing,
    this.draggingPointIndex,
    required this.hasOverlap,
    required this.colors,
  });

  Offset _toIso(Offset p) {
    return Offset(
      (p.dx - p.dy) * math.cos(_isoAngle),
      (p.dx + p.dy) * math.sin(_isoAngle),
    );
  }

  Offset _getCenter(List<Offset> pts) {
    if (pts.isEmpty) return Offset.zero;
    double x = pts.map((p) => p.dx).reduce((a, b) => a + b) / pts.length;
    double y = pts.map((p) => p.dy).reduce((a, b) => a + b) / pts.length;
    return Offset(x, y);
  }

  Offset _shrinkPoint(Offset p, Offset center) {
    return center + (p - center) * _roomScale;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    canvas.translate(centerX, centerY);

    _drawGrid(canvas, size);

    for (final room in existingRooms) {
      _drawExistingRoom(canvas, room);
    }

    if (points.isNotEmpty) {
      _drawNewRoom(canvas);
    }
  }

  void _drawGrid(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = colors.border.withValues(alpha: 0.3)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = colors.border.withValues(alpha: 0.6)
      ..style = PaintingStyle.fill;

    final gridRange = size.width.toInt();
    final spacing = _gridSpacing.toInt();

    for (int x = -gridRange; x <= gridRange; x += spacing) {
      for (int y = -gridRange; y <= gridRange; y += spacing) {
        final isoPoint = _toIso(Offset(x.toDouble(), y.toDouble()));
        canvas.drawCircle(isoPoint, 2, dotPaint);
      }
    }

    for (int i = -gridRange; i <= gridRange; i += spacing) {
      final start = _toIso(Offset(i.toDouble(), -gridRange.toDouble()));
      final end = _toIso(Offset(i.toDouble(), gridRange.toDouble()));
      canvas.drawLine(start, end, gridPaint);

      final start2 = _toIso(Offset(-gridRange.toDouble(), i.toDouble()));
      final end2 = _toIso(Offset(gridRange.toDouble(), i.toDouble()));
      canvas.drawLine(start2, end2, gridPaint);
    }
  }

  void _drawExistingRoom(Canvas canvas, RoomEntity room) {
    final center = _getCenter(room.points);
    final List<Offset> isoPoints = room.points
        .map((p) => _toIso(_shrinkPoint(p, center)))
        .toList();

    final path = _buildRoundedPath(isoPoints);

    final paint = Paint()
      ..color = colors.textPrimary.withValues(alpha: 0.05)
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, paint);

    final borderPaint = Paint()
      ..color = colors.border.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawPath(path, borderPaint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: room.name,
        style: TextStyle(
          color: colors.textTertiary,
          fontSize: 10,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    final isoCenter = _toIso(center);
    textPainter.paint(canvas, isoCenter.translate(-textPainter.width / 2, -5));
  }

  void _drawNewRoom(Canvas canvas) {
    final center = _getCenter(points);
    final List<Offset> isoPoints = points.map(_toIso).toList();

    final roomColor = hasOverlap ? colors.error : colors.primary;

    if (points.length >= 3) {
      final scaledPoints = points.map((p) => _shrinkPoint(p, center)).toList();
      final scaledIsoPoints = scaledPoints.map(_toIso).toList();
      final path = _buildRoundedPath(scaledIsoPoints);

      final fillPaint = Paint()
        ..color = roomColor.withValues(alpha: 0.15)
        ..style = PaintingStyle.fill;
      canvas.drawPath(path, fillPaint);

      final borderPaint = Paint()
        ..color = roomColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      canvas.drawPath(path, borderPaint);
    }

    final linePaint = Paint()
      ..color = roomColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < isoPoints.length; i++) {
      final p1 = isoPoints[i];
      final p2 = isoPoints[(i + 1) % isoPoints.length];
      if (i < isoPoints.length - 1 || !isDrawing) {
        canvas.drawLine(p1, p2, linePaint);
      }
    }

    for (int i = 0; i < isoPoints.length; i++) {
      final point = isoPoints[i];
      final isDragging = i == draggingPointIndex;

      final pointPaint = Paint()
        ..color = isDragging ? colors.error : roomColor
        ..style = PaintingStyle.fill;

      final outerPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;

      canvas.drawCircle(point, isDragging ? 14 : 10, outerPaint);
      canvas.drawCircle(point, isDragging ? 12 : 8, pointPaint);

      if (isDragging) {
        final glowPaint = Paint()
          ..color = colors.primary.withValues(alpha: 0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
        canvas.drawCircle(point, 18, glowPaint);
      }
    }

    final isoCenter = _toIso(center);
    final areaText = _calculateArea();
    final areaPainter = TextPainter(
      text: TextSpan(
        text: '${areaText.toStringAsFixed(1)} 平方单位',
        style: TextStyle(
          color: colors.primary,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    areaPainter.paint(canvas, isoCenter.translate(-areaPainter.width / 2, 10));
  }

  double _calculateArea() {
    if (points.length < 3) return 0;

    double area = 0;
    for (int i = 0; i < points.length; i++) {
      final j = (i + 1) % points.length;
      area += points[i].dx * points[j].dy;
      area -= points[j].dx * points[i].dy;
    }
    return (area / 2).abs();
  }

  Path _buildRoundedPath(List<Offset> pts) {
    final path = Path();
    if (pts.length < 3) return path;

    for (int i = 0; i < pts.length; i++) {
      final p1 = pts[i];
      final p2 = pts[(i + 1) % pts.length];
      final p3 = pts[(i + 2) % pts.length];

      final v1 = p1 - p2;
      final v2 = p3 - p2;

      final v1n = v1 / v1.distance;
      final v2n = v2 / v2.distance;

      final double currentRadius = math.min(
        _cornerRadius,
        math.min(v1.distance / 2, v2.distance / 2),
      );

      final cornerP1 = p2 + v1n * currentRadius;
      final cornerP2 = p2 + v2n * currentRadius;

      if (i == 0) {
        path.moveTo(cornerP1.dx, cornerP1.dy);
      } else {
        path.lineTo(cornerP1.dx, cornerP1.dy);
      }
      path.quadraticBezierTo(p2.dx, p2.dy, cornerP2.dx, cornerP2.dy);
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant _RoomDrawingPainter oldDelegate) {
    return oldDelegate.points != points ||
        oldDelegate.isDrawing != isDrawing ||
        oldDelegate.draggingPointIndex != draggingPointIndex;
  }
}
