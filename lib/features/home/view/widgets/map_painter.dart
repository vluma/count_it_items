import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:youwu/domain/entities/room_entity.dart';
import 'package:youwu/domain/entities/space_entity.dart';
import 'package:youwu/features/home/view_model/map_state.dart';
import 'package:youwu/core/theme/app_colors.dart';

class MapPainter extends CustomPainter {
  final MapState state;
  final Function(String roomId) onRoomTap;
  final AppColorsData colors;
  final bool isEditMode;

  MapPainter({
    required this.state,
    required this.onRoomTap,
    required this.colors,
    this.isEditMode = false,
  });

  static const double wallDepth = 12.0;
  static const double isoAngle = math.pi / 6;
  static const double cornerRadius = 12.0;
  static const double roomScale = 0.94;
  static const double editPointRadius = 8.0;

  @override
  void paint(Canvas canvas, Size size) {
    state.maybeWhen(
      success: (space, showOverlay, isSearching, expiredItems, expiringItems) {
        final allPoints = <Offset>[];
        for (final room in space.rooms) {
          final center = _getCenter(room.points);
          final scaledPoints = room.points
              .map((p) => _shrinkPoint(p, center))
              .toList();
          allPoints.addAll(scaledPoints.map(_toIso));
        }

        final boundingBox = _calculateBoundingBox(allPoints);
        final centerX = (boundingBox.left + boundingBox.right) / 2;
        final centerY = (boundingBox.top + boundingBox.bottom) / 2;

        canvas.translate(size.width / 2 - centerX, size.height / 2 - centerY);

        _drawAllRoomShadows(canvas, space);

        for (final room in space.rooms) {
          _drawRoomWalls(canvas, room);
        }

        for (final room in space.rooms) {
          _drawRoomFloor(canvas, room);
          _drawRoomData(canvas, room);
          if (isEditMode) {
            _drawEditPoints(canvas, room);
          }
        }
      },
      orElse: () {},
    );
  }

  Offset _shrinkPoint(Offset p, Offset center) {
    return center + (p - center) * roomScale;
  }

  Path _buildRoundedPath(List<Offset> points) {
    final path = Path();
    if (points.length < 3) return path;

    for (int i = 0; i < points.length; i++) {
      final p1 = points[i];
      final p2 = points[(i + 1) % points.length];
      final p3 = points[(i + 2) % points.length];

      final v1 = p1 - p2;
      final v2 = p3 - p2;

      final v1n = v1 / v1.distance;
      final v2n = v2 / v2.distance;

      final double currentRadius = math.min(
        cornerRadius,
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

  Offset _toIso(Offset p) {
    return Offset(
      (p.dx - p.dy) * math.cos(isoAngle),
      (p.dx + p.dy) * math.sin(isoAngle),
    );
  }

  void _drawRoomData(Canvas canvas, RoomEntity room) {
    final center = _getCenter(room.points);
    final isoCenter = _toIso(center);
    final statusColor = _getStatusColor(room.load);

    final textPainter = TextPainter(
      text: TextSpan(
        text: room.name,
        style: TextStyle(
          color: colors.textPrimary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(canvas, isoCenter.translate(-textPainter.width / 2, -30));

    final statusText = _getStatusText(room.load);
    final statusPainter = TextPainter(
      text: TextSpan(
        text: statusText,
        style: TextStyle(
          color: statusColor,
          fontSize: 9,
          fontWeight: FontWeight.w500,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    statusPainter.paint(
      canvas,
      isoCenter.translate(-statusPainter.width / 2, -16),
    );

    if (room.itemCount > 0) {
      final countPainter = TextPainter(
        text: TextSpan(
          text: '${room.itemCount} 件',
          style: TextStyle(
            color: colors.textSecondary,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      countPainter.paint(
        canvas,
        isoCenter.translate(-countPainter.width / 2, -2),
      );
    }

    if (room.isSelected) {
      final dotPaint = Paint()
        ..color = colors.primary
        ..style = PaintingStyle.fill;
      canvas.drawCircle(isoCenter.translate(0, -42), 4, dotPaint);

      final glowPaint = Paint()
        ..color = colors.primary.withValues(alpha: 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
      canvas.drawCircle(isoCenter.translate(0, -42), 8, glowPaint);
    }

    if (room.itemCount == 0) {
      _drawEmptyState(canvas, isoCenter);
    }
  }

  void _drawEmptyState(Canvas canvas, Offset center) {
    final plusPaint = Paint()
      ..color = colors.textTertiary.withValues(alpha: 0.4)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final size = 16.0;
    canvas.drawLine(
      center.translate(-size / 2, 12),
      center.translate(size / 2, 12),
      plusPaint,
    );
    canvas.drawLine(
      center.translate(0, 12 - size / 2),
      center.translate(0, 12 + size / 2),
      plusPaint,
    );
  }

  void _drawEditPoints(Canvas canvas, RoomEntity room) {
    final center = _getCenter(room.points);
    final List<Offset> isoPoints = room.points
        .map((p) => _toIso(_shrinkPoint(p, center)))
        .toList();

    for (final point in isoPoints) {
      final outerPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;
      canvas.drawCircle(point, editPointRadius + 2, outerPaint);

      final innerPaint = Paint()
        ..color = colors.primary
        ..style = PaintingStyle.fill;
      canvas.drawCircle(point, editPointRadius, innerPaint);
    }
  }

  void _drawRoomFloor(Canvas canvas, RoomEntity room) {
    final center = _getCenter(room.points);
    final List<Offset> isoPoints = room.points
        .map((p) => _toIso(_shrinkPoint(p, center)))
        .toList();

    final path = _buildRoundedPath(isoPoints);
    final statusColor = _getStatusColor(room.load);

    final paint = Paint()
      ..color = room.isSelected
          ? colors.primaryLight.withValues(alpha: 0.95)
          : statusColor.withValues(alpha: 0.12)
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);

    final borderPaint = Paint()
      ..color = room.isSelected
          ? colors.primary
          : statusColor.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = room.isSelected ? 2 : 1;

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

      final vector = topPoints[next] - topPoints[i];
      final isRightWall = vector.dx > 0;

      final wallPaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            isRightWall
                ? colors.textPrimary.withValues(alpha: 0.08)
                : colors.textPrimary.withValues(alpha: 0.04),
            isRightWall
                ? colors.textPrimary.withValues(alpha: 0.15)
                : colors.textPrimary.withValues(alpha: 0.1),
          ],
        ).createShader(Rect.fromPoints(topPoints[i], bottomPoints[i]))
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

  void _drawAllRoomShadows(Canvas canvas, SpaceEntity space) {
    if (space.rooms.isEmpty) return;

    final footprintPath = Path();

    for (final room in space.rooms) {
      final center = _getCenter(room.points);
      // Align shadow to the bottom of the walls (base of the room)
      final List<Offset> shadowPoints = room.points
          .map((p) => _toIso(_shrinkPoint(p.translate(0, wallDepth), center)))
          .toList();

      footprintPath.addPath(_buildRoundedPath(shadowPoints), Offset.zero);
    }

    canvas.save();
    
    // Create an inverted clip path to avoid darkening the transparent rooms
    // This ensures shadows only appear on the empty ground, not under any rooms.
    final clipOutPath = Path.combine(
      PathOperation.difference,
      Path()..addRect(const Rect.fromLTRB(-100000, -100000, 100000, 100000)),
      footprintPath,
    );
    canvas.clipPath(clipOutPath);

    // Draw a normal blurred shadow, shifted slightly to cast a drop shadow
    final shadowPath = footprintPath.shift(const Offset(4, 6));
    
    canvas.drawPath(
      shadowPath,
      Paint()
        ..color = colors.shadow.withValues(alpha: 0.3)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12),
    );

    canvas.restore();
  }

  Offset _getCenter(List<Offset> points) {
    if (points.isEmpty) return Offset.zero;
    double x = points.map((p) => p.dx).reduce((a, b) => a + b) / points.length;
    double y = points.map((p) => p.dy).reduce((a, b) => a + b) / points.length;
    return Offset(x, y);
  }

  Color _getStatusColor(SpaceLoadStatus status) {
    switch (status) {
      case SpaceLoadStatus.empty:
        return colors.roomEmpty;
      case SpaceLoadStatus.normal:
        return colors.roomNormal;
      case SpaceLoadStatus.crowded:
        return colors.roomCrowded;
    }
  }

  String _getStatusText(SpaceLoadStatus status) {
    switch (status) {
      case SpaceLoadStatus.empty:
        return '空置';
      case SpaceLoadStatus.normal:
        return '正常';
      case SpaceLoadStatus.crowded:
        return '拥挤';
    }
  }

  @override
  bool shouldRepaint(covariant MapPainter oldDelegate) {
    if (oldDelegate.colors != colors) return true;
    if (oldDelegate.isEditMode != isEditMode) return true;

    return oldDelegate.state != state;
  }

  String? hitTestRoom(Offset localPosition, Size size) {
    String? hitRoomId;

    state.maybeWhen(
      success: (space, showOverlay, isSearching, expiredItems, expiringItems) {
        final allPoints = <Offset>[];
        for (final room in space.rooms) {
          final center = _getCenter(room.points);
          final scaledPoints = room.points
              .map((p) => _shrinkPoint(p, center))
              .toList();
          allPoints.addAll(scaledPoints.map(_toIso));
        }

        final boundingBox = _calculateBoundingBox(allPoints);
        final centerX = (boundingBox.left + boundingBox.right) / 2;
        final centerY = (boundingBox.top + boundingBox.bottom) / 2;

        final translateX = size.width / 2 - centerX;
        final translateY = size.height / 2 - centerY;

        final canvasPoint = Offset(
          localPosition.dx - translateX,
          localPosition.dy - translateY,
        );

        // Iterate rooms in reverse order so the ones painted last (on top) are tested first.
        for (final room in space.rooms.reversed) {
          final center = _getCenter(room.points);

          // Test Floor
          final List<Offset> topPoints = room.points
              .map((p) => _toIso(_shrinkPoint(p, center)))
              .toList();

          final floorPath = _buildRoundedPath(topPoints);
          if (floorPath.contains(canvasPoint)) {
            hitRoomId = room.id;
            return; // Break out of maybeWhen block
          }

          // Test Walls
          final List<Offset> bottomPoints = room.points
              .map(
                (p) => _toIso(_shrinkPoint(p.translate(0, wallDepth), center)),
              )
              .toList();

          for (int i = 0; i < topPoints.length; i++) {
            int next = (i + 1) % topPoints.length;
            final wallPath = Path()
              ..moveTo(topPoints[i].dx, topPoints[i].dy)
              ..lineTo(topPoints[next].dx, topPoints[next].dy)
              ..lineTo(bottomPoints[next].dx, bottomPoints[next].dy)
              ..lineTo(bottomPoints[i].dx, bottomPoints[i].dy)
              ..close();

            if (wallPath.contains(canvasPoint)) {
              hitRoomId = room.id;
              return; // Break out of maybeWhen block
            }
          }
        }
      },
      orElse: () {},
    );

    return hitRoomId;
  }
}
