import 'package:youwu/domain/entities/item_entity.dart';

abstract class ItemRepository {
  Future<List<ItemEntity>> getItems();
  
  Future<List<ItemEntity>> getItemsByRoom(String roomId);
  
  Future<ItemEntity> getItemById(String itemId);
  
  Future<ItemEntity> addItem(ItemEntity item);
  
  Future<ItemEntity> updateItem(ItemEntity item);
  
  Future<void> deleteItem(String itemId);
  
  Future<List<ItemEntity>> searchItems(String query);
  
  Future<List<ItemEntity>> getItemsByCategory(ItemCategory category);
}
