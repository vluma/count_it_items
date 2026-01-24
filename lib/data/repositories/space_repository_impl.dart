import 'package:count_it_items/domain/entities/room_entity.dart';
import 'package:count_it_items/domain/entities/space_entity.dart';
import 'package:count_it_items/domain/repositories/space_repository.dart';
import 'package:count_it_items/data/models/room_model.dart';
import 'package:count_it_items/data/models/space_model.dart';
import 'package:flutter/material.dart';

class SpaceRepositoryImpl implements SpaceRepository {
  // 模拟数据
  final SpaceModel _mockSpace = SpaceModel(
    id: 'space_001',
    name: '我的家',
    description: 'All is in order.',
    totalItems: 53,
    lastUpdated: DateTime.now().toIso8601String(),
    rooms: [
      RoomModel(
        id: 'room_001',
        name: '客厅',
        type: 'living_room',
        points: [
          PointModel(x: 100, y: 100),
          PointModel(x: 300, y: 100),
          PointModel(x: 300, y: 250),
          PointModel(x: 100, y: 250),
        ],
        itemCount: 15,
        load: 'normal',
      ),
      RoomModel(
        id: 'room_002',
        name: '厨房',
        type: 'kitchen',
        points: [
          PointModel(x: 300, y: 100),
          PointModel(x: 450, y: 100),
          PointModel(x: 450, y: 200),
          PointModel(x: 300, y: 200),
        ],
        itemCount: 25,
        load: 'crowded',
      ),
      RoomModel(
        id: 'room_003',
        name: '卧室',
        type: 'bedroom',
        points: [
          PointModel(x: 100, y: 250),
          PointModel(x: 300, y: 250),
          PointModel(x: 300, y: 400),
          PointModel(x: 100, y: 400),
        ],
        itemCount: 8,
        load: 'normal',
      ),
      RoomModel(
        id: 'room_004',
        name: '浴室',
        type: 'bathroom',
        points: [
          PointModel(x: 300, y: 250),
          PointModel(x: 400, y: 250),
          PointModel(x: 400, y: 400),
          PointModel(x: 300, y: 400),
        ],
        itemCount: 5,
        load: 'empty',
      ),
    ],
  );
  
  // 当前选中的房间ID
  String? _selectedRoomId;
  
  // 当前高亮的房间ID
  String? _highlightedRoomId;
  
  // 是否显示覆盖层
  bool _showOverlay = true;
  
  // 当前空间状态
  SpaceEntity? _currentSpace;
  
  @override
  Future<SpaceEntity> getSpaceData() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 500));
    
    // 如果已经有当前空间状态，返回它
    if (_currentSpace != null) {
      return _currentSpace!;
    }
    
    // 转换为领域实体
    final spaceEntity = _mockSpace.toEntity();
    
    // 保存当前空间状态
    _currentSpace = spaceEntity;
    
    return spaceEntity;
  }
  
  @override
  Future<RoomEntity> getRoomById(String roomId) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 200));
    
    // 从模拟数据中查找房间
    final roomModel = _mockSpace.rooms.firstWhere(
      (room) => room.id == roomId,
      orElse: () => throw Exception('Room not found'),
    );
    
    return roomModel.toEntity();
  }
  
  @override
  Future<RoomEntity> selectRoom(String roomId) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 200));
    
    // 更新选中状态
    _selectedRoomId = roomId;
    
    // 更新当前空间状态
    _currentSpace = _currentSpace?.copyWith(
      rooms: _currentSpace!.rooms.map((room) => room.copyWith(
        isSelected: room.id == roomId,
      )).toList(),
    );
    
    // 返回选中的房间
    return _currentSpace!.rooms.firstWhere((room) => room.id == roomId);
  }
  
  @override
  Future<RoomEntity> deselectRoom() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 200));
    
    // 保存当前选中的房间ID
    final previouslySelectedRoomId = _selectedRoomId;
    
    // 取消选中
    _selectedRoomId = null;
    
    // 更新当前空间状态
    _currentSpace = _currentSpace?.copyWith(
      rooms: _currentSpace!.rooms.map((room) => room.copyWith(
        isSelected: false,
      )).toList(),
    );
    
    // 返回之前选中的房间
    if (previouslySelectedRoomId != null) {
      return _currentSpace!.rooms.firstWhere((room) => room.id == previouslySelectedRoomId);
    }
    
    // 如果没有选中的房间，返回第一个房间
    return _currentSpace!.rooms.first;
  }
  
  @override
  Future<RoomEntity> highlightRoom(String roomId) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 200));
    
    // 更新高亮状态
    _highlightedRoomId = roomId;
    
    // 更新当前空间状态
    _currentSpace = _currentSpace?.copyWith(
      rooms: _currentSpace!.rooms.map((room) => room.copyWith(
        isHighlighted: room.id == roomId,
      )).toList(),
    );
    
    // 返回高亮的房间
    return _currentSpace!.rooms.firstWhere((room) => room.id == roomId);
  }
  
  @override
  Future<RoomEntity> unhighlightRoom() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 200));
    
    // 保存当前高亮的房间ID
    final previouslyHighlightedRoomId = _highlightedRoomId;
    
    // 取消高亮
    _highlightedRoomId = null;
    
    // 更新当前空间状态
    _currentSpace = _currentSpace?.copyWith(
      rooms: _currentSpace!.rooms.map((room) => room.copyWith(
        isHighlighted: false,
      )).toList(),
    );
    
    // 返回之前高亮的房间
    if (previouslyHighlightedRoomId != null) {
      return _currentSpace!.rooms.firstWhere((room) => room.id == previouslyHighlightedRoomId);
    }
    
    // 如果没有高亮的房间，返回第一个房间
    return _currentSpace!.rooms.first;
  }
  
  @override
  Future<void> toggleOverlay() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 200));
    
    // 切换覆盖层显示状态
    _showOverlay = !_showOverlay;
  }
  
  @override
  Future<List<RoomEntity>> search(String query) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 300));
    
    // 如果查询为空，返回所有房间
    if (query.isEmpty) {
      return _currentSpace?.rooms ?? _mockSpace.toEntity().rooms;
    }
    
    // 过滤房间
    final filteredRooms = (_currentSpace?.rooms ?? _mockSpace.toEntity().rooms)
      .where((room) => room.name.toLowerCase().contains(query.toLowerCase()))
      .toList();
    
    // 高亮匹配的房间
    _currentSpace = _currentSpace?.copyWith(
      rooms: _currentSpace!.rooms.map((room) => room.copyWith(
        isHighlighted: filteredRooms.any((filteredRoom) => filteredRoom.id == room.id),
      )).toList(),
    );
    
    return filteredRooms;
  }
  
  @override
  Future<void> updateSpaceTransform(double scale, double offsetX, double offsetY) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 100));
    
    // 更新当前空间状态
    _currentSpace = _currentSpace?.copyWith(
      scale: scale,
      offsetX: offsetX,
      offsetY: offsetY,
    );
  }
}
