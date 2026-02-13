import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/domain/entities/item_entity.dart';
import 'package:youwu/shared/widgets/glass_card.dart';

class ItemFormDialog extends StatefulWidget {
  final ItemEntity? item;
  final String? roomId;
  final Function(ItemEntity) onSubmit;

  const ItemFormDialog({
    super.key,
    this.item,
    this.roomId,
    required this.onSubmit,
  });

  @override
  State<ItemFormDialog> createState() => _ItemFormDialogState();
}

class _ItemFormDialogState extends State<ItemFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _quantityController;
  late final TextEditingController _descriptionController;
  
  ItemCategory _selectedCategory = ItemCategory.other;
  String _selectedRoomId = '';
  
  final List<String> _roomIds = ['room_001', 'room_002', 'room_003', 'room_004'];
  
  final Map<String, String> _roomNames = {
    'room_001': '客厅',
    'room_002': '厨房',
    'room_003': '卧室',
    'room_004': '浴室',
  };

  bool get _isEditing => widget.item != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.item?.name ?? '');
    _quantityController = TextEditingController(
      text: widget.item?.quantity.toString() ?? '1',
    );
    _descriptionController = TextEditingController(
      text: widget.item?.description ?? '',
    );
    
    if (widget.item != null) {
      _selectedCategory = widget.item!.category;
      _selectedRoomId = widget.item!.roomId;
    } else {
      _selectedRoomId = widget.roomId ?? _roomIds.first;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (!_formKey.currentState!.validate()) return;
    
    final item = ItemEntity(
      id: widget.item?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text.trim(),
      roomId: _selectedRoomId,
      category: _selectedCategory,
      quantity: int.parse(_quantityController.text),
      description: _descriptionController.text.trim(),
      createdAt: widget.item?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
      isFavorite: widget.item?.isFavorite ?? false,
    );
    
    widget.onSubmit(item);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    
    return Dialog(
      backgroundColor: Colors.transparent,
      child: GlassCard(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _isEditing ? '编辑物品' : '添加物品',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: colors.textPrimary,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        color: colors.textSecondary,
                        size: 22.sp,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                _buildTextField(
                  controller: _nameController,
                  label: '物品名称',
                  hint: '请输入物品名称',
                  icon: Icons.label_outline_rounded,
                  colors: colors,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '请输入物品名称';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                _buildDropdownField(
                  label: '所属房间',
                  value: _selectedRoomId,
                  items: _roomIds.map((id) {
                    return DropdownMenuItem(
                      value: id,
                      child: Text(_roomNames[id] ?? id),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedRoomId = value;
                      });
                    }
                  },
                  colors: colors,
                ),
                SizedBox(height: 16.h),
                _buildDropdownField(
                  label: '物品类别',
                  value: _selectedCategory,
                  items: ItemCategory.values.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(_getCategoryText(category)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    }
                  },
                  colors: colors,
                ),
                SizedBox(height: 16.h),
                _buildTextField(
                  controller: _quantityController,
                  label: '数量',
                  hint: '请输入数量',
                  icon: Icons.numbers_outlined,
                  colors: colors,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入数量';
                    }
                    final count = int.tryParse(value);
                    if (count == null || count < 1) {
                      return '请输入有效的数量';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                _buildTextField(
                  controller: _descriptionController,
                  label: '描述（可选）',
                  hint: '请输入描述',
                  icon: Icons.description_outlined,
                  colors: colors,
                  maxLines: 2,
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      _isEditing ? '保存修改' : '添加物品',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: colors.textSecondary,
          ),
        ),
        SizedBox(height: 6.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          style: TextStyle(
            fontSize: 14.sp,
            color: colors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: colors.textTertiary),
            prefixIcon: Icon(icon, color: colors.textSecondary, size: 18.sp),
            filled: true,
            fillColor: colors.surface.withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: colors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: colors.border.withValues(alpha: 0.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: colors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: colors.error),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField<T>({
    required String label,
    required T value,
    required List<DropdownMenuItem<T>> items,
    required void Function(T) onChanged,
    required AppColorsData colors,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: colors.textSecondary,
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: colors.surface.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: colors.border.withValues(alpha: 0.5)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isExpanded: true,
              icon: Icon(Icons.expand_more_rounded, color: colors.textSecondary),
              style: TextStyle(
                fontSize: 14.sp,
                color: colors.textPrimary,
              ),
              dropdownColor: colors.card,
              items: items,
              onChanged: (newValue) {
                if (newValue != null) {
                  onChanged(newValue);
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  String _getCategoryText(ItemCategory category) {
    switch (category) {
      case ItemCategory.furniture:
        return '家具';
      case ItemCategory.electronics:
        return '电子产品';
      case ItemCategory.clothing:
        return '衣物';
      case ItemCategory.books:
        return '书籍';
      case ItemCategory.kitchenware:
        return '厨具';
      case ItemCategory.decorations:
        return '装饰品';
      case ItemCategory.tools:
        return '工具';
      case ItemCategory.other:
        return '其他';
    }
  }
}
