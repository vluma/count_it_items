import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/domain/entities/room_entity.dart';
import 'package:youwu/features/home/view/room_form_page.dart';
import 'package:youwu/features/home/view_model/map_cubit.dart';

class RoomCard extends StatelessWidget {
  final RoomEntity room;

  const RoomCard({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final statusColor = _getStatusColor(room.load, colors);
    final statusText = _getStatusText(room.load);
    final roomIcon = _getRoomIcon(room.type);

    return GestureDetector(
      onTap: () => _navigateToEditPage(context),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: colors.card,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: room.isSelected ? colors.primary : colors.border.withValues(alpha: 0.5),
            width: room.isSelected ? 2 : 1,
          ),
          boxShadow: colors.cardShadow,
        ),
        child: Row(
          children: [
            _buildRoomIcon(roomIcon, statusColor, colors),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        room.name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: colors.textPrimary,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          statusText,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: statusColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        size: 14.sp,
                        color: colors.textSecondary,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '${room.itemCount} 件物品',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: colors.textSecondary,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Icon(
                        Icons.category_outlined,
                        size: 14.sp,
                        color: colors.textTertiary,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        room.type,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: colors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Icon(
              Icons.chevron_right_rounded,
              size: 20.sp,
              color: colors.textTertiary,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToEditPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: context.read<MapCubit>(),
          child: RoomFormPage(room: room),
        ),
      ),
    );
  }

  Widget _buildRoomIcon(IconData icon, Color statusColor, AppColorsData colors) {
    return Container(
      width: 52.w,
      height: 52.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            statusColor.withValues(alpha: 0.15),
            statusColor.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: statusColor.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Icon(
        icon,
        size: 24.sp,
        color: statusColor,
      ),
    );
  }

  Color _getStatusColor(SpaceLoadStatus status, AppColorsData colors) {
    switch (status) {
      case SpaceLoadStatus.empty:
        return colors.roomEmpty;
      case SpaceLoadStatus.normal:
        return colors.roomNormal;
      case SpaceLoadStatus.crowded:
        return colors.roomCrowded;
    }
  }

  String _getStatusText(SpaceLoadStatus status) {
    switch (status) {
      case SpaceLoadStatus.empty:
        return '空置';
      case SpaceLoadStatus.normal:
        return '正常';
      case SpaceLoadStatus.crowded:
        return '拥挤';
    }
  }

  IconData _getRoomIcon(String type) {
    switch (type.toLowerCase()) {
      case '卧室':
      case 'bedroom':
        return Icons.bed_rounded;
      case '厨房':
      case 'kitchen':
        return Icons.kitchen_rounded;
      case '客厅':
      case 'living room':
        return Icons.weekend_rounded;
      case '浴室':
      case 'bathroom':
        return Icons.bathtub_rounded;
      case '书房':
      case 'study':
        return Icons.menu_book_rounded;
      case '储藏室':
      case 'storage':
        return Icons.inventory_rounded;
      case '阳台':
      case 'balcony':
        return Icons.balcony_rounded;
      case '车库':
      case 'garage':
        return Icons.garage_rounded;
      default:
        return Icons.home_work_rounded;
    }
  }
}
