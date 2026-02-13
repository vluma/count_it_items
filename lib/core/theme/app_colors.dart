import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF6366F1);
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color primaryDark = Color(0xFF4F46E5);

  static const Color accent = Color(0xFFEC4899);
  static const Color accentLight = Color(0xFFF472B6);

  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFF34D399);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFBBF24);
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFF87171);

  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color glassLight = Color(0xE6FFFFFF);

  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceDark = Color(0xFF1E293B);
  static const Color cardDark = Color(0xFF1E293B);
  static const Color glassDark = Color(0xE61E293B);

  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF64748B);
  static const Color textTertiaryLight = Color(0xFF94A3B8);
  static const Color textDisabledLight = Color(0xFFCBD5E1);

  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
  static const Color textTertiaryDark = Color(0xFF64748B);
  static const Color textDisabledDark = Color(0xFF475569);

  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color borderDark = Color(0xFF334155);

  static const Color dividerLight = Color(0x1E000000);
  static const Color dividerDark = Color(0x1EFFFFFF);

  static const Color shadowLight = Color(0x0A000000);
  static const Color shadowDark = Color(0x1A000000);

  static const Color roomEmpty = Color(0xFF10B981);
  static const Color roomEmptyLight = Color(0xFFD1FAE5);
  static const Color roomNormal = Color(0xFF3B82F6);
  static const Color roomNormalLight = Color(0xFFDBEAFE);
  static const Color roomCrowded = Color(0xFFEF4444);
  static const Color roomCrowdedLight = Color(0xFFFEE2E2);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLight, primary, primaryDark],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentLight, accent],
  );

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [successLight, success],
  );

  static const LinearGradient warningGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [warningLight, warning],
  );

  static const LinearGradient errorGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [errorLight, error],
  );

  static List<BoxShadow> cardShadow(bool isDark) => [
    BoxShadow(
      color: isDark ? shadowDark : shadowLight,
      blurRadius: 20,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> primaryGlow = [
    BoxShadow(
      color: primary.withValues(alpha: 0.3),
      blurRadius: 20,
      spreadRadius: -5,
    ),
  ];

  static List<BoxShadow> accentGlow = [
    BoxShadow(
      color: accent.withValues(alpha: 0.3),
      blurRadius: 20,
      spreadRadius: -5,
    ),
  ];

  static AppColorsData of(BuildContext context) {
    return AppColorsData._(context);
  }
}

class AppColorsData {
  final BuildContext _context;
  final bool _isDarkMode;

  AppColorsData._(this._context) : _isDarkMode = Theme.of(_context).brightness == Brightness.dark;

  Color get primary => AppColors.primary;
  Color get primaryLight => AppColors.primaryLight;
  Color get primaryDark => AppColors.primaryDark;
  Color get accent => AppColors.accent;
  Color get accentLight => AppColors.accentLight;

  Color get success => AppColors.success;
  Color get warning => AppColors.warning;
  Color get error => AppColors.error;

  Color get background => _isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight;
  Color get surface => _isDarkMode ? AppColors.surfaceDark : AppColors.surfaceLight;
  Color get card => _isDarkMode ? AppColors.cardDark : AppColors.cardLight;
  Color get glass => _isDarkMode ? AppColors.glassDark : AppColors.glassLight;

  Color get textPrimary => _isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
  Color get textSecondary => _isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
  Color get textTertiary => _isDarkMode ? AppColors.textTertiaryDark : AppColors.textTertiaryLight;
  Color get textDisabled => _isDarkMode ? AppColors.textDisabledDark : AppColors.textDisabledLight;

  Color get border => _isDarkMode ? AppColors.borderDark : AppColors.borderLight;
  Color get divider => _isDarkMode ? AppColors.dividerDark : AppColors.dividerLight;
  Color get shadow => _isDarkMode ? AppColors.shadowDark : AppColors.shadowLight;

  Color get roomEmpty => AppColors.roomEmpty;
  Color get roomEmptyLight => AppColors.roomEmptyLight;
  Color get roomNormal => AppColors.roomNormal;
  Color get roomNormalLight => AppColors.roomNormalLight;
  Color get roomCrowded => AppColors.roomCrowded;
  Color get roomCrowdedLight => AppColors.roomCrowdedLight;

  LinearGradient get primaryGradient => AppColors.primaryGradient;
  LinearGradient get accentGradient => AppColors.accentGradient;
  LinearGradient get successGradient => AppColors.successGradient;
  LinearGradient get warningGradient => AppColors.warningGradient;
  LinearGradient get errorGradient => AppColors.errorGradient;

  List<BoxShadow> get cardShadow => AppColors.cardShadow(_isDarkMode);
  List<BoxShadow> get primaryGlow => AppColors.primaryGlow;
  List<BoxShadow> get accentGlow => AppColors.accentGlow;
}
