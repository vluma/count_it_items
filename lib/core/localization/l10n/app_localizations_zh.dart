// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '物品计数';

  @override
  String get exist => '有物';

  @override
  String get rooms => '房间';

  @override
  String get itemsTracked => '已追踪物品';

  @override
  String get loading => '加载中...';

  @override
  String get searchItems => '搜索物品...';

  @override
  String get settings => '设置';

  @override
  String get appearance => '外观';

  @override
  String get language => '语言';

  @override
  String get about => '关于';

  @override
  String get themeSystem => '跟随系统';

  @override
  String get themeLight => '浅色模式';

  @override
  String get themeDark => '深色模式';

  @override
  String get languageSystem => '跟随系统';

  @override
  String get version => '版本';

  @override
  String get developer => '开发者';

  @override
  String get feishuSettings => '飞书设置';

  @override
  String get feishuAppId => 'App ID';

  @override
  String get feishuAppSecret => 'App Secret';

  @override
  String get feishuAppIdHint => '请输入飞书应用 App ID';

  @override
  String get feishuAppSecretHint => '请输入飞书应用 App Secret';

  @override
  String get save => '保存';

  @override
  String get aiSettings => 'AI 设置';

  @override
  String get aiProvider => 'AI 服务商';

  @override
  String get aiApiKey => 'API Key';

  @override
  String get aiApiEndpoint => 'API 端点';

  @override
  String get aiApiKeyHint => '请输入 API Key';

  @override
  String get aiApiEndpointHint => '请输入 API 端点（可选）';

  @override
  String get aiProviderZhipu => '智谱 AI';

  @override
  String get aiProviderQwen => '通义千问';

  @override
  String get aiProviderDeepseek => 'DeepSeek';

  @override
  String get aiProviderBaidu => '百度文心';

  @override
  String get aiProviderXunfei => '讯飞星火';
}
