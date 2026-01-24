import 'package:count_it_items/domain/entities/room_entity.dart';
import 'package:count_it_items/domain/entities/space_entity.dart';

abstract class SpaceRepository {
  /// 获取空间数据
  Future<SpaceEntity> getSpaceData();
  
  /// 获取单个房间数据
  Future<RoomEntity> getRoomById(String roomId);
  
  /// 选择房间
  Future<RoomEntity> selectRoom(String roomId);
  
  /// 取消选择房间
  Future<RoomEntity> deselectRoom();
  
  /// 高亮房间
  Future<RoomEntity> highlightRoom(String roomId);
  
  /// 取消高亮房间
  Future<RoomEntity> unhighlightRoom();
  
  /// 切换覆盖层显示
  Future<void> toggleOverlay();
  
  /// 搜索房间或物品
  Future<List<RoomEntity>> search(String query);
  
  /// 更新空间缩放和偏移
  Future<void> updateSpaceTransform(double scale, double offsetX, double offsetY);
}
