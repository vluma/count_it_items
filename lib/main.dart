import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'core/di/di.dart';
import 'core/theme/app_theme.dart';
import 'features/home/view/home_page.dart';
import 'features/home/view_model/map_cubit.dart';
import 'data/repositories/space_repository_impl.dart';
import 'domain/repositories/space_repository.dart';

void main() async {
  // 初始化依赖注入
  await initDependencies();
  
  // 注册仓库
  sl.registerSingleton<SpaceRepository>(SpaceRepositoryImpl());
  
  // 注册Cubit
  sl.registerFactory<MapCubit>(() => MapCubit(
    spaceRepository: sl<SpaceRepository>(),
  ));
  
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
          theme: AppTheme.theme,
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            create: (_) => sl<MapCubit>(),
            child: const HomePage(),
          ),
        );
      },
    );
  }
}
