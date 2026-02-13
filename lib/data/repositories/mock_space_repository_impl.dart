import 'package:youwu/domain/entities/room_entity.dart';
import 'package:youwu/domain/entities/space_entity.dart';
import 'package:youwu/domain/repositories/space_repository.dart';
import 'package:youwu/data/repositories/mock_space_repository.dart';

class MockSpaceRepositoryImpl implements SpaceRepository {
  late SpaceEntity _mockSpace;
  
  MockSpaceRepositoryImpl() {
    // 初始化假数据
    _mockSpace = MockSpaceRepository.getMockSpace();
  }
  
  @override
  Future<SpaceEntity> getSpaceData() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockSpace;
  }
  
  @override
  Future<RoomEntity> getRoomById(String roomId) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 100));
    return _mockSpace.rooms.firstWhere((room) => room.id == roomId);
  }
  
  @override
  Future<RoomEntity> selectRoom(String roomId) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 100));
    
    // 更新房间选择状态
    _mockSpace = _mockSpace.copyWith(
      rooms: _mockSpace.rooms.map((room) {
        return room.copyWith(
          isSelected: room.id == roomId,
        );
      }).toList(),
    );
    
    return _mockSpace.rooms.firstWhere((room) => room.id == roomId);
  }
  
  @override
  Future<RoomEntity> deselectRoom() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 100));
    
    // 更新房间选择状态
    _mockSpace = _mockSpace.copyWith(
      rooms: _mockSpace.rooms.map((room) {
        return room.copyWith(
          isSelected: false,
        );
      }).toList(),
    );
    
    return _mockSpace.rooms.first;
  }
  
  @override
  Future<RoomEntity> highlightRoom(String roomId) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 100));
    
    // 更新房间高亮状态
    _mockSpace = _mockSpace.copyWith(
      rooms: _mockSpace.rooms.map((room) {
        return room.copyWith(
          isHighlighted: room.id == roomId,
        );
      }).toList(),
    );
    
    return _mockSpace.rooms.firstWhere((room) => room.id == roomId);
  }
  
  @override
  Future<RoomEntity> unhighlightRoom() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 100));
    
    // 更新房间高亮状态
    _mockSpace = _mockSpace.copyWith(
      rooms: _mockSpace.rooms.map((room) {
        return room.copyWith(
          isHighlighted: false,
        );
      }).toList(),
    );
    
    return _mockSpace.rooms.first;
  }
  
  @override
  Future<void> toggleOverlay() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 100));
    // 这里可以添加覆盖层状态的更新逻辑
  }
  
  @override
  Future<List<RoomEntity>> search(String query) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 200));
    
    // 简单的搜索逻辑，匹配房间名称
    return _mockSpace.rooms.where((room) {
      return room.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
  
  @override
  Future<void> updateSpaceTransform(double scale, double offsetX, double offsetY) async {
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 50));
    
    // 更新空间变换数据
    _mockSpace = _mockSpace.copyWith(
      scale: scale,
      offsetX: offsetX,
      offsetY: offsetY,
    );
  }
  
  @override
  Future<RoomEntity> addRoom(RoomEntity room) async {
    await Future.delayed(const Duration(milliseconds: 100));
    
    final newRoom = room.copyWith(
      id: 'room_${DateTime.now().millisecondsSinceEpoch}',
    );
    
    _mockSpace = _mockSpace.copyWith(
      rooms: [..._mockSpace.rooms, newRoom],
      totalItems: _mockSpace.totalItems + newRoom.itemCount,
      lastUpdated: DateTime.now(),
    );
    
    return newRoom;
  }
  
  @override
  Future<RoomEntity> updateRoom(RoomEntity room) async {
    await Future.delayed(const Duration(milliseconds: 100));
    
    final oldRoom = _mockSpace.rooms.firstWhere((r) => r.id == room.id);
    final itemDiff = room.itemCount - oldRoom.itemCount;
    
    _mockSpace = _mockSpace.copyWith(
      rooms: _mockSpace.rooms.map((r) {
        return r.id == room.id ? room : r;
      }).toList(),
      totalItems: _mockSpace.totalItems + itemDiff,
      lastUpdated: DateTime.now(),
    );
    
    return room;
  }
  
  @override
  Future<void> deleteRoom(String roomId) async {
    await Future.delayed(const Duration(milliseconds: 100));
    
    final roomToDelete = _mockSpace.rooms.firstWhere((r) => r.id == roomId);
    
    _mockSpace = _mockSpace.copyWith(
      rooms: _mockSpace.rooms.where((r) => r.id != roomId).toList(),
      totalItems: _mockSpace.totalItems - roomToDelete.itemCount,
      lastUpdated: DateTime.now(),
    );
  }
}
