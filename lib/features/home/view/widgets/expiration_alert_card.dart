import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/domain/entities/item_entity.dart';

class ExpirationAlertCard extends StatelessWidget {
  final List<ItemEntity> expiredItems;
  final List<ItemEntity> expiringItems;
  final VoidCallback? onTap;

  const ExpirationAlertCard({
    super.key,
    required this.expiredItems,
    required this.expiringItems,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final hasExpired = expiredItems.isNotEmpty;
    final hasExpiring = expiringItems.isNotEmpty;

    if (!hasExpired && !hasExpiring) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: hasExpired
              ? colors.error.withValues(alpha: 0.1)
              : colors.accent.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: hasExpired
                ? colors.error.withValues(alpha: 0.3)
                : colors.accent.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: hasExpired
                        ? colors.error.withValues(alpha: 0.15)
                        : colors.accent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    hasExpired
                        ? Icons.error_outline_rounded
                        : Icons.warning_amber_rounded,
                    size: 20.sp,
                    color: hasExpired ? colors.error : colors.accent,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hasExpired ? '物品过期提醒' : '物品即将过期',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: colors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        _buildSubtitle(),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16.sp,
                  color: colors.textSecondary,
                ),
              ],
            ),
            if (hasExpired && hasExpiring) ...[
              SizedBox(height: 12.h),
              Row(
                children: [
                  _buildBadge(
                    count: expiredItems.length,
                    label: '已过期',
                    color: colors.error,
                  ),
                  SizedBox(width: 8.w),
                  _buildBadge(
                    count: expiringItems.length,
                    label: '即将过期',
                    color: colors.accent,
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _buildSubtitle() {
    if (expiredItems.isNotEmpty && expiringItems.isNotEmpty) {
      return '${expiredItems.length}件已过期，${expiringItems.length}件即将过期';
    } else if (expiredItems.isNotEmpty) {
      return '${expiredItems.length}件物品已过期，请及时处理';
    } else {
      return '${expiringItems.length}件物品将在7天内过期';
    }
  }

  Widget _buildBadge({
    required int count,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$count',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          SizedBox(width: 4.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
