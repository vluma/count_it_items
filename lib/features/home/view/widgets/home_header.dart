import 'package:flutter/material.dart';
import 'package:count_it_items/core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 左侧：标题和动态文案
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 大字重标题
            Text(
              'Exist.',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 8),
            // 动态国际化文案
            Text(
              'All is in order.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        // 右侧：天气/环境微动效
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // 太阳图标
              Icon(
                Icons.wb_sunny_outlined,
                size: 20,
                color: Color(0xFFFFB800),
              ),
              SizedBox(width: 8),
              // 温度
              Text(
                '23°C',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
