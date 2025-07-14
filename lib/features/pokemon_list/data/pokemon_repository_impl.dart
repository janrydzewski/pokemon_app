import '../domain/pokemon_repository.dart';
import 'pokemon_data_source.dart';
import 'pokemon_models.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource _dataSource;

  PokemonRepositoryImpl(this._dataSource);

  @override
  Future<PokemonListResponse> getPokemonList({
    int limit = 20,
    int offset = 0,
  }) async {
    return await _dataSource.getPokemonList(limit: limit, offset: offset);
  }

  @override
  Future<PokemonDetails> getPokemonDetails(String nameOrId) async {
    return await _dataSource.getPokemonDetails(nameOrId);
  }
}
