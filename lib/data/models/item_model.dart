import 'package:json_annotation/json_annotation.dart';
import 'package:youwu/domain/entities/item_entity.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  final String id;
  final String name;
  final String roomId;
  final String category;
  final int quantity;
  final String description;
  final String createdAt;
  final String updatedAt;
  final bool isFavorite;

  ItemModel({
    required this.id,
    required this.name,
    required this.roomId,
    required this.category,
    required this.quantity,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.isFavorite,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  ItemEntity toEntity() => ItemEntity(
    id: id,
    name: name,
    roomId: roomId,
    category: _parseCategory(category),
    quantity: quantity,
    description: description,
    createdAt: DateTime.parse(createdAt),
    updatedAt: DateTime.parse(updatedAt),
    isFavorite: isFavorite,
  );

  factory ItemModel.fromEntity(ItemEntity entity) => ItemModel(
    id: entity.id,
    name: entity.name,
    roomId: entity.roomId,
    category: entity.category.name,
    quantity: entity.quantity,
    description: entity.description,
    createdAt: entity.createdAt.toIso8601String(),
    updatedAt: entity.updatedAt.toIso8601String(),
    isFavorite: entity.isFavorite,
  );

  static ItemCategory _parseCategory(String category) {
    switch (category) {
      case 'furniture':
        return ItemCategory.furniture;
      case 'electronics':
        return ItemCategory.electronics;
      case 'clothing':
        return ItemCategory.clothing;
      case 'books':
        return ItemCategory.books;
      case 'kitchenware':
        return ItemCategory.kitchenware;
      case 'decorations':
        return ItemCategory.decorations;
      case 'tools':
        return ItemCategory.tools;
      default:
        return ItemCategory.other;
    }
  }
}
