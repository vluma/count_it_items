import 'dart:async';
import 'dart:developer';
import 'package:youwu/domain/entities/notification_entity.dart';
import 'package:youwu/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final List<NotificationEntity> _notifications = [];
  final _notificationsController = StreamController<List<NotificationEntity>>.broadcast();

  String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  NotificationRepositoryImpl() {
    _initializeSampleNotifications();
  }

  void _initializeSampleNotifications() {
    _notifications.addAll([
      NotificationEntity(
        id: _generateId(),
        title: '欢迎使用',
        message: '感谢使用物品管理应用，开始添加您的物品吧！',
        type: NotificationType.system,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      NotificationEntity(
        id: _generateId(),
        title: '物品提醒',
        message: '您有一段时间没有整理物品了，快来查看吧！',
        type: NotificationType.reminder,
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
    ]);
    _notificationsController.add(_notifications);
  }

  @override
  Future<List<NotificationEntity>> getNotifications() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return List.from(_notifications)
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  @override
  Future<List<NotificationEntity>> getUnreadNotifications() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _notifications.where((n) => !n.isRead).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  @override
  Future<int> getUnreadCount() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return _notifications.where((n) => !n.isRead).length;
  }

  @override
  Future<NotificationEntity> addNotification(NotificationEntity notification) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final newNotification = notification.copyWith(
      id: notification.id.isEmpty ? _generateId() : notification.id,
      createdAt: notification.createdAt,
    );
    _notifications.insert(0, newNotification);
    _notificationsController.add(_notifications);
    log('Notification added: ${newNotification.title}', name: 'NotificationRepository');
    return newNotification;
  }

  @override
  Future<NotificationEntity> markAsRead(String notificationId) async {
    await Future.delayed(const Duration(milliseconds: 50));
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index == -1) {
      throw Exception('Notification not found');
    }
    final updated = _notifications[index].copyWith(isRead: true);
    _notifications[index] = updated;
    _notificationsController.add(_notifications);
    return updated;
  }

  @override
  Future<void> markAllAsRead() async {
    await Future.delayed(const Duration(milliseconds: 100));
    for (int i = 0; i < _notifications.length; i++) {
      if (!_notifications[i].isRead) {
        _notifications[i] = _notifications[i].copyWith(isRead: true);
      }
    }
    _notificationsController.add(_notifications);
  }

  @override
  Future<void> deleteNotification(String notificationId) async {
    await Future.delayed(const Duration(milliseconds: 50));
    _notifications.removeWhere((n) => n.id == notificationId);
    _notificationsController.add(_notifications);
  }

  @override
  Future<void> deleteAllNotifications() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _notifications.clear();
    _notificationsController.add(_notifications);
  }

  @override
  Stream<List<NotificationEntity>> watchNotifications() {
    return _notificationsController.stream.map((notifications) =>
        List.from(notifications)..sort((a, b) => b.createdAt.compareTo(a.createdAt)));
  }

  void dispose() {
    _notificationsController.close();
  }
}
