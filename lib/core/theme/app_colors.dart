import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  
  // 主色调 - 白色极简风格
  static const Color primary = Color(0xFF0000FF); // 克莱因蓝
  static const Color background = Color(0xFFFFFFFF); // 纯白色背景
  static const Color surface = Color(0xFFFFFFFF); // 白色表面
  static const Color onPrimary = Color(0xFFFFFFFF); // 主色调上的文字
  static const Color onBackground = Color(0xFF1A1A1A); // 背景上的文字
  static const Color onSurface = Color(0xFF1A1A1A); // 表面上的文字
  
  // 辅助色
  static const Color secondary = Color(0xFFF5F5F5); // 浅灰色
  static const Color accent = Color(0xFF0000FF); // 克莱因蓝
  static const Color error = Color(0xFFFF4D4F); // 错误色
  static const Color success = Color(0xFF52C41A); // 成功色
  static const Color warning = Color(0xFFFFC107); // 警告色
  
  // 透明度
  static const Color transparent = Color(0x00000000); // 完全透明
  static const Color semiTransparent = Color(0x80000000); // 半透明
  static const Color lowTransparent = Color(0x20000000); // 低透明度
  
  // 边框色
  static const Color border = Color(0xFFE0E0E0); // 边框颜色
  static const Color highlight = Color(0xFF0000FF); // 高亮颜色
  
  // 文字颜色
  static const Color textPrimary = Color(0xFF1A1A1A); // 主要文字
  static const Color textSecondary = Color(0xFF666666); // 次要文字
  static const Color textDisabled = Color(0xFFBFBFBF); // 禁用文字
  
  // 阴影颜色
  static const Color shadow = Color(0x1A000000); // 阴影颜色
}