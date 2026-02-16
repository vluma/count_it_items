import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youwu/domain/entities/notification_entity.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;

  const factory NotificationState.loading() = _Loading;

  const factory NotificationState.loaded({
    required List<NotificationEntity> notifications,
    required int unreadCount,
  }) = _Loaded;

  const factory NotificationState.error({
    required String message,
  }) = _Error;
}
