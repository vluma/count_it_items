import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youwu/domain/repositories/notification_repository.dart';
import 'package:youwu/features/notification/view_model/notification_event.dart';
import 'package:youwu/features/notification/view_model/notification_state.dart';

class NotificationCubit extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository notificationRepository;
  StreamSubscription? _notificationSubscription;

  NotificationCubit({required this.notificationRepository})
      : super(const NotificationState.initial()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<MarkAsRead>(_onMarkAsRead);
    on<MarkAllAsRead>(_onMarkAllAsRead);
    on<DeleteNotification>(_onDeleteNotification);
    on<DeleteAllNotifications>(_onDeleteAllNotifications);
    on<AddNotification>(_onAddNotification);
    on<UpdateNotifications>(_onUpdateNotifications);

    _subscribeToNotifications();
  }

  void _subscribeToNotifications() {
    _notificationSubscription = notificationRepository.watchNotifications().listen(
      (notifications) {
        add(UpdateNotifications(notifications: notifications));
      },
      onError: (error) {
        log('Notification stream error: $error', name: 'NotificationCubit');
      },
    );
  }

  Future<void> _onLoadNotifications(
    LoadNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationState.loading());
    try {
      final notifications = await notificationRepository.getNotifications();
      final unreadCount = await notificationRepository.getUnreadCount();
      emit(NotificationState.loaded(
        notifications: notifications,
        unreadCount: unreadCount,
      ));
    } catch (e) {
      log('Load notifications error: $e', name: 'NotificationCubit');
      emit(NotificationState.error(message: e.toString()));
    }
  }

  Future<void> _onMarkAsRead(
    MarkAsRead event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      await notificationRepository.markAsRead(event.notificationId);
    } catch (e) {
      log('Mark as read error: $e', name: 'NotificationCubit');
    }
  }

  Future<void> _onMarkAllAsRead(
    MarkAllAsRead event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      await notificationRepository.markAllAsRead();
    } catch (e) {
      log('Mark all as read error: $e', name: 'NotificationCubit');
    }
  }

  Future<void> _onDeleteNotification(
    DeleteNotification event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      await notificationRepository.deleteNotification(event.notificationId);
    } catch (e) {
      log('Delete notification error: $e', name: 'NotificationCubit');
    }
  }

  Future<void> _onDeleteAllNotifications(
    DeleteAllNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      await notificationRepository.deleteAllNotifications();
    } catch (e) {
      log('Delete all notifications error: $e', name: 'NotificationCubit');
    }
  }

  Future<void> _onAddNotification(
    AddNotification event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      await notificationRepository.addNotification(event.notification);
    } catch (e) {
      log('Add notification error: $e', name: 'NotificationCubit');
    }
  }

  void _onUpdateNotifications(
    UpdateNotifications event,
    Emitter<NotificationState> emit,
  ) {
    emit(NotificationState.loaded(
      notifications: event.notifications,
      unreadCount: event.notifications.where((n) => !n.isRead).length,
    ));
  }

  @override
  Future<void> close() {
    _notificationSubscription?.cancel();
    return super.close();
  }
}
