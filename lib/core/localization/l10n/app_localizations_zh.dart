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
}
