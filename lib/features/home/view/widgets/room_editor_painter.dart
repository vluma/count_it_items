import 'package:flutter/material.dart';
import 'package:youwu/domain/entities/room_entity.dart';
import 'package:youwu/core/theme/app_colors.dart';

class RoomEditorPainter extends CustomPainter {
  final List<RoomEntity> rooms;
  final String? selectedRoomId;
  final String? hoveredRoomId;
  final AppColorsData colors;
  
  static const double handleRadius = 6.0;

  RoomEditorPainter({
    required this.rooms,
    required this.selectedRoomId,
    required this.hoveredRoomId,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawGrid(canvas, size);

    for (final room in rooms) {
      if (room.points.isEmpty) continue;
      _drawRoom(canvas, room);
    }

    // Draw handles for selected room on top
    for (final room in rooms) {
      if (room.id == selectedRoomId && !room.isLocked) {
        _drawSelectionHandles(canvas, room);
      }
    }
  }

  void _drawGrid(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colors.border.withValues(alpha: 0.1)
      ..strokeWidth = 1;

    const double gridSize = 20.0;
    
    // Calculate visible bounds based on current transform
    // For simplicity without transform matrix here, we just draw a large enough grid
    // Or we rely on InteractiveViewer to scale the canvas
    for (double i = -5000; i < 5000; i += gridSize) {
      canvas.drawLine(Offset(i, -5000), Offset(i, 5000), paint);
      canvas.drawLine(Offset(-5000, i), Offset(5000, i), paint);
    }
    
    // Stronger origin lines
    final originPaint = Paint()
      ..color = colors.border.withValues(alpha: 0.3)
      ..strokeWidth = 2;
    canvas.drawLine(const Offset(0, -5000), const Offset(0, 5000), originPaint);
    canvas.drawLine(const Offset(-5000, 0), const Offset(5000, 0), originPaint);
  }

  void _drawRoom(Canvas canvas, RoomEntity room) {
    final path = Path();
    path.addPolygon(room.points, true);

    final isSelected = room.id == selectedRoomId;
    final isHovered = room.id == hoveredRoomId;

    // Fill
    final fillPaint = Paint()
      ..color = isSelected
          ? colors.primary.withValues(alpha: 0.3)
          : isHovered
              ? colors.surface.withValues(alpha: 0.8)
              : colors.surface.withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;
    
    if (room.isLocked) {
      fillPaint.color = colors.divider.withValues(alpha: 0.5);
    }

    canvas.drawPath(path, fillPaint);

    // Stroke
    final strokePaint = Paint()
      ..color = isSelected
          ? colors.primary
          : room.isLocked
              ? colors.textSecondary.withValues(alpha: 0.5)
              : colors.border
      ..style = PaintingStyle.stroke
      ..strokeWidth = isSelected ? 2.0 : 1.0;

    canvas.drawPath(path, strokePaint);

    // Name text
    final textPainter = TextPainter(
      text: TextSpan(
        text: room.name,
        style: TextStyle(
          color: isSelected ? colors.primary : colors.textPrimary,
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    
    final center = _getCenter(room.points);
    textPainter.paint(
      canvas,
      Offset(center.dx - textPainter.width / 2, center.dy - textPainter.height / 2),
    );

    // Lock icon
    if (room.isLocked) {
      final lockPainter = TextPainter(
        text: TextSpan(
          text: String.fromCharCode(Icons.lock.codePoint),
          style: TextStyle(
            color: colors.textSecondary,
            fontSize: 16,
            fontFamily: Icons.lock.fontFamily,
            package: Icons.lock.fontPackage,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      lockPainter.layout();
      lockPainter.paint(
        canvas,
        Offset(center.dx - lockPainter.width / 2, center.dy + textPainter.height / 2 + 4),
      );
    }
  }

  void _drawSelectionHandles(Canvas canvas, RoomEntity room) {
    if (room.isLocked) return;

    final handlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
      
    final handleStrokePaint = Paint()
      ..color = colors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (int i = 0; i < room.points.length; i++) {
      // Corner handle
      final cur = room.points[i];
      canvas.drawCircle(cur, handleRadius, handlePaint);
      canvas.drawCircle(cur, handleRadius, handleStrokePaint);

      // Edge midpoint handle
      final next = room.points[(i + 1) % room.points.length];
      final mid = Offset((cur.dx + next.dx) / 2, (cur.dy + next.dy) / 2);
      canvas.drawCircle(mid, handleRadius, handlePaint);
      canvas.drawCircle(mid, handleRadius, handleStrokePaint);
    }
  }

  Offset _getCenter(List<Offset> points) {
    if (points.isEmpty) return Offset.zero;
    double sumX = 0;
    double sumY = 0;
    for (final p in points) {
      sumX += p.dx;
      sumY += p.dy;
    }
    return Offset(sumX / points.length, sumY / points.length);
  }

  String? hitTestRoom(Offset localPosition) {
    // Check backwards to hit top-most rooms first
    for (int i = rooms.length - 1; i >= 0; i--) {
      final room = rooms[i];
      if (room.points.isEmpty) continue;
      
      final path = Path()..addPolygon(room.points, true);
      if (path.contains(localPosition)) {
        return room.id;
      }
    }
    return null;
  }

  // Returns { 'type': 'corner'|'edge', 'index': int, 'dragId': string }
  Map<String, dynamic>? hitTestHandle(Offset localPosition, RoomEntity room) {
    if (room.isLocked) return null;

    final points = room.points;
    for (int i = 0; i < points.length; i++) {
      // Corner
      if ((points[i] - localPosition).distance <= handleRadius * 2) {
        return {'type': 'corner', 'index': i};
      }
      
      // Edge
      final next = points[(i + 1) % points.length];
      final mid = Offset((points[i].dx + next.dx) / 2, (points[i].dy + next.dy) / 2);
      if ((mid - localPosition).distance <= handleRadius * 2) {
        return {'type': 'edge', 'index': i};
      }
    }
    return null;
  }

  @override
  bool shouldRepaint(covariant RoomEditorPainter oldDelegate) {
    return oldDelegate.rooms != rooms ||
           oldDelegate.selectedRoomId != selectedRoomId ||
           oldDelegate.hoveredRoomId != hoveredRoomId ||
           oldDelegate.colors != colors;
  }
}
