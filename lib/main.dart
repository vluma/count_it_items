import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'core/di/di.dart';
import 'core/theme/app_theme.dart';
import 'core/localization/l10n/app_localizations.dart';
import 'features/home/view/home_page.dart';
import 'features/home/view_model/map_cubit.dart';
import 'data/repositories/space_repository_impl.dart';
import 'domain/repositories/space_repository.dart';

void main() async {
  // 初始化依赖注入
  await initDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'CountIt',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: BlocProvider(
            create: (_) => sl<MapCubit>(),
            child: const HomePage(),
          ),
        );
      },
    );
  }
}
