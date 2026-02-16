import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/domain/entities/notification_entity.dart';
import 'package:youwu/shared/widgets/glass_card.dart';

class NotificationTile extends StatelessWidget {
  final NotificationEntity notification;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const NotificationTile({
    super.key,
    required this.notification,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return GlassCard(
      onTap: onTap,
      padding: EdgeInsets.all(16.w),
      backgroundColor: notification.isRead
          ? colors.surface.withValues(alpha: 0.3)
          : colors.primary.withValues(alpha: 0.1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIcon(colors),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        notification.title,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight:
                              notification.isRead ? FontWeight.w500 : FontWeight.w600,
                          color: colors.textPrimary,
                        ),
                      ),
                    ),
                    if (!notification.isRead)
                      Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: BoxDecoration(
                          color: colors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  notification.message,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: colors.textSecondary,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      _formatTime(notification.createdAt),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: colors.textSecondary.withValues(alpha: 0.7),
                      ),
                    ),
                    const Spacer(),
                    if (onDelete != null)
                      GestureDetector(
                        onTap: onDelete,
                        child: Icon(
                          Icons.delete_outline_rounded,
                          size: 18.sp,
                          color: colors.textSecondary.withValues(alpha: 0.7),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(AppColorsData colors) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: _getIconBackgroundColor(colors).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        _getIcon(),
        size: 20.sp,
        color: _getIconBackgroundColor(colors),
      ),
    );
  }

  IconData _getIcon() {
    switch (notification.type) {
      case NotificationType.itemAdded:
        return Icons.add_circle_outline_rounded;
      case NotificationType.itemUpdated:
        return Icons.edit_outlined;
      case NotificationType.itemDeleted:
        return Icons.delete_outline_rounded;
      case NotificationType.reminder:
        return Icons.alarm_outlined;
      case NotificationType.system:
        return Icons.info_outline_rounded;
    }
  }

  Color _getIconBackgroundColor(AppColorsData colors) {
    switch (notification.type) {
      case NotificationType.itemAdded:
        return Colors.green;
      case NotificationType.itemUpdated:
        return colors.primary;
      case NotificationType.itemDeleted:
        return colors.error;
      case NotificationType.reminder:
        return Colors.orange;
      case NotificationType.system:
        return colors.textSecondary;
    }
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 1) {
      return '刚刚';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes}分钟前';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}小时前';
    } else if (diff.inDays < 7) {
      return '${diff.inDays}天前';
    } else {
      return DateFormat('MM-dd HH:mm').format(time);
    }
  }
}
