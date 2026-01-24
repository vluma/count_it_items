import 'package:json_annotation/json_annotation.dart';
import 'package:count_it_items/domain/entities/space_entity.dart';
import 'room_model.dart';

part 'space_model.g.dart';

// 空间数据模型
@JsonSerializable()
class SpaceModel {
  final String id;
  final String name;
  final List<RoomModel> rooms;
  final String description;
  final int totalItems;
  final String lastUpdated;
  
  SpaceModel({
    required this.id,
    required this.name,
    required this.rooms,
    required this.description,
    required this.totalItems,
    required this.lastUpdated,
  });
  
  factory SpaceModel.fromJson(Map<String, dynamic> json) => _$SpaceModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpaceModelToJson(this);
  
  // 转换为领域实体
  SpaceEntity toEntity() => SpaceEntity(
    id: id,
    name: name,
    rooms: rooms.map((room) => room.toEntity()).toList(),
    description: description,
    totalItems: totalItems,
    lastUpdated: DateTime.parse(lastUpdated),
  );
  
  // 从领域实体创建
  factory SpaceModel.fromEntity(SpaceEntity entity) => SpaceModel(
    id: entity.id,
    name: entity.name,
    rooms: entity.rooms.map((room) => RoomModel.fromEntity(room)).toList(),
    description: entity.description,
    totalItems: entity.totalItems,
    lastUpdated: entity.lastUpdated.toIso8601String(),
  );
}
