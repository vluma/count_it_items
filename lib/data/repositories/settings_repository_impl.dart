import 'dart:async';
import 'package:isar/isar.dart';
import 'package:youwu/domain/entities/settings_entity.dart';
import 'package:youwu/domain/repositories/settings_repository.dart';
import 'package:youwu/data/models/settings_model.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final Isar _isar;
  
  SettingsRepositoryImpl(this._isar);
  
  @override
  Future<SettingsEntity> getSettings() async {
    final settings = await _isar.settingsModels.get(0);
    if (settings == null) {
      final defaultSettings = SettingsModel();
      await _isar.writeTxn(() async {
        await _isar.settingsModels.put(defaultSettings);
      });
      return defaultSettings.toEntity();
    }
    return settings.toEntity();
  }
  
  @override
  Future<void> updateThemeMode(AppThemeMode themeMode) async {
    await _isar.writeTxn(() async {
      final settings = await _isar.settingsModels.get(0) ?? SettingsModel();
      settings.themeMode = themeMode;
      await _isar.settingsModels.put(settings);
    });
  }
  
  @override
  Future<void> updateLanguageMode(LanguageMode languageMode) async {
    await _isar.writeTxn(() async {
      final settings = await _isar.settingsModels.get(0) ?? SettingsModel();
      settings.languageMode = languageMode;
      await _isar.settingsModels.put(settings);
    });
  }
  
  @override
  Future<void> updateFeishuConfig(String appId, String appSecret) async {
    await _isar.writeTxn(() async {
      final settings = await _isar.settingsModels.get(0) ?? SettingsModel();
      settings.feishuAppId = appId;
      settings.feishuAppSecret = appSecret;
      await _isar.settingsModels.put(settings);
    });
  }
  
  @override
  Future<void> updateAiConfig(AiProvider provider, String apiKey, String apiEndpoint) async {
    await _isar.writeTxn(() async {
      final settings = await _isar.settingsModels.get(0) ?? SettingsModel();
      settings.aiProvider = provider;
      settings.aiApiKey = apiKey;
      settings.aiApiEndpoint = apiEndpoint;
      await _isar.settingsModels.put(settings);
    });
  }
  
  @override
  Stream<SettingsEntity> watchSettings() {
    return _isar.settingsModels.watchObject(0).map((settings) {
      if (settings == null) {
        return const SettingsEntity();
      }
      return settings.toEntity();
    });
  }
}
