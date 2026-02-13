import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/core/localization/l10n/app_localizations.dart';
import 'package:youwu/features/home/view/home_page.dart';

class HomeAppBar extends StatelessWidget {
  final ViewMode viewMode;
  final ValueChanged<ViewMode> onViewModeChanged;

  const HomeAppBar({
    super.key,
    required this.viewMode,
    required this.onViewModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: colors.glass,
        border: Border(
          bottom: BorderSide(
            color: colors.border.withValues(alpha: 0.5),
            width: 0.5,
          ),
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Row(
            children: [
              _buildTitle(context, colors),
              const Spacer(),
              _buildViewToggle(colors),
              SizedBox(width: 12.w),
              _buildNotificationButton(colors),
              SizedBox(width: 8.w),
              _buildSettingsButton(colors),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, AppColorsData colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppLocalizations.of(context)!.exist,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: colors.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          AppLocalizations.of(context)!.itemsTracked,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: colors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildViewToggle(AppColorsData colors) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: colors.border.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToggleButton(
            icon: Icons.map_outlined,
            isSelected: viewMode == ViewMode.map,
            onTap: () => onViewModeChanged(ViewMode.map),
            colors: colors,
          ),
          SizedBox(width: 4.w),
          _buildToggleButton(
            icon: Icons.list_rounded,
            isSelected: viewMode == ViewMode.list,
            onTap: () => onViewModeChanged(ViewMode.list),
            colors: colors,
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required AppColorsData colors,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? colors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: colors.primary.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Icon(
          icon,
          size: 18.sp,
          color: isSelected ? Colors.white : colors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildNotificationButton(AppColorsData colors) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: colors.surface.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: colors.border.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Icon(
            Icons.notifications_none_rounded,
            size: 20.sp,
            color: colors.textPrimary,
          ),
        ),
        Positioned(
          top: 8.h,
          right: 8.w,
          child: Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
              color: colors.error,
              shape: BoxShape.circle,
              border: Border.all(
                color: colors.surface,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsButton(AppColorsData colors) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: colors.border.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Icon(
        Icons.settings_outlined,
        size: 20.sp,
        color: colors.textPrimary,
      ),
    );
  }
}
