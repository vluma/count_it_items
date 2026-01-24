import 'package:flutter/material.dart';
import 'package:count_it_items/core/theme/app_colors.dart';
import 'package:count_it_items/domain/entities/room_entity.dart';
import 'package:count_it_items/features/home/view_model/map_state.dart';

class MapPainter extends CustomPainter {
  final MapState state;
  final Function(String roomId) onRoomTap;
  
  MapPainter({required this.state, required this.onRoomTap});

  @override
  void paint(Canvas canvas, Size size) {
    // 使用when方法处理不同状态
    state.when(
      initial: () {},
      loading: () {
        _drawSkeleton(canvas, size);
      },
      success: (space, showOverlay, isSearching) {
        // 绘制房间
        for (final room in space.rooms) {
          _drawRoom(canvas, room, size);
        }
        
        // 绘制物品数量气泡
        for (final room in space.rooms) {
          _drawItemCountBubble(canvas, room, size);
        }
      },
      error: (message) {
        _drawError(canvas, size, message);
      },
      roomSelected: (room) {},
      searchResult: (results) {},
    );
  }
  
  // 绘制骨架屏
  void _drawSkeleton(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    
    // 绘制房间轮廓缩影
    final rectangles = [
      Rect.fromLTWH(100, 100, 200, 150), // 客厅
      Rect.fromLTWH(300, 100, 150, 100), // 厨房
      Rect.fromLTWH(100, 250, 200, 150), // 卧室
      Rect.fromLTWH(300, 250, 100, 150), // 浴室
    ];
    
    for (final rect in rectangles) {
      canvas.drawRect(rect, paint);
    }
  }
  
  // 绘制房间
  void _drawRoom(Canvas canvas, RoomEntity room, Size size) {
    if (room.points.isEmpty) return;
    
    final path = Path();
    path.moveTo(room.points[0].dx, room.points[0].dy);
    
    for (int i = 1; i < room.points.length; i++) {
      path.lineTo(room.points[i].dx, room.points[i].dy);
    }
    
    path.close();
    
    // 填充颜色
    final fillPaint = Paint()
      ..color = room.isHighlighted 
          ? AppColors.primary.withOpacity(0.1) 
          : room.isSelected 
              ? AppColors.primary.withOpacity(0.15) 
              : AppColors.secondary.withOpacity(0.5);
    
    canvas.drawPath(path, fillPaint);
    
    // 边框颜色
    final strokePaint = Paint()
      ..color = room.isSelected 
          ? AppColors.highlight 
          : room.isHighlighted 
              ? AppColors.highlight 
              : AppColors.border;
    
    strokePaint.style = PaintingStyle.stroke;
    strokePaint.strokeWidth = room.isSelected ? 3 : 2;
    
    // 如果是选中状态，添加呼吸灯效果
    if (room.isSelected) {
      // 这里可以添加呼吸灯动画，暂时使用静态效果
      strokePaint.color = AppColors.highlight;
    }
    
    canvas.drawPath(path, strokePaint);
  }
  
  // 绘制物品数量气泡
  void _drawItemCountBubble(Canvas canvas, RoomEntity room, Size size) {
    if (room.points.isEmpty) return;
    
    // 计算房间中心点
    final center = _calculateCenter(room.points);
    
    // 气泡背景
    final bubblePaint = Paint()
      ..color = AppColors.primary.withOpacity(0.9);
    
    // 绘制圆形气泡
    final bubbleRadius = 20.0;
    canvas.drawCircle(center, bubbleRadius, bubblePaint);
    
    // 绘制物品数量
    final textPainter = TextPainter(
      text: TextSpan(
        text: room.itemCount.toString(),
        style: TextStyle(
          color: AppColors.onPrimary,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
    
    // 绘制房间名称
    final namePainter = TextPainter(
      text: TextSpan(
        text: room.name,
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    
    namePainter.layout();
    namePainter.paint(
      canvas,
      Offset(
        center.dx - namePainter.width / 2,
        center.dy + bubbleRadius + 8,
      ),
    );
  }
  
  // 绘制错误信息
  void _drawError(Canvas canvas, Size size, String message) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: message,
        style: TextStyle(
          color: AppColors.error,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    
    textPainter.layout(maxWidth: size.width - 48);
    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2,
      ),
    );
  }
  
  // 计算房间中心点
  Offset _calculateCenter(List<Offset> points) {
    if (points.isEmpty) return Offset.zero;
    
    double x = 0;
    double y = 0;
    
    for (final point in points) {
      x += point.dx;
      y += point.dy;
    }
    
    return Offset(x / points.length, y / points.length);
  }

  @override
  bool shouldRepaint(covariant MapPainter oldDelegate) {
    return oldDelegate.state != state;
  }
  
  // 检测点击位置是否在房间内
  @override
  bool? hitTest(Offset position) {
    bool? result;
    
    state.when(
      initial: () {},
      loading: () {},
      success: (space, showOverlay, isSearching) {
        for (final room in space.rooms) {
          if (_isPointInPolygon(position, room.points)) {
            onRoomTap(room.id);
            result = true;
            return result;
          }
        }
        result = false;
      },
      error: (message) {},
      roomSelected: (room) {},
      searchResult: (results) {},
    );
    
    return result;
  }
  
  // 检测点是否在多边形内
  bool _isPointInPolygon(Offset point, List<Offset> polygon) {
    if (polygon.isEmpty) return false;
    
    bool inside = false;
    int n = polygon.length;
    
    for (int i = 0, j = n - 1; i < n; j = i++) {
      if (((polygon[i].dy > point.dy) != (polygon[j].dy > point.dy)) &&
          (point.dx < (polygon[j].dx - polygon[i].dx) * (point.dy - polygon[i].dy) / 
              (polygon[j].dy - polygon[i].dy) + polygon[i].dx)) {
        inside = !inside;
      }
    }
    
    return inside;
  }
}
