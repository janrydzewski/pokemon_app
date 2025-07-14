import '../../../core/constants/pagination_constants.dart';
import '../domain/pokemon_repository.dart';
import 'pokemon_data_source.dart';
import 'pokemon_models.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource _dataSource;

  PokemonRepositoryImpl(this._dataSource);

  @override
  Future<PokemonListResponse> getPokemonList({
    int limit = PaginationConstants.defaultPageSize,
    int offset = PaginationConstants.defaultOffset,
  }) async {
    return await _dataSource.getPokemonList(limit: limit, offset: offset);
  }

  @override
  Future<PokemonListResponse> getPokemonListFromUrl(String url) async {
    return await _dataSource.getPokemonListFromUrl(url);
  }

  @override
  Future<PokemonDetails> getPokemonDetails(String nameOrId) async {
    return await _dataSource.getPokemonDetails(nameOrId);
  }
}
