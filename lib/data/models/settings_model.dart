import 'package:isar/isar.dart';
import 'package:youwu/domain/entities/settings_entity.dart';

part 'settings_model.g.dart';

@collection
class SettingsModel {
  Id id = 0;
  
  @enumerated
  late AppThemeMode themeMode;
  
  @enumerated
  late LanguageMode languageMode;
  
  late String appVersion;
  
  late String feishuAppId;
  
  late String feishuAppSecret;
  
  @enumerated
  late AiProvider aiProvider;
  
  late String aiApiKey;
  
  late String aiApiEndpoint;
  
  SettingsModel({
    this.id = 0,
    this.themeMode = AppThemeMode.system,
    this.languageMode = LanguageMode.system,
    this.appVersion = '1.0.0',
    this.feishuAppId = '',
    this.feishuAppSecret = '',
    this.aiProvider = AiProvider.zhipu,
    this.aiApiKey = '',
    this.aiApiEndpoint = '',
  });
  
  SettingsEntity toEntity() => SettingsEntity(
    themeMode: themeMode,
    languageMode: languageMode,
    appVersion: appVersion,
    feishuAppId: feishuAppId,
    feishuAppSecret: feishuAppSecret,
    aiProvider: aiProvider,
    aiApiKey: aiApiKey,
    aiApiEndpoint: aiApiEndpoint,
  );
  
  factory SettingsModel.fromEntity(SettingsEntity entity) => SettingsModel(
    id: 0,
    themeMode: entity.themeMode,
    languageMode: entity.languageMode,
    appVersion: entity.appVersion,
    feishuAppId: entity.feishuAppId,
    feishuAppSecret: entity.feishuAppSecret,
    aiProvider: entity.aiProvider,
    aiApiKey: entity.aiApiKey,
    aiApiEndpoint: entity.aiApiEndpoint,
  );
  
  void updateFromEntity(SettingsEntity entity) {
    themeMode = entity.themeMode;
    languageMode = entity.languageMode;
    appVersion = entity.appVersion;
    feishuAppId = entity.feishuAppId;
    feishuAppSecret = entity.feishuAppSecret;
    aiProvider = entity.aiProvider;
    aiApiKey = entity.aiApiKey;
    aiApiEndpoint = entity.aiApiEndpoint;
  }
}
