import 'package:get_it/get_it.dart';
import 'package:count_it_items/domain/repositories/space_repository.dart';
import 'package:count_it_items/data/repositories/mock_space_repository_impl.dart';
import 'package:count_it_items/features/home/view_model/map_cubit.dart';

// 创建全局GetIt实例
final GetIt sl = GetIt.instance;

/// 初始化依赖注入
Future<void> initDependencies() async {
  // 注册仓库 - 使用Mock实现
  sl.registerSingleton<SpaceRepository>(MockSpaceRepositoryImpl());
  
  // 注册Cubit/Bloc
  sl.registerFactory<MapCubit>(() => MapCubit(
    spaceRepository: sl(),
  ));
}
