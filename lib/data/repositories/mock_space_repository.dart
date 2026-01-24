import 'package:flutter/material.dart';
import 'package:youwu/domain/entities/room_entity.dart';
import 'package:youwu/domain/entities/space_entity.dart';

class MockSpaceRepository {
  static SpaceEntity getMockSpace() {
    // 创建房间列表
    final rooms = [
      RoomEntity(
        id: 'room_kitchen',
        name: 'Kitchen',
        type: 'kitchen',
        points: [
          const Offset(0, 0),
          const Offset(100, 0),
          const Offset(100, 80),
          const Offset(0, 80),
        ],
        centerPoint: const Offset(50, 40),
        itemCount: 42,
        load: SpaceLoadStatus.normal,
        isSelected: false,
      ),
      RoomEntity(
        id: 'room_living',
        name: 'Living Room',
        type: 'living_room',
        points: [
          const Offset(100, 0),
          const Offset(250, 0),
          const Offset(250, 150),
          const Offset(100, 150),
        ],
        centerPoint: const Offset(175, 75),
        itemCount: 15,
        load: SpaceLoadStatus.normal,
        isSelected: true,
      ),
      RoomEntity(
        id: 'room_bedroom',
        name: 'Bedroom',
        type: 'bedroom',
        points: [
          const Offset(0, 80),
          const Offset(100, 80),
          const Offset(100, 200),
          const Offset(0, 200),
        ],
        centerPoint: const Offset(50, 140),
        itemCount: 8,
        load: SpaceLoadStatus.normal,
        isSelected: false,
      ),
      RoomEntity(
        id: 'room_bathroom',
        name: 'Bathroom',
        type: 'bathroom',
        points: [
          const Offset(100, 150),
          const Offset(180, 150),
          const Offset(180, 200),
          const Offset(100, 200),
        ],
        centerPoint: const Offset(140, 175),
        itemCount: 0,
        load: SpaceLoadStatus.empty,
        isSelected: false,
      ),
      RoomEntity(
        id: 'room_office',
        name: 'Office',
        type: 'office',
        points: [
          const Offset(180, 150),
          const Offset(250, 150),
          const Offset(250, 200),
          const Offset(180, 200),
        ],
        centerPoint: const Offset(215, 175),
        itemCount: 25,
        load: SpaceLoadStatus.crowded,
        isSelected: false,
      ),
    ];

    // 计算物品总数
    final totalItems = rooms.fold(0, (sum, room) => sum + room.itemCount);

    return SpaceEntity(
      id: 'home_01',
      name: 'My Apartment',
      description: 'Modern Minimalist Home',
      rooms: rooms,
      totalItems: totalItems,
      lastUpdated: DateTime.now(),
    );
  }
}
