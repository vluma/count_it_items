import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/domain/entities/room_entity.dart';
import 'package:youwu/features/home/view_model/map_cubit.dart';
import 'package:youwu/features/home/view_model/map_event.dart';

class RoomCard extends StatelessWidget {
  final RoomEntity room;

  const RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final statusColor = _getStatusColor(room.load, colors);
    final statusText = _getStatusText(room.load);
    final roomIcon = _getRoomIcon(room.type);

    return GestureDetector(
      onTap: () => _navigateToEditPage(context),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(18.w),
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: colors.card,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: room.isSelected
                ? colors.primary
                : colors.border.withValues(alpha: 0.3),
            width: room.isSelected ? 2 : 1.5,
          ),
          boxShadow: room.isSelected
              ? [
                  BoxShadow(
                    color: colors.primary.withValues(alpha: 0.15),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: colors.shadow.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
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
            Icon(Icons.chevron_right_rounded, size: 20.sp),
          ],
        ),
      ),
    );
  }

  void _navigateToEditPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
        ),
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: AppColors.of(context).background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          child: _EditRoomForm(room: room, mapCubit: context.read<MapCubit>()),
        ),
      ),
    );
  }

  Widget _buildRoomIcon(
    IconData icon,
    Color statusColor,
    AppColorsData colors,
  ) {
    return Container(
      width: 52.w,
      height: 52.w,
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: statusColor.withValues(alpha: 0.15),
          width: 1.5,
        ),
      ),
      child: Icon(icon, size: 24.sp, color: statusColor),
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

class _EditRoomForm extends StatefulWidget {
  final RoomEntity room;
  final MapCubit mapCubit;
  const _EditRoomForm({required this.room, required this.mapCubit});

  @override
  State<_EditRoomForm> createState() => _EditRoomFormState();
}

class _EditRoomFormState extends State<_EditRoomForm> {
  late TextEditingController _nameCtrl;
  late String _selectedType;

  final List<String> _roomTypes = [
    '卧室',
    '厨房',
    '客厅',
    '浴室',
    '书房',
    '储藏室',
    '阳台',
    '车库',
    '其他',
  ];

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.room.name);
    _selectedType = _roomTypes.contains(widget.room.type)
        ? widget.room.type
        : '其他';
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  void _save() {
    final updated = widget.room.copyWith(
      name: _nameCtrl.text.trim().isEmpty
          ? widget.room.name
          : _nameCtrl.text.trim(),
      type: _selectedType,
    );
    widget.mapCubit.add(UpdateRoom(room: updated));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '编辑房间信息',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: colors.textPrimary,
          ),
        ),
        SizedBox(height: 20.h),
        TextField(
          controller: _nameCtrl,
          decoration: InputDecoration(
            labelText: '房间名称',
            labelStyle: TextStyle(color: colors.textSecondary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        DropdownButtonFormField<String>(
          value: _selectedType,
          items: _roomTypes
              .map((t) => DropdownMenuItem(value: t, child: Text(t)))
              .toList(),
          onChanged: (val) {
            if (val != null) setState(() => _selectedType = val);
          },
          decoration: InputDecoration(
            labelText: '房间类型',
            labelStyle: TextStyle(color: colors.textSecondary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        ElevatedButton(
          onPressed: _save,
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.primary,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text('保存', style: TextStyle(fontSize: 16.sp)),
        ),
      ],
    );
  }
}
