import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youwu/domain/entities/space_entity.dart';
import 'package:youwu/domain/entities/room_entity.dart';
import 'package:youwu/domain/entities/item_entity.dart';

part 'map_state.freezed.dart';

@freezed
class MapState with _$MapState {
  const factory MapState.initial() = _Initial;
  
  const factory MapState.loading() = _Loading;
  
  const factory MapState.success({
    required SpaceEntity space,
    required bool showOverlay,
    required bool isSearching,
    @Default([]) List<ItemEntity> expiredItems,
    @Default([]) List<ItemEntity> expiringItems,
  }) = _Success;
  
  const factory MapState.error({
    required String message,
  }) = _Error;
  
  const factory MapState.roomSelected({
    required RoomEntity room,
  }) = _RoomSelected;
  
  const factory MapState.searchResult({
    required List<RoomEntity> results,
  }) = _SearchResult;
}
