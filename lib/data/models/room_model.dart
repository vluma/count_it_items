import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:count_it_items/domain/entities/room_entity.dart';

part 'room_model.g.dart';

// 坐标点模型
@JsonSerializable()
class PointModel {
  final double x;
  final double y;
  
  PointModel({required this.x, required this.y});
  
  factory PointModel.fromJson(Map<String, dynamic> json) => _$PointModelFromJson(json);
  Map<String, dynamic> toJson() => _$PointModelToJson(this);
  
  // 转换为Offset
  Offset toOffset() => Offset(x, y);
  
  // 从Offset创建
  factory PointModel.fromOffset(Offset offset) => PointModel(
    x: offset.dx,
    y: offset.dy,
  );
}

// 房间数据模型
@JsonSerializable()
class RoomModel {
  final String id;
  final String name;
  final List<PointModel> points;
  final int itemCount;
  final String load;
  
  RoomModel({
    required this.id,
    required this.name,
    required this.points,
    required this.itemCount,
    required this.load,
  });
  
  factory RoomModel.fromJson(Map<String, dynamic> json) => _$RoomModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
  
  // 转换为领域实体
  RoomEntity toEntity() => RoomEntity(
    id: id,
    name: name,
    points: points.map((p) => p.toOffset()).toList(),
    itemCount: itemCount,
    load: _parseLoadStatus(load),
  );
  
  // 从领域实体创建
  factory RoomModel.fromEntity(RoomEntity entity) => RoomModel(
    id: entity.id,
    name: entity.name,
    points: entity.points.map((p) => PointModel.fromOffset(p)).toList(),
    itemCount: entity.itemCount,
    load: entity.load.name,
  );
  
  // 解析装载状态
  SpaceLoadStatus _parseLoadStatus(String load) {
    switch (load) {
      case 'empty':
        return SpaceLoadStatus.empty;
      case 'normal':
        return SpaceLoadStatus.normal;
      case 'crowded':
        return SpaceLoadStatus.crowded;
      default:
        return SpaceLoadStatus.normal;
    }
  }
}
