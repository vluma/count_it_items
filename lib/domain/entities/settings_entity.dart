import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_entity.freezed.dart';

enum AppThemeMode {
  system,
  light,
  dark,
}

enum LanguageMode {
  system,
  zh,
  en,
}

enum AiProvider {
  zhipu,
  qwen,
  deepseek,
  baidu,
  xunfei,
}

@freezed
class SettingsEntity with _$SettingsEntity {
  const factory SettingsEntity({
    @Default(AppThemeMode.system) AppThemeMode themeMode,
    @Default(LanguageMode.system) LanguageMode languageMode,
    @Default('1.0.0') String appVersion,
    @Default('') String feishuAppId,
    @Default('') String feishuAppSecret,
    @Default(AiProvider.zhipu) AiProvider aiProvider,
    @Default('') String aiApiKey,
    @Default('') String aiApiEndpoint,
  }) = _SettingsEntity;
}
