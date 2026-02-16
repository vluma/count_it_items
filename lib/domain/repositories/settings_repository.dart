import '../entities/settings_entity.dart';

abstract class SettingsRepository {
  Future<SettingsEntity> getSettings();
  Future<void> updateThemeMode(AppThemeMode themeMode);
  Future<void> updateLanguageMode(LanguageMode languageMode);
  Future<void> updateFeishuConfig(String appId, String appSecret);
  Future<void> updateAiConfig(AiProvider provider, String apiKey, String apiEndpoint);
  Stream<SettingsEntity> watchSettings();
}
