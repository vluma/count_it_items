// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointModel _$PointModelFromJson(Map<String, dynamic> json) => PointModel(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$PointModelToJson(PointModel instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      points: (json['points'] as List<dynamic>)
          .map((e) => PointModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemCount: (json['itemCount'] as num).toInt(),
      load: json['load'] as String,
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'points': instance.points,
      'itemCount': instance.itemCount,
      'load': instance.load,
    };
