import 'package:freezed_annotation/freezed_annotation.dart';
import 'room_entity.dart';

part 'space_entity.freezed.dart';

@freezed
class SpaceEntity with _$SpaceEntity {
  const factory SpaceEntity({
    required String id,                 // 空间唯一标识
    required String name,               // 空间名称（如：我的家）
    required List<RoomEntity> rooms,    // 房间列表
    required String description,        // 空间描述
    required int totalItems,            // 物品总数
    required DateTime lastUpdated,      // 最后更新时间
    @Default(0) double scale,           // 当前缩放比例
    @Default(0) double offsetX,         // 当前X偏移
    @Default(0) double offsetY,         // 当前Y偏移
  }) = _SpaceEntity;
}
