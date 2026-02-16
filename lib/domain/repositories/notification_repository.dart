import 'package:youwu/domain/entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<List<NotificationEntity>> getNotifications();

  Future<List<NotificationEntity>> getUnreadNotifications();

  Future<int> getUnreadCount();

  Future<NotificationEntity> addNotification(NotificationEntity notification);

  Future<NotificationEntity> markAsRead(String notificationId);

  Future<void> markAllAsRead();

  Future<void> deleteNotification(String notificationId);

  Future<void> deleteAllNotifications();

  Stream<List<NotificationEntity>> watchNotifications();
}
