import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_event.freezed.dart';

@freezed
class MapEvent with _$MapEvent {
  // 加载地图事件
  const factory MapEvent.loadMap() = LoadMap;
  
  // 选择房间事件
  const factory MapEvent.selectRoom({required String roomId}) = SelectRoom;
  
  // 取消选择房间事件
  const factory MapEvent.deselectRoom() = DeselectRoom;
  
  // 切换覆盖层事件
  const factory MapEvent.toggleOverlay() = ToggleOverlay;
  
  // 搜索事件
  const factory MapEvent.search({required String query}) = Search;
  
  // 清除搜索事件
  const factory MapEvent.clearSearch() = ClearSearch;
  
  // 更新空间变换事件（缩放、平移）
  const factory MapEvent.updateTransform({
    required double scale,
    required double offsetX,
    required double offsetY,
  }) = UpdateTransform;
  
  // 双击空白处事件
  const factory MapEvent.doubleTapEmpty() = DoubleTapEmpty;
}
