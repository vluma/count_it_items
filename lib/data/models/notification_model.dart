import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:youwu/domain/entities/notification_entity.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String type;
  final bool isRead;
  final String createdAt;
  final String? relatedItemId;
  final String? relatedRoomId;
  final String? metadata;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.isRead,
    required this.createdAt,
    this.relatedItemId,
    this.relatedRoomId,
    this.metadata,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  NotificationEntity toEntity() => NotificationEntity(
        id: id,
        title: title,
        message: message,
        type: _parseType(type),
        isRead: isRead,
        createdAt: DateTime.parse(createdAt),
        relatedItemId: relatedItemId,
        relatedRoomId: relatedRoomId,
        metadata: metadata != null
            ? Map<String, dynamic>.from(jsonDecode(metadata!))
            : {},
      );

  factory NotificationModel.fromEntity(NotificationEntity entity) =>
      NotificationModel(
        id: entity.id,
        title: entity.title,
        message: entity.message,
        type: entity.type.name,
        isRead: entity.isRead,
        createdAt: entity.createdAt.toIso8601String(),
        relatedItemId: entity.relatedItemId,
        relatedRoomId: entity.relatedRoomId,
        metadata: entity.metadata.isNotEmpty ? jsonEncode(entity.metadata) : null,
      );

  static NotificationType _parseType(String type) {
    switch (type) {
      case 'itemAdded':
        return NotificationType.itemAdded;
      case 'itemUpdated':
        return NotificationType.itemUpdated;
      case 'itemDeleted':
        return NotificationType.itemDeleted;
      case 'reminder':
        return NotificationType.reminder;
      default:
        return NotificationType.system;
    }
  }
}
