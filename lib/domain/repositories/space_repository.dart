import 'package:flutter/material.dart';
import 'package:youwu/domain/entities/room_entity.dart';
import 'package:youwu/domain/entities/space_entity.dart';

abstract class SpaceRepository {
  Future<SpaceEntity> getSpaceData();
  
  Future<RoomEntity> getRoomById(String roomId);
  
  Future<RoomEntity> selectRoom(String roomId);
  
  Future<RoomEntity> deselectRoom();
  
  Future<RoomEntity> highlightRoom(String roomId);
  
  Future<RoomEntity> unhighlightRoom();
  
  Future<void> toggleOverlay();
  
  Future<List<RoomEntity>> search(String query);
  
  Future<void> updateSpaceTransform(double scale, double offsetX, double offsetY);
  
  Future<RoomEntity> addRoom(RoomEntity room);
  
  Future<RoomEntity> updateRoom(RoomEntity room);
  
  Future<void> deleteRoom(String roomId);
  
  Future<RoomEntity> updateRoomPoints(String roomId, List<Offset> points);
}
