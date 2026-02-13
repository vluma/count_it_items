import 'package:youwu/domain/entities/item_entity.dart';
import 'package:youwu/domain/repositories/item_repository.dart';
import 'package:youwu/data/models/item_model.dart';

class ItemRepositoryImpl implements ItemRepository {
  final List<ItemModel> _items = [
    ItemModel(
      id: 'item_001',
      name: '沙发',
      roomId: 'room_001',
      category: 'furniture',
      quantity: 1,
      description: '客厅三人座沙发',
      createdAt: DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      isFavorite: true,
    ),
    ItemModel(
      id: 'item_002',
      name: '电视机',
      roomId: 'room_001',
      category: 'electronics',
      quantity: 1,
      description: '55英寸智能电视',
      createdAt: DateTime.now().subtract(const Duration(days: 25)).toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      isFavorite: false,
    ),
    ItemModel(
      id: 'item_003',
      name: '冰箱',
      roomId: 'room_002',
      category: 'electronics',
      quantity: 1,
      description: '双开门冰箱',
      createdAt: DateTime.now().subtract(const Duration(days: 20)).toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      isFavorite: false,
    ),
    ItemModel(
      id: 'item_004',
      name: '床',
      roomId: 'room_003',
      category: 'furniture',
      quantity: 1,
      description: '双人床',
      createdAt: DateTime.now().subtract(const Duration(days: 15)).toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      isFavorite: true,
    ),
    ItemModel(
      id: 'item_005',
      name: '衣柜',
      roomId: 'room_003',
      category: 'furniture',
      quantity: 1,
      description: '六门衣柜',
      createdAt: DateTime.now().subtract(const Duration(days: 10)).toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      isFavorite: false,
    ),
    ItemModel(
      id: 'item_006',
      name: '毛巾',
      roomId: 'room_004',
      category: 'other',
      quantity: 5,
      description: '浴室毛巾',
      createdAt: DateTime.now().subtract(const Duration(days: 5)).toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      isFavorite: false,
    ),
  ];

  @override
  Future<List<ItemEntity>> getItems() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _items.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<ItemEntity>> getItemsByRoom(String roomId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _items
        .where((item) => item.roomId == roomId)
        .map((model) => model.toEntity())
        .toList();
  }

  @override
  Future<ItemEntity> getItemById(String itemId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final item = _items.firstWhere(
      (item) => item.id == itemId,
      orElse: () => throw Exception('Item not found'),
    );
    return item.toEntity();
  }

  @override
  Future<ItemEntity> addItem(ItemEntity item) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final model = ItemModel.fromEntity(item);
    _items.add(model);
    return model.toEntity();
  }

  @override
  Future<ItemEntity> updateItem(ItemEntity item) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index == -1) {
      throw Exception('Item not found');
    }
    final model = ItemModel.fromEntity(item);
    _items[index] = model;
    return model.toEntity();
  }

  @override
  Future<void> deleteItem(String itemId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _items.removeWhere((item) => item.id == itemId);
  }

  @override
  Future<List<ItemEntity>> searchItems(String query) async {
    await Future.delayed(const Duration(milliseconds: 200));
    if (query.isEmpty) {
      return _items.map((model) => model.toEntity()).toList();
    }
    return _items
        .where((item) =>
            item.name.toLowerCase().contains(query.toLowerCase()) ||
            item.description.toLowerCase().contains(query.toLowerCase()))
        .map((model) => model.toEntity())
        .toList();
  }

  @override
  Future<List<ItemEntity>> getItemsByCategory(ItemCategory category) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _items
        .where((item) => item.category == category.name)
        .map((model) => model.toEntity())
        .toList();
  }
}
