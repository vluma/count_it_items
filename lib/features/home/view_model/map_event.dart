import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youwu/domain/entities/room_entity.dart';

part 'map_event.freezed.dart';

@freezed
class MapEvent with _$MapEvent {
  const factory MapEvent.loadMap() = LoadMap;
  
  const factory MapEvent.selectRoom({required String roomId}) = SelectRoom;
  
  const factory MapEvent.deselectRoom() = DeselectRoom;
  
  const factory MapEvent.toggleOverlay() = ToggleOverlay;
  
  const factory MapEvent.search({required String query}) = Search;
  
  const factory MapEvent.clearSearch() = ClearSearch;
  
  const factory MapEvent.updateTransform({
    required double scale,
    required double offsetX,
    required double offsetY,
  }) = UpdateTransform;
  
  const factory MapEvent.doubleTapEmpty() = DoubleTapEmpty;
  
  const factory MapEvent.addRoom({required RoomEntity room}) = AddRoom;
  
  const factory MapEvent.updateRoom({required RoomEntity room}) = UpdateRoom;
  
  const factory MapEvent.deleteRoom({required String roomId}) = DeleteRoom;
  
  const factory MapEvent.updateRoomPoints({
    required String roomId,
    required List<Offset> points,
  }) = UpdateRoomPoints;
  
  const factory MapEvent.toggleEditMode() = ToggleEditMode;
}
