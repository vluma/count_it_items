// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      roomId: json['roomId'] as String,
      category: json['category'] as String,
      quantity: (json['quantity'] as num).toInt(),
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'roomId': instance.roomId,
      'category': instance.category,
      'quantity': instance.quantity,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isFavorite': instance.isFavorite,
    };
