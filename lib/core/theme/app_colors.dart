import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // --- 核心品牌色 ---
  static const Color primary = Color(0xFF3B82F6); // 科技蓝，用于高亮和选中
  static const Color accentRed = Color(0xFFEF4444); // 警告红，用于过期和紧急状态
  static const Color accentOrange = Color(0xFFF97316); // 提醒橙，用于次要警告

  // --- 背景系统 (Light) ---
  static const Color backgroundLight = Color(0xFFF8FAFC); // 极浅灰蓝底色
  static const Color surfaceLight = Colors.white; // 纯白卡片色
  static const Color glassLight = Color(0xB3FFFFFF); // 70% 透明度白色，用于毛玻璃面板

  // --- 背景系统 (Dark) ---
  static const Color backgroundDark = Color(0xFF0F172A); // 深邃蓝黑底色
  static const Color surfaceDark = Color(0xFF1E293B); // 深色卡片色
  static const Color glassDark = Color(0xB30F172A); // 70% 透明度深色，用于深色毛玻璃

  // --- 文字系统 (Light) ---
  static const Color textPrimaryLight = Color(0xFF1E293B); // 深蓝灰文字 (主要)
  static const Color textSecondaryLight = Color(0xFF94A3B8); // 灰蓝文字 (次要/说明)
  static const Color textDisabledLight = Color(0xFFCBD5E1); // 禁用态文字

  // --- 文字系统 (Dark) ---
  static const Color textPrimaryDark = Color(0xFFF8FAFC); // 浅色文字 (主要)
  static const Color textSecondaryDark = Color(0xFF94A3B8); // 灰蓝文字 (次要/说明)
  static const Color textDisabledDark = Color(0xFF475569); // 禁用态文字

  // --- 辅助色/边框 ---
  static const Color borderLight = Color(0x66FFFFFF); // 40% 透明度白边框
  static const Color borderDark = Color(0x0DFFFFFF); // 5% 透明度白边框 (适配深色)
  static const Color shadowColor = Color(0x0D000000); // 极淡阴影 (5% Opacity)

  // --- 状态阴影 (Glow Effects) ---
  static const List<BoxShadow> glowBlue = [
    BoxShadow(color: Color(0x663B82F6), blurRadius: 15, spreadRadius: -2)
  ];
  static const List<BoxShadow> glowRed = [
    BoxShadow(color: Color(0x66EF4444), blurRadius: 10, spreadRadius: 0)
  ];

  // --- 主题感知颜色获取 ---
  static AppColorsData of(BuildContext context) {
    return AppColorsData._(context);
  }
}

class AppColorsData {
  final BuildContext _context;
  final bool _isDarkMode;

  AppColorsData._(this._context) : _isDarkMode = Theme.of(_context).brightness == Brightness.dark;

  // 核心品牌色
  Color get primary => AppColors.primary;
  Color get accentRed => AppColors.accentRed;
  Color get accentOrange => AppColors.accentOrange;

  // 背景系统
  Color get background => _isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight;
  Color get surface => _isDarkMode ? AppColors.surfaceDark : AppColors.surfaceLight;
  Color get glass => _isDarkMode ? AppColors.glassDark : AppColors.glassLight;

  // 文字系统
  Color get textPrimary => _isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
  Color get textSecondary => _isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
  Color get textDisabled => _isDarkMode ? AppColors.textDisabledDark : AppColors.textDisabledLight;

  // 辅助色/边框
  Color get border => _isDarkMode ? AppColors.borderDark : AppColors.borderLight;
  Color get shadowColor => AppColors.shadowColor;

  // 状态阴影
  List<BoxShadow> get glowBlue => AppColors.glowBlue;
  List<BoxShadow> get glowRed => AppColors.glowRed;
}