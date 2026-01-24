import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:count_it_items/core/theme/app_colors.dart';
import 'package:count_it_items/domain/entities/room_entity.dart';
import 'package:count_it_items/features/home/view_model/map_state.dart';

class MapPainter extends CustomPainter {
  final MapState state;
  final Function(String roomId) onRoomTap;

  MapPainter({required this.state, required this.onRoomTap});

  static const double wallDepth = 10.0;
  static const double isoAngle = math.pi / 6;

  @override
  void paint(Canvas canvas, Size size) {
    state.maybeWhen(
      success: (space, showOverlay, isSearching) {
        // --- 自动居中适配 ---
        // 计算所有房间点的 BoundingBox
        final allPoints = <Offset>[];
        for (final room in space.rooms) {
          allPoints.addAll(room.points.map(_toIso));
        }
        
        // 计算 BoundingBox
        final boundingBox = _calculateBoundingBox(allPoints);
        
        // 计算图形中心点
        final centerX = (boundingBox.left + boundingBox.right) / 2;
        final centerY = (boundingBox.top + boundingBox.bottom) / 2;
        
        // 将图形中心点对齐到屏幕中心
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
          // 只有在没有搜索或者搜索匹配时才绘制文字
          _drawRoomData(canvas, room);
        }
      },
      orElse: () {},
    );
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
    final center = _getCenter(room.points.map(_toIso).toList());

    // 1. 房间名称（使用较小的字体，增强精致感）
    final textPainter = TextPainter(
      text: TextSpan(
        text: room.name.toUpperCase(),
        style: TextStyle(
          color: AppColors.textPrimary.withValues(alpha: 0.8),
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    // 将文字放置在房间中心偏上
    textPainter.paint(canvas, center.translate(-textPainter.width / 2, -25));

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
          color: AppColors.textSecondary.withValues(alpha: 0.6),
          fontSize: 7,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    
    statusPainter.paint(canvas, center.translate(-statusPainter.width / 2, -15));

    // 3. 数据支撑：物品数量（Badge 样式）
    if (room.itemCount > 0) {
      final countPainter = TextPainter(
        text: TextSpan(
          text: '${room.itemCount} ITEMS',
          style: TextStyle(
            color: AppColors.textSecondary.withValues(alpha: 0.5),
            fontSize: 8,
            fontWeight: FontWeight.w500,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      
      countPainter.paint(canvas, center.translate(-countPainter.width / 2, 0));
    }

    // 4. 状态灯：如果物品较多，显示一个克莱因蓝圆点
    if (room.isSelected) {
      final dotPaint = Paint()..color = AppColors.primary;
      canvas.drawCircle(center.translate(0, -35), 2, dotPaint);
    }
    
    // 5. 空状态处理：显示 + 号
    if (room.itemCount == 0) {
      _drawEmptyState(canvas, center);
    }
  }
  
  // 绘制空状态
  void _drawEmptyState(Canvas canvas, Offset center) {
    final plusPaint = Paint()
      ..color = AppColors.textSecondary.withValues(alpha: 0.3)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    
    // 绘制 + 号
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
    final Path path = Path();
    final List<Offset> isoPoints = room.points.map(_toIso).toList();
    path.addPolygon(isoPoints, true);

    final paint = Paint()
      ..color = room.isSelected ? Colors.white : AppColors.surface
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);

    // 极细边框
    final borderPaint = Paint()
      ..color = room.isSelected 
          ? AppColors.primary.withValues(alpha: 0.4) 
          : AppColors.textPrimary.withValues(alpha: 0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
    
    canvas.drawPath(path, borderPaint);
  }

  void _drawRoomWalls(Canvas canvas, RoomEntity room) {
    final List<Offset> topPoints = room.points.map(_toIso).toList();
    final List<Offset> bottomPoints = room.points.map((p) => _toIso(p.translate(0, wallDepth))).toList();

    final wallPaint = Paint()
      ..color = AppColors.textPrimary.withValues(alpha: 0.04)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < topPoints.length; i++) {
      int next = (i + 1) % topPoints.length;
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
    final List<Offset> shadowPoints = room.points.map((p) => _toIso(p.translate(5, 5))).toList();
    final Path path = Path()..addPolygon(shadowPoints, true);
    canvas.drawPath(path, Paint()..color = Colors.black.withValues(alpha: 0.02)..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10));
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