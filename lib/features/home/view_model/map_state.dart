import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:count_it_items/domain/entities/space_entity.dart';
import 'package:count_it_items/domain/entities/room_entity.dart';

part 'map_state.freezed.dart';

@freezed
class MapState with _$MapState {
  // 初始状态
  const factory MapState.initial() = _Initial;
  
  // 加载状态
  const factory MapState.loading() = _Loading;
  
  // 成功状态
  const factory MapState.success({
    required SpaceEntity space,
    required bool showOverlay,
    required bool isSearching,
  }) = _Success;
  
  // 错误状态
  const factory MapState.error({
    required String message,
  }) = _Error;
  
  // 房间选中状态
  const factory MapState.roomSelected({
    required RoomEntity room,
  }) = _RoomSelected;
  
  // 搜索状态
  const factory MapState.searchResult({
    required List<RoomEntity> results,
  }) = _SearchResult;
}
