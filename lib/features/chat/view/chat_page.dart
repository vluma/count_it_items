import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/domain/entities/item_entity.dart';
import 'package:youwu/features/chat/view_model/chat_cubit.dart';
import 'package:youwu/features/chat/view_model/chat_event.dart';
import 'package:youwu/features/chat/view_model/chat_state.dart';
import 'package:youwu/features/chat/view/widgets/chat_message.dart';
import 'package:youwu/features/chat/view/widgets/item_form_dialog.dart';
import 'package:youwu/features/chat/view/widgets/item_list_tile.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _handleSend() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;
    
    context.read<ChatCubit>().add(SendMessage(content: text));
    _messageController.clear();
    
    Future.delayed(const Duration(milliseconds: 100), _scrollToBottom);
  }

  void _showItemForm({ItemEntity? item, String? roomId}) {
    showDialog(
      context: context,
      builder: (dialogContext) => ItemFormDialog(
        item: item,
        roomId: roomId,
        onSubmit: (newItem) {
          if (item != null) {
            context.read<ChatCubit>().add(UpdateItem(item: newItem));
          } else {
            context.read<ChatCubit>().add(AddItem(item: newItem));
          }
        },
      ),
    );
  }

  void _confirmDelete(String itemId) {
    final colors = AppColors.of(context);
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: colors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          '确认删除',
          style: TextStyle(color: colors.textPrimary),
        ),
        content: Text(
          '确定要删除这个物品吗？此操作无法撤销。',
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
              context.read<ChatCubit>().add(DeleteItem(itemId: itemId));
            },
            child: Text(
              '删除',
              style: TextStyle(color: colors.error),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final safePadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          '物品管理助手',
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
          IconButton(
            icon: Icon(Icons.refresh_rounded, color: colors.textSecondary),
            onPressed: () {
              context.read<ChatCubit>().add(const ClearChat());
            },
          ),
        ],
      ),
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (messages, isTyping) => Column(
              children: [
                Expanded(
                  child: _buildMessageList(messages, colors),
                ),
                if (isTyping) _buildTypingIndicator(colors),
                _buildQuickActions(colors),
                _buildInputArea(colors, safePadding),
              ],
            ),
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget _buildMessageList(List<ChatMessage> messages, AppColorsData colors) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(vertical: 16.h),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        
        return Column(
          children: [
            ChatMessageWidget(message: message),
            if (message.type == MessageType.itemList && message.items.isNotEmpty)
              _buildItemList(message.items, colors),
            if (message.type == MessageType.itemDetail && message.selectedItem != null)
              _buildItemDetail(message.selectedItem!, colors),
            if (message.type == MessageType.itemForm)
              _buildFormPrompt(colors),
          ],
        );
      },
    );
  }

  Widget _buildItemList(List<ItemEntity> items, AppColorsData colors) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      constraints: BoxConstraints(maxHeight: 300.h),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemListTile(
            item: item,
            onTap: () {
              context.read<ChatCubit>().add(ShowItemDetail(item: item));
            },
            onEdit: () => _showItemForm(item: item),
            onDelete: () => _confirmDelete(item.id),
          );
        },
      ),
    );
  }

  Widget _buildItemDetail(ItemEntity item, AppColorsData colors) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: colors.border.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit_outlined, color: colors.textSecondary, size: 20.sp),
                    onPressed: () => _showItemForm(item: item),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  SizedBox(width: 12.w),
                  IconButton(
                    icon: Icon(Icons.delete_outline_rounded, color: colors.error, size: 20.sp),
                    onPressed: () => _confirmDelete(item.id),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          _buildDetailRow('数量', item.quantity.toString(), colors),
          _buildDetailRow('类别', _getCategoryText(item.category), colors),
          if (item.description.isNotEmpty)
            _buildDetailRow('描述', item.description, colors),
          _buildDetailRow(
            '创建时间',
            '${item.createdAt.year}-${item.createdAt.month.toString().padLeft(2, '0')}-${item.createdAt.day.toString().padLeft(2, '0')}',
            colors,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, AppColorsData colors) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 13.sp,
                color: colors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 13.sp,
                color: colors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormPrompt(AppColorsData colors) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: ElevatedButton.icon(
        onPressed: () => _showItemForm(),
        icon: Icon(Icons.add_rounded, size: 20.sp),
        label: Text(
          '打开添加物品表单',
          style: TextStyle(fontSize: 14.sp),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }

  Widget _buildTypingIndicator(AppColorsData colors) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: colors.card,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDot(colors, 0),
                SizedBox(width: 4.w),
                _buildDot(colors, 1),
                SizedBox(width: 4.w),
                _buildDot(colors, 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(AppColorsData colors, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 6.w,
      height: 6.w,
      decoration: BoxDecoration(
        color: colors.textSecondary.withValues(alpha: 0.5 + (index * 0.15)),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildQuickActions(AppColorsData colors) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildQuickAction('查看所有', Icons.list_rounded, colors, () {
              context.read<ChatCubit>().add(const LoadItems());
            }),
            SizedBox(width: 8.w),
            _buildQuickAction('添加物品', Icons.add_rounded, colors, () {
              _showItemForm();
            }),
            SizedBox(width: 8.w),
            _buildQuickAction('搜索', Icons.search_rounded, colors, () {
              _messageController.text = '搜索 ';
              FocusScope.of(context).requestFocus(FocusNode());
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(String label, IconData icon, AppColorsData colors, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: colors.surface.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: colors.border.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16.sp, color: colors.textSecondary),
            SizedBox(width: 6.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                color: colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea(AppColorsData colors, EdgeInsets safePadding) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, safePadding.bottom + 8.h),
      decoration: BoxDecoration(
        color: colors.surface,
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: colors.background,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: colors.border.withValues(alpha: 0.3)),
              ),
              child: TextField(
                controller: _messageController,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: colors.textPrimary,
                ),
                decoration: InputDecoration(
                  hintText: '输入消息或指令...',
                  hintStyle: TextStyle(color: colors.textTertiary),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                ),
                onSubmitted: (_) => _handleSend(),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: _handleSend,
            child: Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                gradient: colors.primaryGradient,
                borderRadius: BorderRadius.circular(22.r),
                boxShadow: colors.primaryGlow,
              ),
              child: Icon(
                Icons.send_rounded,
                size: 20.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
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
