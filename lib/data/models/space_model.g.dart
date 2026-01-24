// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpaceModel _$SpaceModelFromJson(Map<String, dynamic> json) => SpaceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String,
      totalItems: (json['totalItems'] as num).toInt(),
      lastUpdated: json['lastUpdated'] as String,
    );

Map<String, dynamic> _$SpaceModelToJson(SpaceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rooms': instance.rooms,
      'description': instance.description,
      'totalItems': instance.totalItems,
      'lastUpdated': instance.lastUpdated,
    };
