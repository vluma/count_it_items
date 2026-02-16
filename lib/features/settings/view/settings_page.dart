import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youwu/core/theme/app_colors.dart';
import 'package:youwu/core/localization/l10n/app_localizations.dart';
import 'package:youwu/domain/entities/settings_entity.dart' as entity;
import 'package:youwu/shared/widgets/glass_card.dart';
import 'package:youwu/features/settings/view_model/settings_cubit.dart';
import 'package:youwu/features/settings/view_model/settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (settings) => _buildContent(context, colors, l10n, settings),
          orElse: () => _buildLoading(context, colors),
        );
      },
    );
  }

  Widget _buildLoading(BuildContext context, AppColorsData colors) {
    return Scaffold(
      backgroundColor: colors.background,
      body: Center(
        child: CircularProgressIndicator(color: colors.primary),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    AppColorsData colors,
    AppLocalizations l10n,
    entity.SettingsEntity settings,
  ) {
    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(l10n.settings),
        backgroundColor: colors.background,
        foregroundColor: colors.textPrimary,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          _buildSectionTitle(colors, l10n.appearance),
          SizedBox(height: 12.h),
          _buildThemeSection(context, colors, l10n, settings),
          SizedBox(height: 24.h),
          _buildSectionTitle(colors, l10n.language),
          SizedBox(height: 12.h),
          _buildLanguageSection(context, colors, l10n, settings),
          SizedBox(height: 24.h),
          _buildSectionTitle(colors, l10n.feishuSettings),
          SizedBox(height: 12.h),
          _buildFeishuSection(context, colors, l10n, settings),
          SizedBox(height: 24.h),
          _buildSectionTitle(colors, l10n.aiSettings),
          SizedBox(height: 12.h),
          _buildAiSection(context, colors, l10n, settings),
          SizedBox(height: 24.h),
          _buildSectionTitle(colors, l10n.about),
          SizedBox(height: 12.h),
          _buildAboutSection(context, colors, l10n, settings),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(AppColorsData colors, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: colors.textSecondary,
      ),
    );
  }

  Widget _buildThemeSection(
    BuildContext context,
    AppColorsData colors,
    AppLocalizations l10n,
    entity.SettingsEntity settings,
  ) {
    return GlassCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildThemeOption(
            context,
            colors,
            l10n.themeSystem,
            entity.AppThemeMode.system,
            settings.themeMode,
            Icons.brightness_auto,
          ),
          _buildDivider(colors),
          _buildThemeOption(
            context,
            colors,
            l10n.themeLight,
            entity.AppThemeMode.light,
            settings.themeMode,
            Icons.light_mode,
          ),
          _buildDivider(colors),
          _buildThemeOption(
            context,
            colors,
            l10n.themeDark,
            entity.AppThemeMode.dark,
            settings.themeMode,
            Icons.dark_mode,
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    AppColorsData colors,
    String title,
    entity.AppThemeMode mode,
    entity.AppThemeMode currentMode,
    IconData icon,
  ) {
    final isSelected = mode == currentMode;

    return InkWell(
      onTap: () => context.read<SettingsCubit>().setThemeMode(mode),
      borderRadius: BorderRadius.vertical(
        top: mode == entity.AppThemeMode.system ? Radius.circular(16.r) : Radius.zero,
        bottom: mode == entity.AppThemeMode.dark ? Radius.circular(16.r) : Radius.zero,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22.sp,
              color: isSelected ? colors.primary : colors.textSecondary,
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                color: colors.textPrimary,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(
                Icons.check,
                size: 20.sp,
                color: colors.primary,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSection(
    BuildContext context,
    AppColorsData colors,
    AppLocalizations l10n,
    entity.SettingsEntity settings,
  ) {
    return GlassCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          _buildLanguageOption(
            context,
            colors,
            l10n.languageSystem,
            entity.LanguageMode.system,
            settings.languageMode,
          ),
          _buildDivider(colors),
          _buildLanguageOption(
            context,
            colors,
            '中文',
            entity.LanguageMode.zh,
            settings.languageMode,
          ),
          _buildDivider(colors),
          _buildLanguageOption(
            context,
            colors,
            'English',
            entity.LanguageMode.en,
            settings.languageMode,
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    AppColorsData colors,
    String title,
    entity.LanguageMode mode,
    entity.LanguageMode currentMode,
  ) {
    final isSelected = mode == currentMode;

    return InkWell(
      onTap: () => context.read<SettingsCubit>().setLanguageMode(mode),
      borderRadius: BorderRadius.vertical(
        top: mode == entity.LanguageMode.system ? Radius.circular(16.r) : Radius.zero,
        bottom: mode == entity.LanguageMode.en ? Radius.circular(16.r) : Radius.zero,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                color: colors.textPrimary,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(
                Icons.check,
                size: 20.sp,
                color: colors.primary,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeishuSection(
    BuildContext context,
    AppColorsData colors,
    AppLocalizations l10n,
    entity.SettingsEntity settings,
  ) {
    final appIdController = TextEditingController(text: settings.feishuAppId);
    final appSecretController = TextEditingController(text: settings.feishuAppSecret);

    return GlassCard(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.cloud_outlined,
                size: 22.sp,
                color: colors.primary,
              ),
              SizedBox(width: 12.w),
              Text(
                l10n.feishuSettings,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            l10n.feishuAppId,
            style: TextStyle(
              fontSize: 14.sp,
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          TextField(
            controller: appIdController,
            decoration: InputDecoration(
              hintText: l10n.feishuAppIdHint,
              hintStyle: TextStyle(color: colors.textSecondary),
              filled: true,
              fillColor: colors.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            ),
            style: TextStyle(
              fontSize: 14.sp,
              color: colors.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            l10n.feishuAppSecret,
            style: TextStyle(
              fontSize: 14.sp,
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          TextField(
            controller: appSecretController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: l10n.feishuAppSecretHint,
              hintStyle: TextStyle(color: colors.textSecondary),
              filled: true,
              fillColor: colors.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            ),
            style: TextStyle(
              fontSize: 14.sp,
              color: colors.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.read<SettingsCubit>().setFeishuConfig(
                      appIdController.text,
                      appSecretController.text,
                    );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(l10n.save),
                    backgroundColor: colors.primary,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                l10n.save,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAiSection(
    BuildContext context,
    AppColorsData colors,
    AppLocalizations l10n,
    entity.SettingsEntity settings,
  ) {
    final apiKeyController = TextEditingController(text: settings.aiApiKey);
    final apiEndpointController = TextEditingController(text: settings.aiApiEndpoint);
    entity.AiProvider selectedProvider = settings.aiProvider;

    String getProviderName(entity.AiProvider provider) {
      switch (provider) {
        case entity.AiProvider.zhipu:
          return l10n.aiProviderZhipu;
        case entity.AiProvider.qwen:
          return l10n.aiProviderQwen;
        case entity.AiProvider.deepseek:
          return l10n.aiProviderDeepseek;
        case entity.AiProvider.baidu:
          return l10n.aiProviderBaidu;
        case entity.AiProvider.xunfei:
          return l10n.aiProviderXunfei;
      }
    }

    return StatefulBuilder(
      builder: (context, setState) {
        return GlassCard(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.psychology_outlined,
                    size: 22.sp,
                    color: colors.primary,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    l10n.aiSettings,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: colors.textPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                l10n.aiProvider,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: colors.textSecondary,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<entity.AiProvider>(
                    value: selectedProvider,
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(12.r),
                    dropdownColor: colors.surface,
                    items: entity.AiProvider.values.map((provider) {
                      return DropdownMenuItem(
                        value: provider,
                        child: Text(
                          getProviderName(provider),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: colors.textPrimary,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedProvider = value;
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                l10n.aiApiKey,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: colors.textSecondary,
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: apiKeyController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: l10n.aiApiKeyHint,
                  hintStyle: TextStyle(color: colors.textSecondary),
                  filled: true,
                  fillColor: colors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                ),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: colors.textPrimary,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                l10n.aiApiEndpoint,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: colors.textSecondary,
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: apiEndpointController,
                decoration: InputDecoration(
                  hintText: l10n.aiApiEndpointHint,
                  hintStyle: TextStyle(color: colors.textSecondary),
                  filled: true,
                  fillColor: colors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                ),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: colors.textPrimary,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<SettingsCubit>().setAiConfig(
                          selectedProvider,
                          apiKeyController.text,
                          apiEndpointController.text,
                        );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.save),
                        backgroundColor: colors.primary,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    l10n.save,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAboutSection(
    BuildContext context,
    AppColorsData colors,
    AppLocalizations l10n,
    entity.SettingsEntity settings,
  ) {
    return GlassCard(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 22.sp,
                color: colors.primary,
              ),
              SizedBox(width: 12.w),
              Text(
                l10n.appTitle,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildInfoRow(colors, l10n.version, settings.appVersion),
          SizedBox(height: 8.h),
          _buildInfoRow(colors, l10n.developer, 'maluwei'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(AppColorsData colors, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: colors.textSecondary,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            color: colors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(AppColorsData colors) {
    return Divider(
      height: 1.h,
      thickness: 0.5,
      color: colors.border.withValues(alpha: 0.3),
      indent: 16.w,
      endIndent: 16.w,
    );
  }
}
