import 'package:flutter/material.dart'; 
 
 class AppColors {
   AppColors._(); 
   
   // --- Apple 系统级品牌色 --- 
   // 使用 iOS 标准 SystemBlue，它比纯克莱因蓝更润，且在不同光线下有微调 
   static const Color primary = Color(0xFF007AFF); 
   static const Color onPrimary = Colors.white; 
   static const Color onBackground = Color(0xFF000000);   // 纯黑 (Apple 在大标题使用纯黑) 
   static const Color onSurface = Color(0xFF000000);     // 纯黑 (Apple 在大标题使用纯黑) 
 
   // --- iOS 动态背景系统 --- 
   // Apple 很少使用纯白作为全局背景，通常使用 SystemGroupedBackground 
   static const Color background = Color(0xFFF2F2F7); // iOS 一级背景色 (用于页面底层) 
   static const Color surface = Color(0xFFFFFFFF);    // iOS 二级背景色 (用于卡片、Cell) 
   static const Color secondary = Color(0xFFE5E5EA);  // iOS 三级背景色 (用于组件内嵌入) 
 
   // --- 2.5D 与阴影 (Apple 风格) --- 
   // Apple 的阴影非常细腻，几乎不可见但能感知深度 
   static const Color wallSide = Color(0xFFD1D1D6);   // iOS SystemGray 4 (墙体侧面) 
   static const Color shadow = Color(0x1F000000);     // 12% 不透明度的黑，极其温润 
   static const Color transparent = Color(0x00000000); // 完全透明 
   
   // --- 状态色 (iOS 标准) --- 
   static const Color error = Color(0xFFFF3B30);      // iOS SystemRed 
   static const Color success = Color(0xFF34C759);    // iOS SystemGreen 
   static const Color warning = Color(0xFFFF9500);    // iOS SystemOrange 
   static const Color empty = Color(0xFF8E8E93);      // iOS SystemGray 
 
   // --- 文字系统 (SF Pro 视觉标准) --- 
   static const Color textPrimary = Color(0xFF000000);   // 纯黑 (Apple 在大标题使用纯黑) 
   static const Color textSecondary = Color(0xFF8E8E93); // iOS SystemGray 
   static const Color textDisabled = Color(0xFFC7C7CC);  // iOS SystemGray 4 
 
   // --- 边框与磨砂 (Materials) --- 
   static const Color border = Color(0x4D3C3C43);       // iOS 标准分隔线色 (18% Opacity) 
   static const Color glassEffect = Color(0xCCFFFFFF);   // 80% 白色，用于 BackdropFilter 
 }