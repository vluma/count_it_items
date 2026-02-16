import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/features/notification/view_model/notification_cubit.dart';
import 'package:youwu/features/notification/view_model/notification_event.dart';
import 'package:youwu/features/notification/view_model/notification_state.dart';
import 'package:youwu/features/notification/view/widgets/notification_tile.dart';
import 'package:youwu/shared/widgets/glass_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colors.background,
          appBar: _buildAppBar(context, colors, state),
          body: state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (notifications, unreadCount) =>
                _buildNotificationList(context, colors, notifications),
            error: (message) => _buildErrorState(colors, message),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    AppColorsData colors,
    NotificationState state,
  ) {
    return AppBar(
      backgroundColor: colors.glass,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(
        '通知',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: colors.textPrimary,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 20.sp,
          color: colors.textPrimary,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        state.maybeWhen(
          loaded: (notifications, unreadCount) {
            if (notifications.isNotEmpty) {
              return TextButton(
                onPressed: () {
                  context.read<NotificationCubit>().add(
                        const NotificationEvent.markAllAsRead(),
                      );
                },
                child: Text(
                  '全部已读',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: colors.primary,
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
          orElse: () => const SizedBox.shrink(),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }

  Widget _buildNotificationList(
    BuildContext context,
    AppColorsData colors,
    List notifications,
  ) {
    if (notifications.isEmpty) {
      return _buildEmptyState(colors);
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<NotificationCubit>().add(
              const NotificationEvent.loadNotifications(),
            );
      },
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: NotificationTile(
              notification: notification,
              onTap: () {
                context.read<NotificationCubit>().add(
                      NotificationEvent.markAsRead(
                        notificationId: notification.id,
                      ),
                    );
              },
              onDelete: () {
                context.read<NotificationCubit>().add(
                      NotificationEvent.deleteNotification(
                        notificationId: notification.id,
                      ),
                    );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(AppColorsData colors) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none_rounded,
            size: 80.sp,
            color: colors.textSecondary.withValues(alpha: 0.5),
          ),
          SizedBox(height: 16.h),
          Text(
            '暂无通知',
            style: TextStyle(
              fontSize: 16.sp,
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '新的通知会显示在这里',
            style: TextStyle(
              fontSize: 14.sp,
              color: colors.textSecondary.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(AppColorsData colors, String message) {
    return Center(
      child: GlassCard(
        margin: EdgeInsets.symmetric(horizontal: 32.w),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 48.sp,
              color: colors.error,
            ),
            SizedBox(height: 16.h),
            Text(
              '加载失败',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: colors.textPrimary,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              message,
              style: TextStyle(
                fontSize: 14.sp,
                color: colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
