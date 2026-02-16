import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/features/chat/view_model/chat_state.dart';

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage message;
  final VoidCallback? onTap;
  final bool isSpeaking;
  final VoidCallback? onSpeak;
  final VoidCallback? onStopSpeaking;

  const ChatMessageWidget({
    super.key,
    required this.message,
    this.onTap,
    this.isSpeaking = false,
    this.onSpeak,
    this.onStopSpeaking,
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!message.isUser && onSpeak != null)
                  GestureDetector(
                    onTap: isSpeaking ? onStopSpeaking : onSpeak,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: isSpeaking 
                            ? colors.error.withValues(alpha: 0.1)
                            : colors.surface,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: isSpeaking 
                              ? colors.error.withValues(alpha: 0.3)
                              : colors.border.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isSpeaking ? Icons.stop_rounded : Icons.volume_up_rounded,
                            size: 12.sp,
                            color: isSpeaking ? colors.error : colors.textSecondary,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            isSpeaking ? '停止' : '播放',
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: isSpeaking ? colors.error : colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (!message.isUser && onSpeak != null) SizedBox(width: 8.w),
                Text(
                  _formatTime(message.timestamp),
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: colors.textTertiary,
                  ),
                ),
              ],
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
