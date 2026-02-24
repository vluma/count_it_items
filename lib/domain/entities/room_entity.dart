import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'room_entity.freezed.dart';

// 房间装载状态枚举
enum SpaceLoadStatus {
  empty,      // 空房间
  normal,     // 正常状态
  crowded,    // 拥挤状态
}

@freezed
class RoomEntity with _$RoomEntity {
  const factory RoomEntity({
    required String id,               // 房间唯一标识
    required String name,             // 房间名称
    required String type,             // 房间类型（卧室、厨房等）
    required List<Offset> points,     // 房间多边形坐标点
    required int itemCount,           // 物品数量
    required SpaceLoadStatus load,    // 装载状态
    @Default(Offset.zero) Offset centerPoint, // 预计算的中心点
    @Default(false) bool isSelected,  // 是否被选中
    @Default(false) bool isHighlighted, // 是否被高亮
    @Default(true) bool isLocked,    // 是否锁定，锁定后不能移动、修改大小或删除
  }) = _RoomEntity;
}
