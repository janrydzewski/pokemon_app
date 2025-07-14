import 'package:get_it/get_it.dart';

import '../../features/pokemon_list/data/pokemon_data_source.dart';
import '../../features/pokemon_list/data/pokemon_repository_impl.dart';
import '../../features/pokemon_list/domain/pokemon_repository.dart';
import '../../features/pokemon_list/presentation/pokemon_list_cubit.dart';
import '../network/network_client.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    // Network
    getIt.registerLazySingleton<NetworkClient>(() => NetworkClient());

    // Data sources
    getIt.registerLazySingleton<PokemonDataSource>(
      () => PokemonDataSource(getIt()),
    );

    // Repositories
    getIt.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImpl(getIt()),
    );

    // Cubits
    getIt.registerFactory<PokemonListCubit>(() => PokemonListCubit(getIt()));
  }
}
