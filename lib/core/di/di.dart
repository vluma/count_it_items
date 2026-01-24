import 'package:get_it/get_it.dart';

// 创建全局GetIt实例
final GetIt sl = GetIt.instance;

/// 初始化依赖注入
Future<void> initDependencies() async {
  // 注册单例服务
  // sl.registerSingleton<SomeService>(SomeServiceImpl());
  
  // 注册工厂服务
  // sl.registerFactory<SomeFactory>(() => SomeFactoryImpl());
  
  // 注册延迟单例服务
  // sl.registerLazySingleton<SomeLazyService>(() => SomeLazyServiceImpl());
  
  // 注册异步服务
  // sl.registerSingletonAsync<SomeAsyncService>(() async {
  //   final service = SomeAsyncServiceImpl();
  //   await service.init();
  //   return service;
  // });
  
  // 注册仓库
  // sl.registerSingleton<SpaceRepository>(SpaceRepositoryImpl(
  //   dataSource: sl(),
  // ));
  
  // 注册Cubit/Bloc
  // sl.registerFactory<MapCubit>(() => MapCubit(
  //   spaceRepository: sl(),
  // ));
}
