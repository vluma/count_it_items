import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  
  // --- 主题品牌色 --- 
  static const Color primary = Color(0xFF3B82F6); 
  static const Color onPrimary = Colors.white; 
  static const Color onBackground = Color(0xFF000000); 
  static const Color onSurface = Color(0xFF000000); 

  // --- 背景系统 --- 
  static const Color background = Color(0xFFF8FAFC); // 一级背景色 (用于页面底层) 
  static const Color surface = Color(0xFFFFFFFF);    // 二级背景色 (用于卡片、Cell) 
  static const Color secondary = Color(0xFFE5E5EA);  // 三级背景色 (用于组件内嵌入) 

  // --- 2.5D 与阴影 --- 
  static const Color wallSide = Color(0xFFD1D1D6);   // 墙体侧面 
  static const Color shadow = Color(0x1F000000);     // 12% 不透明度的黑，极其温润 
  static const Color transparent = Color(0x00000000); // 完全透明 
  
  // --- 状态色 --- 
  static const Color error = Color(0xFFEF4444);      // accent-red 
  static const Color success = Color(0xFF34C759);    // 成功色 
  static const Color warning = Color(0xFFF97316);    // accent-orange 
  static const Color empty = Color(0xFF8E8E93);      // 空状态色 

  // --- 文字系统 --- 
  static const Color textPrimary = Color(0xFF000000);   // 主文字色 
  static const Color textSecondary = Color(0xFF8E8E93); // 次要文字色 
  static const Color textDisabled = Color(0xFFC7C7CC);  // 禁用文字色 

  // --- 边框与磨砂 --- 
  static const Color border = Color(0x4D3C3C43);       // 标准分隔线色 (18% Opacity) 
  static const Color glassEffect = Color(0xCCFFFFFF);   // 80% 白色，用于 BackdropFilter 
  
  // --- 新增颜色常量 --- 
  static const Color accentRed = Color(0xFFEF4444);     // accent-red 
  static const Color accentOrange = Color(0xFFF97316);  // accent-orange 
  static const Color backgroundDark = Color(0xFF0F172A); // 深色背景 
  static const Color glassLight = Color(0x7FFFFFFF);    // 70% 不透明度的白色 
  static const Color glassDark = Color(0x7F0F172A);     // 70% 不透明度的深色背景 
}