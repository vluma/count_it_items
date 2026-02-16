import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';

enum NotificationType {
  itemAdded,
  itemUpdated,
  itemDeleted,
  reminder,
  system,
}

@freezed
class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    required String id,
    required String title,
    required String message,
    required NotificationType type,
    @Default(false) bool isRead,
    required DateTime createdAt,
    String? relatedItemId,
    String? relatedRoomId,
    @Default({}) Map<String, dynamic> metadata,
  }) = _NotificationEntity;
}
