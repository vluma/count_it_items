import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youwu/domain/repositories/space_repository.dart';
import 'package:youwu/domain/repositories/item_repository.dart';
import 'package:youwu/domain/repositories/notification_repository.dart';
import 'package:youwu/domain/repositories/settings_repository.dart';
import 'package:youwu/data/repositories/mock_space_repository_impl.dart';
import 'package:youwu/data/repositories/item_repository_impl.dart';
import 'package:youwu/data/repositories/notification_repository_impl.dart';
import 'package:youwu/data/repositories/settings_repository_impl.dart';
import 'package:youwu/data/models/settings_model.dart';
import 'package:youwu/features/home/view_model/map_cubit.dart';
import 'package:youwu/features/chat/view_model/chat_cubit.dart';
import 'package:youwu/features/notification/view_model/notification_cubit.dart';
import 'package:youwu/features/settings/view_model/settings_cubit.dart';
import 'package:youwu/core/services/speech_service.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [SettingsModelSchema],
    directory: dir.path,
  );
  
  sl.registerSingleton<Isar>(isar);
  
  sl.registerSingleton<SpaceRepository>(MockSpaceRepositoryImpl());

  sl.registerSingleton<ItemRepository>(ItemRepositoryImpl());

  sl.registerSingleton<NotificationRepository>(NotificationRepositoryImpl());
  
  sl.registerSingleton<SettingsRepository>(SettingsRepositoryImpl(sl()));

  sl.registerSingleton<SpeechService>(SpeechService());

  sl.registerFactory<MapCubit>(() => MapCubit(
    spaceRepository: sl(),
    itemRepository: sl(),
  ));

  sl.registerFactory<ChatCubit>(() => ChatCubit(
    itemRepository: sl(),
    speechService: sl(),
  ));

  sl.registerFactory<NotificationCubit>(() => NotificationCubit(
    notificationRepository: sl(),
  ));
  
  sl.registerFactory<SettingsCubit>(() => SettingsCubit(
    settingsRepository: sl(),
  ));
}
