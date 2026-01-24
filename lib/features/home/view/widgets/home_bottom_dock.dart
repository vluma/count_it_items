import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:count_it_items/core/theme/app_colors.dart';
import 'package:count_it_items/core/localization/l10n/app_localizations.dart';

class HomeBottomDock extends StatelessWidget {
  const HomeBottomDock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 这里的 Padding 应该配合 HomePage 的 MediaQuery.padding.bottom
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32.w),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            height: 64.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: AppColors.surface.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(32.w),
              border: Border.all(
                color: Colors.white.withOpacity(0.2), // 模拟玻璃边缘反光
                width: 0.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // 1. 搜索框区域（包含搜索图标和语音图标）
                SizedBox(width: 12.w),
                Expanded(
                  child: TextField(
                    cursorColor: AppColors.primary,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.searchItems,
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.textSecondary.withValues(alpha: 0.5),
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
                      // 搜索图标位于左侧内部
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        size: 22.sp,
                        color: AppColors.textSecondary.withValues(alpha: 0.8),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
                      // 语音图标位于右侧内部
                      suffixIcon: IconButton(
                        onPressed: () => _handleVoiceSearch(),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),
                        icon: Icon(
                          Icons.mic_rounded,
                          size: 22.sp,
                          color: AppColors.textSecondary.withValues(alpha: 0.9),
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
                    ),
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ),

                // 2. iOS 风格垂直分割线
                Container(
                  height: 24.h,
                  width: 1,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  color: AppColors.textSecondary.withValues(alpha: 0.1),
                ),

                // 3. 拍照按钮 (右侧整合)
                _buildIconButton(
                  icon: Icons.camera_alt_rounded,
                  onTap: () => _handleCamera(),
                  color: AppColors.primary, // 使用系统蓝色
                  isLarge: true,
                ),
                SizedBox(width: 4.w),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
    required Color color,
    bool isLarge = false,
  }) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: Icon(
        icon,
        size: isLarge ? 26.sp : 22.sp,
        color: color.withValues(alpha: 0.9),
      ),
    );
  }

  void _handleVoiceSearch() {
    // 处理 AI 语音逻辑
  }

  void _handleCamera() {
    // 处理相机逻辑
  }
}