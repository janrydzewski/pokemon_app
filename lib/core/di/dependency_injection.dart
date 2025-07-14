import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/pokemon_list/data/pokemon_data_source.dart';
import '../../features/pokemon_list/data/pokemon_repository_impl.dart';
import '../../features/pokemon_list/domain/pokemon_repository.dart';
import '../../features/pokemon_list/presentation/pokemon_list_cubit.dart';
import '../network/network_client.dart';

class DependencyInjection {
  static NetworkClient? _networkClient;
  static PokemonDataSource? _pokemonDataSource;
  static PokemonRepository? _pokemonRepository;

  static NetworkClient get networkClient {
    _networkClient ??= NetworkClient();
    return _networkClient!;
  }

  static PokemonDataSource get pokemonDataSource {
    _pokemonDataSource ??= PokemonDataSource(networkClient);
    return _pokemonDataSource!;
  }

  static PokemonRepository get pokemonRepository {
    _pokemonRepository ??= PokemonRepositoryImpl(pokemonDataSource);
    return _pokemonRepository!;
  }

  static List<BlocProvider> get blocProviders => [
    BlocProvider<PokemonListCubit>(
      create: (context) => PokemonListCubit(pokemonRepository),
    ),
  ];
}
