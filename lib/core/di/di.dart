import 'package:get_it/get_it.dart';
import 'package:youwu/domain/repositories/space_repository.dart';
import 'package:youwu/domain/repositories/item_repository.dart';
import 'package:youwu/data/repositories/mock_space_repository_impl.dart';
import 'package:youwu/data/repositories/item_repository_impl.dart';
import 'package:youwu/features/home/view_model/map_cubit.dart';
import 'package:youwu/features/chat/view_model/chat_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerSingleton<SpaceRepository>(MockSpaceRepositoryImpl());
  
  sl.registerSingleton<ItemRepository>(ItemRepositoryImpl());
  
  sl.registerFactory<MapCubit>(() => MapCubit(
    spaceRepository: sl(),
  ));
  
  sl.registerFactory<ChatCubit>(() => ChatCubit(
    itemRepository: sl(),
  ));
}
