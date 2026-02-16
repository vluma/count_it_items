import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/di.dart';
import 'core/theme/app_theme.dart';
import 'core/localization/l10n/app_localizations.dart';
import 'domain/entities/settings_entity.dart';
import 'features/home/view/home_page.dart';
import 'features/home/view_model/map_cubit.dart';
import 'features/notification/view_model/notification_cubit.dart';
import 'features/settings/view_model/settings_cubit.dart';
import 'features/settings/view_model/settings_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<MapCubit>()),
        BlocProvider(create: (_) => sl<SettingsCubit>()),
        BlocProvider(create: (_) => sl<NotificationCubit>()),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, settingsState) {
          final themeMode = settingsState.maybeWhen(
            loaded: (settings) => _mapThemeMode(settings.themeMode),
            orElse: () => ThemeMode.system,
          );
          
          final locale = settingsState.maybeWhen(
            loaded: (settings) => _mapLocale(settings.languageMode),
            orElse: () => null,
          );
          
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                title: 'CountIt',
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: themeMode,
                locale: locale,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                home: const HomePage(),
              );
            },
          );
        },
      ),
    );
  }

  ThemeMode _mapThemeMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  Locale? _mapLocale(LanguageMode mode) {
    switch (mode) {
      case LanguageMode.zh:
        return const Locale('zh');
      case LanguageMode.en:
        return const Locale('en');
      case LanguageMode.system:
        return null;
    }
  }
}
