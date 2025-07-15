import '../../../core/constants/pagination_constants.dart';
import '../data/pokemon_models.dart';

abstract class PokemonRepository {
  Future<PokemonListResponse> getPokemonList({
    int limit = PaginationConstants.defaultPageSize,
    int offset = PaginationConstants.defaultOffset,
  });

  Future<PokemonListResponse> getPokemonListFromUrl(String url);

  Future<PokemonDetails> getPokemonDetails(String nameOrId);
}
