import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/features/chat/view_model/chat_state.dart';

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;
  final VoidCallback? onTap;

  const ChatMessageWidget({
    super.key,
    required this.message,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        constraints: BoxConstraints(maxWidth: 280.w),
        child: Column(
          crossAxisAlignment: message.isUser 
              ? CrossAxisAlignment.end 
              : CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: message.isUser 
                    ? colors.primary 
                    : colors.card,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                  bottomLeft: message.isUser 
                      ? Radius.circular(16.r) 
                      : Radius.circular(4.r),
                  bottomRight: message.isUser 
                      ? Radius.circular(4.r) 
                      : Radius.circular(16.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: colors.shadow.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                message.content,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: message.isUser ? Colors.white : colors.textPrimary,
                  height: 1.4,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              _formatTime(message.timestamp),
              style: TextStyle(
                fontSize: 10.sp,
                color: colors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
