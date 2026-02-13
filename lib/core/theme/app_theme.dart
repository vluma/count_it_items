import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();
  
  // 亮色主题
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      // 基础颜色配置
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: Colors.white,
        background: AppColors.backgroundLight,
        onBackground: AppColors.textPrimaryLight,
        surface: AppColors.surfaceLight,
        onSurface: AppColors.textPrimaryLight,
        error: AppColors.error,
        onError: Colors.white,
        secondary: AppColors.surfaceLight,
        onSecondary: AppColors.textPrimaryLight,
      ),
      
      // 文本主题
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
        displayMedium: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
        displaySmall: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
        headlineLarge: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
        headlineMedium: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        headlineSmall: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryLight,
        ),
        titleLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryLight,
        ),
        titleMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryLight,
        ),
        titleSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryLight,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textPrimaryLight,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textPrimaryLight,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryLight,
        ),
        labelLarge: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryLight,
        ),
        labelMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryLight,
        ),
        labelSmall: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondaryLight,
        ),
      ),
      
      // 按钮主题
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.primary),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r),
            ),
          ),
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          ),
        ),
      ),
      
      // 输入框主题
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(color: AppColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(color: AppColors.borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        hintStyle: TextStyle(
          color: AppColors.textDisabledLight,
          fontSize: 14.sp,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      ),
      
      // 卡片主题
      cardTheme: CardThemeData(
        color: AppColors.surfaceLight,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      
      // 图标主题
      iconTheme: IconThemeData(
        color: AppColors.textPrimaryLight,
        size: 24.sp,
      ),
      
      // 应用栏主题
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundLight,
        foregroundColor: AppColors.textPrimaryLight,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
      ),
      
      // 底部导航栏主题
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.surfaceLight,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondaryLight,
        elevation: 0,
      ),
      
      // 分割线主题
      dividerTheme: DividerThemeData(
        color: AppColors.borderLight,
        thickness: 1.h,
      ),
    );
  }
  
  // 暗色主题
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      // 基础颜色配置
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
        primary: AppColors.primary,
        onPrimary: Colors.white,
        background: AppColors.backgroundDark,
        onBackground: AppColors.textPrimaryDark,
        surface: AppColors.surfaceDark,
        onSurface: AppColors.textPrimaryDark,
        error: AppColors.error,
        onError: Colors.white,
        secondary: AppColors.surfaceDark,
        onSecondary: AppColors.textPrimaryDark,
      ),
      
      // 文本主题
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
        displayMedium: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
        displaySmall: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
        headlineLarge: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
        headlineMedium: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
        ),
        headlineSmall: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimaryDark,
        ),
        titleLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryDark,
        ),
        titleMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryDark,
        ),
        titleSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textPrimaryDark,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textPrimaryDark,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.textSecondaryDark,
        ),
        labelLarge: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryDark,
        ),
        labelMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimaryDark,
        ),
        labelSmall: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondaryDark,
        ),
      ),
      
      // 按钮主题
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.primary),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r),
            ),
          ),
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          ),
        ),
      ),
      
      // 输入框主题
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(color: AppColors.borderDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(color: AppColors.borderDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        hintStyle: TextStyle(
          color: AppColors.textDisabledDark,
          fontSize: 14.sp,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      ),
      
      // 卡片主题
      cardTheme: CardThemeData(
        color: AppColors.surfaceDark,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      
      // 图标主题
      iconTheme: IconThemeData(
        color: AppColors.textPrimaryDark,
        size: 24.sp,
      ),
      
      // 应用栏主题
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: AppColors.textPrimaryDark,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryDark,
        ),
      ),
      
      // 底部导航栏主题
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.surfaceDark,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondaryDark,
        elevation: 0,
      ),
      
      // 分割线主题
      dividerTheme: DividerThemeData(
        color: AppColors.borderDark,
        thickness: 1.h,
      ),
    );
  }
  
  // 默认主题（亮色）
  static ThemeData get theme {
    return light;
  }
  
  // 使用说明：
  // 在 MaterialApp 中配置主题，实现自动切换：
  // MaterialApp(
  //   theme: AppTheme.light,
  //   darkTheme: AppTheme.dark,
  //   themeMode: ThemeMode.system, // 根据系统设置自动切换
  // )
}
