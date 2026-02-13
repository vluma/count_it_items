import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/domain/entities/item_entity.dart';

class ItemListTile extends StatelessWidget {
  final ItemEntity item;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ItemListTile({
    super.key,
    required this.item,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colors.border.withValues(alpha: 0.3)),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        leading: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: _getCategoryColor(colors).withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            _getCategoryIcon(),
            size: 20.sp,
            color: _getCategoryColor(colors),
          ),
        ),
        title: Text(
          item.name,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: colors.textPrimary,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              '数量: ${item.quantity}',
              style: TextStyle(
                fontSize: 12.sp,
                color: colors.textSecondary,
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                _getCategoryText(),
                style: TextStyle(
                  fontSize: 10.sp,
                  color: colors.primary,
                ),
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onEdit != null)
              IconButton(
                icon: Icon(
                  Icons.edit_outlined,
                  size: 18.sp,
                  color: colors.textSecondary,
                ),
                onPressed: onEdit,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            if (onDelete != null) ...[
              SizedBox(width: 8.w),
              IconButton(
                icon: Icon(
                  Icons.delete_outline_rounded,
                  size: 18.sp,
                  color: colors.error,
                ),
                onPressed: onDelete,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getCategoryColor(AppColorsData colors) {
    switch (item.category) {
      case ItemCategory.furniture:
        return colors.roomNormal;
      case ItemCategory.electronics:
        return colors.accent;
      case ItemCategory.clothing:
        return colors.primary;
      case ItemCategory.books:
        return colors.success;
      case ItemCategory.kitchenware:
        return colors.warning;
      case ItemCategory.decorations:
        return colors.roomCrowded;
      case ItemCategory.tools:
        return colors.textSecondary;
      case ItemCategory.other:
        return colors.textTertiary;
    }
  }

  IconData _getCategoryIcon() {
    switch (item.category) {
      case ItemCategory.furniture:
        return Icons.chair_outlined;
      case ItemCategory.electronics:
        return Icons.devices_outlined;
      case ItemCategory.clothing:
        return Icons.checkroom_outlined;
      case ItemCategory.books:
        return Icons.menu_book_outlined;
      case ItemCategory.kitchenware:
        return Icons.kitchen_outlined;
      case ItemCategory.decorations:
        return Icons.palette_outlined;
      case ItemCategory.tools:
        return Icons.build_outlined;
      case ItemCategory.other:
        return Icons.inventory_2_outlined;
    }
  }

  String _getCategoryText() {
    switch (item.category) {
      case ItemCategory.furniture:
        return '家具';
      case ItemCategory.electronics:
        return '电子';
      case ItemCategory.clothing:
        return '衣物';
      case ItemCategory.books:
        return '书籍';
      case ItemCategory.kitchenware:
        return '厨具';
      case ItemCategory.decorations:
        return '装饰';
      case ItemCategory.tools:
        return '工具';
      case ItemCategory.other:
        return '其他';
    }
  }
}
