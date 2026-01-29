import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/core/localization/l10n/app_localizations.dart';
import 'package:youwu/features/home/view_model/map_cubit.dart';
import 'package:youwu/features/home/view_model/map_state.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60.h); // 动态高度适配

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return AppBar(
      // 1. 基础配置：透明并移除阴影
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      
      // 2. 核心：实现 Apple 风格的毛玻璃背景
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            color: colors.glass,
          ),
        ),
      ),

      // 3. 左侧：大标题与动态数据
      title: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.exist,
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  color: colors.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
              state.maybeWhen(
                success: (space, _, __) => Text(
                  '${space.rooms.length} ${AppLocalizations.of(context)!.rooms} · ${space.totalItems} ${AppLocalizations.of(context)!.itemsTracked}',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: colors.textSecondary.withOpacity(0.6),
                  ),
                ),
                orElse: () => Text(
                  AppLocalizations.of(context)!.loading,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: colors.textSecondary.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          );
        },
      ),

      // 4. 右侧：功能按钮与状态
      actions: [
        _buildWeatherIndicator(context),
        SizedBox(width: 8.w),
        _buildNotificationButton(context),
        SizedBox(width: 16.w), // 保持 Apple 边缘间距
      ],
    );
  }

  Widget _buildNotificationButton(BuildContext context) {
    final colors = AppColors.of(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none_rounded,
            size: 22.sp,
            color: colors.textPrimary,
          ),
        ),
        Positioned(
          top: 12.h,
          right: 12.w,
          child: Container(
            width: 7.w,
            height: 7.h,
            decoration: const BoxDecoration(
              color: AppColors.accentRed, // 使用你主题中的错误红
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherIndicator(BuildContext context) {
    final colors = AppColors.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.wb_sunny_rounded, size: 14.sp, color: AppColors.accentOrange),
            SizedBox(width: 4.w),
            Text(
              '23°',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                color: colors.textPrimary,
              ),
            ),
          ],
        ),
        Text(
          'SAT, JAN 24',
          style: TextStyle(
            fontSize: 9.sp,
            fontWeight: FontWeight.w600,
            color: colors.textSecondary.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}