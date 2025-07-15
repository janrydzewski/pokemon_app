import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/pokemon_list/data/pokemon_data_source.dart';
import '../../features/pokemon_list/data/pokemon_repository_impl.dart';
import '../../features/pokemon_list/domain/pokemon_repository.dart';
import '../../features/pokemon_list/presentation/pokemon_list_cubit.dart';
import '../cache/pokemon_cache_manager.dart';
import '../network/network_client.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    // Initialize Hive
    await Hive.initFlutter();

    // Initialize cache manager
    final cacheManager = PokemonCacheManager();
    await cacheManager.initialize();
    getIt.registerSingleton<PokemonCacheManager>(cacheManager);

    // Initialize HTTP cache options
    final cacheOptions = await NetworkClient.createCacheOptions();

    // Network
    getIt.registerLazySingleton<NetworkClient>(
      () => NetworkClient(cacheOptions: cacheOptions),
    );

    // Data sources
    getIt.registerLazySingleton<PokemonDataSource>(
      () => PokemonDataSource(getIt()),
    );

    // Repositories
    getIt.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImpl(getIt(), getIt()),
    );

    // Cubits
    getIt.registerFactory<PokemonListCubit>(() => PokemonListCubit(getIt()));

    // Clean up expired cache on app start
    await cacheManager.clearExpiredCache();
  }
}
