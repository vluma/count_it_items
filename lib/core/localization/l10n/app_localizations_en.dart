// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'CountIt';

  @override
  String get exist => 'Exist.';

  @override
  String get rooms => 'Rooms';

  @override
  String get itemsTracked => 'Items Tracked';

  @override
  String get loading => 'Loading...';

  @override
  String get searchItems => 'Search items...';
}
