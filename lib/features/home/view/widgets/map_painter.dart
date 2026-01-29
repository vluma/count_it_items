import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/domain/entities/room_entity.dart';
import 'package:youwu/features/home/view_model/map_state.dart';

class MapPainter extends CustomPainter {
  final MapState state;
  final Function(String roomId) onRoomTap;
  final Color primaryColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color surfaceColor;

  MapPainter({
    required this.state,
    required this.onRoomTap,
    required this.primaryColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.surfaceColor,
  });

  static const double wallDepth = 12.0;
  static const double isoAngle = math.pi / 6;
  static const double cornerRadius = 8.0;
  static const double roomScale = 0.96; // 产生 4% 的间距

  @override
  void paint(Canvas canvas, Size size) {
    state.maybeWhen(
      success: (space, showOverlay, isSearching) {
        // --- 自动居中适配 ---
        final allPoints = <Offset>[];
        for (final room in space.rooms) {
          final center = _getCenter(room.points);
          final scaledPoints = room.points.map((p) => _shrinkPoint(p, center)).toList();
          allPoints.addAll(scaledPoints.map(_toIso));
        }
        
        final boundingBox = _calculateBoundingBox(allPoints);
        final centerX = (boundingBox.left + boundingBox.right) / 2;
        final centerY = (boundingBox.top + boundingBox.bottom) / 2;
        
        canvas.translate(
          size.width / 2 - centerX,
          size.height / 2 - centerY,
        );

        for (final room in space.rooms) {
          _drawRoomShadow(canvas, room);
        }

        for (final room in space.rooms) {
          _drawRoomWalls(canvas, room);
        }

        for (final room in space.rooms) {
          _drawRoomFloor(canvas, room);
          _drawRoomData(canvas, room);
        }
      },
      orElse: () {},
    );
  }

  // 将点向中心收缩，产生间距
  Offset _shrinkPoint(Offset p, Offset center) {
    return center + (p - center) * roomScale;
  }

  // 构建圆角路径
  Path _buildRoundedPath(List<Offset> points) {
    final path = Path();
    if (points.length < 3) return path;

    for (int i = 0; i < points.length; i++) {
      final p1 = points[i];
      final p2 = points[(i + 1) % points.length];
      final p3 = points[(i + 2) % points.length];

      // 计算向量
      final v1 = p1 - p2;
      final v2 = p3 - p2;

      // 归一化
      final v1n = v1 / v1.distance;
      final v2n = v2 / v2.distance;

      // 计算圆角切点偏移
      final double currentRadius = math.min(cornerRadius, math.min(v1.distance / 2, v2.distance / 2));
      
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
  
  // 计算所有点的边界框
  Rect _calculateBoundingBox(List<Offset> points) {
    if (points.isEmpty) {
      return Rect.zero;
    }
    
    double minX = points[0].dx;
    double maxX = points[0].dx;
    double minY = points[0].dy;
    double maxY = points[0].dy;
    
    for (final point in points) {
      if (point.dx < minX) minX = point.dx;
      if (point.dx > maxX) maxX = point.dx;
      if (point.dy < minY) minY = point.dy;
      if (point.dy > maxY) maxY = point.dy;
    }
    
    return Rect.fromLTRB(minX, minY, maxX, maxY);
  }

  // 2.5D 坐标转换
  Offset _toIso(Offset p) {
    return Offset(
      (p.dx - p.dy) * math.cos(isoAngle),
      (p.dx + p.dy) * math.sin(isoAngle),
    );
  }

  // 绘制数据层（解决“空”的问题）
  void _drawRoomData(Canvas canvas, RoomEntity room) {
    final center = _getCenter(room.points);
    final isoCenter = _toIso(center);

    // 1. 房间名称
    final textPainter = TextPainter(
      text: TextSpan(
        text: room.name.toUpperCase(),
        style: TextStyle(
          color: textPrimaryColor.withOpacity(0.8),
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(canvas, isoCenter.translate(-textPainter.width / 2, -25));

    // 2. 空间状态标识
    String statusText;
    switch (room.load) {
      case SpaceLoadStatus.empty:
        statusText = 'EMPTY';
        break;
      case SpaceLoadStatus.normal:
        statusText = 'COMFORTABLE';
        break;
      case SpaceLoadStatus.crowded:
        statusText = 'FULL';
        break;
    }
    
    final statusPainter = TextPainter(
      text: TextSpan(
        text: statusText,
        style: TextStyle(
          color: textSecondaryColor.withOpacity(0.6),
          fontSize: 7,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    
    statusPainter.paint(canvas, isoCenter.translate(-statusPainter.width / 2, -15));

    // 3. 数据支撑：物品数量
    if (room.itemCount > 0) {
      final countPainter = TextPainter(
        text: TextSpan(
          text: '${room.itemCount} ITEMS',
          style: TextStyle(
            color: textSecondaryColor.withOpacity(0.5),
            fontSize: 8,
            fontWeight: FontWeight.w500,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      
      countPainter.paint(canvas, isoCenter.translate(-countPainter.width / 2, 0));
    }

    // 4. 状态灯
    if (room.isSelected) {
      final dotPaint = Paint()..color = primaryColor;
      canvas.drawCircle(isoCenter.translate(0, -35), 2, dotPaint);
    }
    
    // 5. 空状态处理
    if (room.itemCount == 0) {
      _drawEmptyState(canvas, isoCenter);
    }
  }
  
  // 绘制空状态
  void _drawEmptyState(Canvas canvas, Offset center) {
    final plusPaint = Paint()
      ..color = textSecondaryColor.withOpacity(0.3)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    
    final size = 12.0;
    canvas.drawLine(
      center.translate(-size / 2, 0),
      center.translate(size / 2, 0),
      plusPaint,
    );
    canvas.drawLine(
      center.translate(0, -size / 2),
      center.translate(0, size / 2),
      plusPaint,
    );
  }

  void _drawRoomFloor(Canvas canvas, RoomEntity room) {
    final center = _getCenter(room.points);
    final List<Offset> isoPoints = room.points
        .map((p) => _toIso(_shrinkPoint(p, center)))
        .toList();
    
    final path = _buildRoundedPath(isoPoints);

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          room.isSelected ? Colors.white : surfaceColor,
          room.isSelected ? Colors.white.withOpacity(0.9) : surfaceColor.withOpacity(0.95),
        ],
      ).createShader(path.getBounds())
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);

    // 极细边框
    final borderPaint = Paint()
      ..color = room.isSelected 
          ? primaryColor.withOpacity(0.6) 
          : textPrimaryColor.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = room.isSelected ? 1.5 : 0.5;
    
    canvas.drawPath(path, borderPaint);
  }

  void _drawRoomWalls(Canvas canvas, RoomEntity room) {
    final center = _getCenter(room.points);
    final List<Offset> topPoints = room.points
        .map((p) => _toIso(_shrinkPoint(p, center)))
        .toList();
    final List<Offset> bottomPoints = room.points
        .map((p) => _toIso(_shrinkPoint(p.translate(0, wallDepth), center)))
        .toList();

    for (int i = 0; i < topPoints.length; i++) {
      int next = (i + 1) % topPoints.length;
      
      // 计算墙体方向以应用不同的阴影
      final vector = topPoints[next] - topPoints[i];
      final isRightWall = vector.dx > 0;

      final wallPaint = Paint()
        ..color = isRightWall 
            ? textPrimaryColor.withOpacity(0.08) // 右侧墙稍深
            : textPrimaryColor.withOpacity(0.04) // 左侧墙稍浅
        ..style = PaintingStyle.fill;

      Path wallPath = Path()
        ..moveTo(topPoints[i].dx, topPoints[i].dy)
        ..lineTo(topPoints[next].dx, topPoints[next].dy)
        ..lineTo(bottomPoints[next].dx, bottomPoints[next].dy)
        ..lineTo(bottomPoints[i].dx, bottomPoints[i].dy)
        ..close();
      canvas.drawPath(wallPath, wallPaint);
    }
  }

  void _drawRoomShadow(Canvas canvas, RoomEntity room) {
    final center = _getCenter(room.points);
    final List<Offset> shadowPoints = room.points
        .map((p) => _toIso(_shrinkPoint(p.translate(6, 6), center)))
        .toList();
    
    final path = _buildRoundedPath(shadowPoints);
    
    canvas.drawPath(
      path, 
      Paint()
        ..color = Colors.black.withOpacity(0.03)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12)
    );
  }

  Offset _getCenter(List<Offset> points) {
    if (points.isEmpty) return Offset.zero;
    double x = points.map((p) => p.dx).reduce((a, b) => a + b) / points.length;
    double y = points.map((p) => p.dy).reduce((a, b) => a + b) / points.length;
    return Offset(x, y);
  }

  @override
  bool shouldRepaint(covariant MapPainter oldDelegate) => oldDelegate.state != state;
}