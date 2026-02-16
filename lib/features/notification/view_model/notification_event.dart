import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youwu/domain/entities/notification_entity.dart';

part 'notification_event.freezed.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.loadNotifications() = LoadNotifications;

  const factory NotificationEvent.markAsRead({
    required String notificationId,
  }) = MarkAsRead;

  const factory NotificationEvent.markAllAsRead() = MarkAllAsRead;

  const factory NotificationEvent.deleteNotification({
    required String notificationId,
  }) = DeleteNotification;

  const factory NotificationEvent.deleteAllNotifications() = DeleteAllNotifications;

  const factory NotificationEvent.addNotification({
    required NotificationEntity notification,
  }) = AddNotification;

  const factory NotificationEvent.updateNotifications({
    required List<NotificationEntity> notifications,
  }) = UpdateNotifications;
}
