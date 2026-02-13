import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_entity.freezed.dart';

enum ItemCategory {
  furniture,
  electronics,
  clothing,
  books,
  kitchenware,
  decorations,
  tools,
  other,
}

@freezed
class ItemEntity with _$ItemEntity {
  const factory ItemEntity({
    required String id,
    required String name,
    required String roomId,
    required ItemCategory category,
    required int quantity,
    @Default('') String description,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isFavorite,
  }) = _ItemEntity;
}
