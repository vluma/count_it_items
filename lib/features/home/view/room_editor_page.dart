import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/domain/entities/room_entity.dart';
import 'package:youwu/features/home/view_model/map_cubit.dart';
import 'package:youwu/features/home/view_model/map_event.dart';
import 'package:youwu/features/home/view_model/map_state.dart';
import 'package:youwu/features/home/view/widgets/room_editor_painter.dart';
import 'package:uuid/uuid.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;

class RoomEditorPage extends StatefulWidget {
  const RoomEditorPage({super.key});

  @override
  State<RoomEditorPage> createState() => _RoomEditorPageState();
}

class _RoomEditorPageState extends State<RoomEditorPage> {
  String? _selectedRoomId;
  String? _hoveredRoomId;

  // Drag state
  String? _dragTargetId;
  String? _dragHandleType; // 'body', 'corner', 'edge'
  int? _dragHandleIndex;
  RoomEntity? _editingRoomTemp; // The room currently being dragged
  Offset? _dragStartLocal;
  List<Offset>? _initialPoints;

  final TransformationController _transformationController = TransformationController();
  final GlobalKey _customPaintKey = GlobalKey();

  static const double _snapDistance = 15.0;

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _addRoom(List<RoomEntity> existingRooms) {
    // Determine a position to add
    double baseX = 0;
    double baseY = 0;
    if (existingRooms.isNotEmpty) {
      // put it next to the last one
      final last = existingRooms.last;
      if (last.points.isNotEmpty) {
        baseX = last.points[1].dx + 20; // right of top-right
        baseY = last.points[0].dy;
      }
    }
    
    final newRoom = RoomEntity(
      id: const Uuid().v4(),
      name: '新房间\${existingRooms.length + 1}',
      type: 'other',
      itemCount: 0,
      load: SpaceLoadStatus.empty,
      points: [
        Offset(baseX, baseY),
        Offset(baseX + 150, baseY),
        Offset(baseX + 150, baseY + 100),
        Offset(baseX, baseY + 100),
      ],
    );
    context.read<MapCubit>().add(AddRoom(room: newRoom));
    setState(() {
      _selectedRoomId = newRoom.id;
    });
  }

  void _toggleLock(RoomEntity room) {
    final updated = room.copyWith(isLocked: !room.isLocked);
    context.read<MapCubit>().add(UpdateRoom(room: updated));
  }

  void _deleteRoom(String roomId) {
    context.read<MapCubit>().add(DeleteRoom(roomId: roomId));
    if (_selectedRoomId == roomId) {
      setState(() {
        _selectedRoomId = null;
      });
    }
  }

  RoomEntity? _getRoom(List<RoomEntity> rooms, String id) {
    try {
      return rooms.firstWhere((r) => r.id == id);
    } catch (_) {
      return null;
    }
  }

  Offset _getSnappedPos(Offset rawPos, List<RoomEntity> allRooms, String excludeId) {
    double snapX = rawPos.dx;
    double snapY = rawPos.dy;
    bool snappedX = false;
    bool snappedY = false;

    for (final r in allRooms) {
      if (r.id == excludeId) continue;
      for (final p in r.points) {
        if (!snappedX && (p.dx - rawPos.dx).abs() < _snapDistance) {
          snapX = p.dx;
          snappedX = true;
        }
        if (!snappedY && (p.dy - rawPos.dy).abs() < _snapDistance) {
          snapY = p.dy;
          snappedY = true;
        }
      }
    }
    return Offset(snapX, snapY);
  }

  // Calculate new points maintaining rectangle shape
  // points: [0:top-left, 1:top-right, 2:bottom-right, 3:bottom-left]
  List<Offset> _calculateResizedPoints(
    List<Offset> start, 
    String type, 
    int index, 
    Offset delta, 
    List<RoomEntity> allRooms, 
    String excludeId
  ) {
    List<Offset> res = List.from(start);
    
    if (type == 'body') {
      for (int i = 0; i < 4; i++) {
        res[i] += delta;
      }
      // Snap body using first point (top-left)
      final snapped = _getSnappedPos(res[0], allRooms, excludeId);
      final offsetDelta = snapped - res[0];
      for (int i = 0; i < 4; i++) {
        res[i] += offsetDelta;
      }
      return res;
    }

    if (type == 'corner') {
      final pToMove = res[index] + delta;
      final snapped = _getSnappedPos(pToMove, allRooms, excludeId);
      res[index] = snapped;

      if (index == 0) {
        res[1] = Offset(res[1].dx, snapped.dy);
        res[3] = Offset(snapped.dx, res[3].dy);
      } else if (index == 1) {
        res[0] = Offset(res[0].dx, snapped.dy);
        res[2] = Offset(snapped.dx, res[2].dy);
      } else if (index == 2) {
        res[1] = Offset(snapped.dx, res[1].dy);
        res[3] = Offset(res[3].dx, snapped.dy);
      } else if (index == 3) {
        res[0] = Offset(snapped.dx, res[0].dy);
        res[2] = Offset(res[2].dx, snapped.dy);
      }
      return res;
    }

    if (type == 'edge') {
      // index is the start point of edge
      if (index == 0) { // Top edge -> p0.y and p1.y
        final newY = start[0].dy + delta.dy;
        final snappedY = _getSnappedPos(Offset(0, newY), allRooms, excludeId).dy;
        res[0] = Offset(res[0].dx, snappedY);
        res[1] = Offset(res[1].dx, snappedY);
      } else if (index == 1) { // Right edge -> p1.x and p2.x
        final newX = start[1].dx + delta.dx;
        final snappedX = _getSnappedPos(Offset(newX, 0), allRooms, excludeId).dx;
        res[1] = Offset(snappedX, res[1].dy);
        res[2] = Offset(snappedX, res[2].dy);
      } else if (index == 2) { // Bottom edge -> p2.y and p3.y
        final newY = start[2].dy + delta.dy;
        final snappedY = _getSnappedPos(Offset(0, newY), allRooms, excludeId).dy;
        res[2] = Offset(res[2].dx, snappedY);
        res[3] = Offset(res[3].dx, snappedY);
      } else if (index == 3) { // Left edge -> p3.x and p0.x
        final newX = start[3].dx + delta.dx;
        final snappedX = _getSnappedPos(Offset(newX, 0), allRooms, excludeId).dx;
        res[3] = Offset(snappedX, res[3].dy);
        res[0] = Offset(snappedX, res[0].dy);
      }
      return res;
    }

    return res;
  }

  Offset _getLocalPos(Offset globalPos) {
    final RenderBox? box = _customPaintKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return globalPos;
    
    // We need to un-transform the global position to the interactive viewer's local coord
    final inverse = Matrix4.tryInvert(_transformationController.value);
    if (inverse == null) return globalPos;
    
    final localPosition = box.globalToLocal(globalPos);
    final vmath.Vector3 posVector = inverse.perspectiveTransform(vmath.Vector3(localPosition.dx, localPosition.dy, 0));
    return Offset(posVector.x, posVector.y);
  }

  void _onPointerHover(PointerEvent event, RoomEditorPainter painter) {
    final localPosition = _getLocalPos(event.position);
    String? hovered = painter.hitTestRoom(localPosition);
    if (_hoveredRoomId != hovered) {
      setState(() => _hoveredRoomId = hovered);
    }
  }

  void _onPanStart(DragStartDetails details, RoomEditorPainter painter, List<RoomEntity> rooms) {
    final localPosition = _getLocalPos(details.globalPosition);

    if (_selectedRoomId != null) {
      final selectedRoom = _getRoom(rooms, _selectedRoomId!);
      if (selectedRoom != null && !selectedRoom.isLocked) {
        final handleHit = painter.hitTestHandle(localPosition, selectedRoom);
        if (handleHit != null) {
          _dragTargetId = selectedRoom.id;
          _dragHandleType = handleHit['type'];
          _dragHandleIndex = handleHit['index'];
          _initialPoints = List.from(selectedRoom.points);
          _dragStartLocal = localPosition;
          _editingRoomTemp = selectedRoom.copyWith();
          return;
        }
      }
    }

    // Didn't hit handle, check body
    final hitId = painter.hitTestRoom(localPosition);
    if (hitId != null) {
      final hitRoom = _getRoom(rooms, hitId);
      if (hitRoom != null && !hitRoom.isLocked) {
        setState(() {
          _selectedRoomId = hitId;
          _dragTargetId = hitId;
          _dragHandleType = 'body';
          _dragStartLocal = localPosition;
          _initialPoints = List.from(hitRoom.points);
          _editingRoomTemp = hitRoom.copyWith();
        });
        return;
      }
      
      // Tap but locked
      setState(() {
        _selectedRoomId = hitId;
      });
      return;
    }

    // Tapped empty space
    setState(() {
      _selectedRoomId = null;
    });
  }

  void _onPanUpdate(DragUpdateDetails details, List<RoomEntity> allRooms) {
    if (_dragTargetId == null || _initialPoints == null || _dragStartLocal == null) return;
    
    final localPosition = _getLocalPos(details.globalPosition);
    final delta = localPosition - _dragStartLocal!;
    
    setState(() {
      final newPoints = _calculateResizedPoints(
        _initialPoints!,
        _dragHandleType!,
        _dragHandleIndex ?? 0,
        delta,
        allRooms,
        _dragTargetId!,
      );
      
      _editingRoomTemp = _editingRoomTemp?.copyWith(points: newPoints);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_dragTargetId != null && _editingRoomTemp != null) {
      context.read<MapCubit>().add(UpdateRoomPoints(roomId: _dragTargetId!, points: _editingRoomTemp!.points));
    }
    
    setState(() {
      _dragTargetId = null;
      _dragHandleType = null;
      _dragHandleIndex = null;
      _initialPoints = null;
      _dragStartLocal = null;
      _editingRoomTemp = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    
    return Scaffold(
      backgroundColor: colors.background,
      body: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          return state.maybeWhen(
            success: (space, showOverlay, isSearching, expiredItems, expiringItems) {
              List<RoomEntity> renderRooms = List.from(space.rooms);
              if (_editingRoomTemp != null) {
                final idx = renderRooms.indexWhere((r) => r.id == _editingRoomTemp!.id);
                if (idx >= 0) {
                  renderRooms[idx] = _editingRoomTemp!;
                }
              }

              final painter = RoomEditorPainter(
                rooms: renderRooms,
                selectedRoomId: _selectedRoomId,
                hoveredRoomId: _hoveredRoomId,
                colors: colors,
              );

              return Stack(
                children: [
                   // The main interactive editor
                  Listener(
                    onPointerHover: (ev) => _onPointerHover(ev, painter),
                    child: InteractiveViewer(
                      transformationController: _transformationController,
                      boundaryMargin: const EdgeInsets.all(5000),
                      minScale: 0.1,
                      maxScale: 5.0,
                      panEnabled: _dragTargetId == null, // Disable pan when dragging room
                      scaleEnabled: true,
                      child: GestureDetector(
                        onPanStart: (details) => _onPanStart(details, painter, renderRooms),
                        onPanUpdate: (details) => _onPanUpdate(details, space.rooms),
                        onPanEnd: _onPanEnd,
                        onPanCancel: () => _onPanEnd(DragEndDetails(primaryVelocity: 0)),
                        onTapUp: (details) {
                           // Try selecting without dragging
                           final hitId = painter.hitTestRoom(_getLocalPos(details.globalPosition));
                           setState(() {
                             _selectedRoomId = hitId;
                           });
                        },
                        child: CustomPaint(
                          key: _customPaintKey,
                          painter: painter,
                          size: Size.infinite,
                        ),
                      ),
                    ),
                  ),
                  
                  // Top Status / App Bar
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 10.h,
                    left: 20.w,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: colors.surface,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 4, offset: const Offset(0, 2))
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back, color: colors.textPrimary, size: 20),
                            SizedBox(width: 8.w),
                            Text("返回", style: TextStyle(color: colors.textPrimary)),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bottom Toolbar
                  Positioned(
                    bottom: MediaQuery.of(context).padding.bottom + 20.h,
                    left: 20.w,
                    right: 20.w,
                    child: _buildToolbar(colors, space.rooms),
                  ),
                ],
              );
            },
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget _buildToolbar(AppColorsData colors, List<RoomEntity> rooms) {
    RoomEntity? selectedRoom = _selectedRoomId != null ? _getRoom(rooms, _selectedRoomId!) : null;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildToolItem(
            icon: Icons.add_box_outlined,
            label: "添加房间",
            color: colors.primary,
            onTap: () => _addRoom(rooms),
          ),
          if (selectedRoom != null) 
            _buildToolItem(
              icon: selectedRoom.isLocked ? Icons.lock : Icons.lock_open,
              label: selectedRoom.isLocked ? "解锁" : "锁定",
              color: selectedRoom.isLocked ? colors.warning : selectedRoom.isLocked ? colors.border : colors.success,
              onTap: () => _toggleLock(selectedRoom),
            ),
          if (selectedRoom != null) 
            _buildToolItem(
              icon: Icons.delete_outline,
              label: "删除",
              color: colors.error,
              onTap: () => _deleteRoom(selectedRoom.id),
            ),
        ],
      ),
    );
  }

  Widget _buildToolItem({required IconData icon, required String label, required Color color, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 28.sp),
          SizedBox(height: 4.h),
          Text(label, style: TextStyle(color: color, fontSize: 12.sp)),
        ],
      ),
    );
  }
}
