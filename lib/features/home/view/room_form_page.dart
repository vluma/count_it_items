import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/domain/entities/room_entity.dart';
import 'package:youwu/features/home/view_model/map_cubit.dart';
import 'package:youwu/features/home/view_model/map_event.dart';
import 'package:youwu/shared/widgets/glass_card.dart';

class RoomFormPage extends StatefulWidget {
  final RoomEntity? room;
  
  const RoomFormPage({super.key, this.room});
  
  @override
  State<RoomFormPage> createState() => _RoomFormPageState();
}

class _RoomFormPageState extends State<RoomFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _itemCountController;
  
  String _selectedType = '卧室';
  SpaceLoadStatus _selectedStatus = SpaceLoadStatus.normal;
  
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
  
  bool get _isEditing => widget.room != null;
  
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.room?.name ?? '');
    _itemCountController = TextEditingController(
      text: widget.room?.itemCount.toString() ?? '0',
    );
    
    if (widget.room != null) {
      _selectedType = widget.room!.type;
      _selectedStatus = widget.room!.load;
    }
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    _itemCountController.dispose();
    super.dispose();
  }
  
  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) return;
    
    final room = RoomEntity(
      id: widget.room?.id ?? '',
      name: _nameController.text.trim(),
      type: _selectedType,
      points: widget.room?.points ?? _generateDefaultPoints(),
      itemCount: int.parse(_itemCountController.text),
      load: _selectedStatus,
      centerPoint: widget.room?.centerPoint ?? Offset.zero,
    );
    
    if (_isEditing) {
      context.read<MapCubit>().add(UpdateRoom(room: room));
    } else {
      context.read<MapCubit>().add(AddRoom(room: room));
    }
    
    Navigator.of(context).pop();
  }
  
  List<Offset> _generateDefaultPoints() {
    return [
      const Offset(100, 100),
      const Offset(200, 100),
      const Offset(200, 200),
      const Offset(100, 200),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final safePadding = MediaQuery.of(context).padding;
    
    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          _isEditing ? '编辑房间' : '新增房间',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: colors.textPrimary,
          ),
        ),
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: colors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          if (_isEditing)
            IconButton(
              icon: Icon(Icons.delete_outline_rounded, color: colors.error),
              onPressed: () => _showDeleteConfirmation(context, colors),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          20.w,
          16.h,
          20.w,
          safePadding.bottom + 100.h,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('基本信息', colors),
              SizedBox(height: 12.h),
              GlassCard(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    _buildTextField(
                      controller: _nameController,
                      label: '房间名称',
                      hint: '请输入房间名称',
                      icon: Icons.label_outline_rounded,
                      colors: colors,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '请输入房间名称';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    _buildDropdownField(colors),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              _buildSectionTitle('物品信息', colors),
              SizedBox(height: 12.h),
              GlassCard(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    _buildTextField(
                      controller: _itemCountController,
                      label: '物品数量',
                      hint: '请输入物品数量',
                      icon: Icons.inventory_2_outlined,
                      colors: colors,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '请输入物品数量';
                        }
                        final count = int.tryParse(value);
                        if (count == null || count < 0) {
                          return '请输入有效的数量';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    _buildStatusSelector(colors),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              _buildSubmitButton(colors),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildSectionTitle(String title, AppColorsData colors) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
      ),
    );
  }
  
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required AppColorsData colors,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: colors.textSecondary,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(
            fontSize: 16.sp,
            color: colors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: colors.textTertiary),
            prefixIcon: Icon(icon, color: colors.textSecondary, size: 20.sp),
            filled: true,
            fillColor: colors.surface.withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colors.border.withValues(alpha: 0.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colors.error),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          ),
        ),
      ],
    );
  }
  
  Widget _buildDropdownField(AppColorsData colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '房间类型',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: colors.textSecondary,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: colors.surface.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: colors.border.withValues(alpha: 0.5)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedType,
              isExpanded: true,
              icon: Icon(Icons.expand_more_rounded, color: colors.textSecondary),
              style: TextStyle(
                fontSize: 16.sp,
                color: colors.textPrimary,
              ),
              dropdownColor: colors.card,
              items: _roomTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedType = value;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildStatusSelector(AppColorsData colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '装载状态',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: colors.textSecondary,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: SpaceLoadStatus.values.map((status) {
            final isSelected = _selectedStatus == status;
            final statusColor = _getStatusColor(status, colors);
            final statusText = _getStatusText(status);
            
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedStatus = status;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? statusColor.withValues(alpha: 0.15)
                        : colors.surface.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: isSelected ? statusColor : colors.border.withValues(alpha: 0.5),
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        _getStatusIcon(status),
                        color: isSelected ? statusColor : colors.textTertiary,
                        size: 24.sp,
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        statusText,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                          color: isSelected ? statusColor : colors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
  
  Widget _buildSubmitButton(AppColorsData colors) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: _handleSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Text(
          _isEditing ? '保存修改' : '添加房间',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
  
  void _showDeleteConfirmation(BuildContext context, AppColorsData colors) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: colors.card,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: Text(
            '确认删除',
            style: TextStyle(color: colors.textPrimary),
          ),
          content: Text(
            '确定要删除房间"${widget.room?.name}"吗？此操作无法撤销。',
            style: TextStyle(color: colors.textSecondary),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(
                '取消',
                style: TextStyle(color: colors.textTertiary),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<MapCubit>().add(DeleteRoom(roomId: widget.room!.id));
                Navigator.of(context).pop();
              },
              child: Text(
                '删除',
                style: TextStyle(color: colors.error),
              ),
            ),
          ],
        );
      },
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
  
  IconData _getStatusIcon(SpaceLoadStatus status) {
    switch (status) {
      case SpaceLoadStatus.empty:
        return Icons.check_circle_outline_rounded;
      case SpaceLoadStatus.normal:
        return Icons.radio_button_checked_rounded;
      case SpaceLoadStatus.crowded:
        return Icons.warning_amber_rounded;
    }
  }
}
