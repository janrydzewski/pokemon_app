import '../../../core/constants/pagination_constants.dart';
import '../data/pokemon_models.dart';
import '../data/pokemon_type_models.dart';

abstract class PokemonRepository {
  Future<PokemonListResponse> getPokemonList({
    int limit = PaginationConstants.defaultPageSize,
    int offset = PaginationConstants.defaultOffset,
  });

  Future<PokemonListResponse> getPokemonListFromUrl(String url);

  Future<PokemonDetails> getPokemonDetails(String nameOrId);

  /// Get list of all Pokemon types
  Future<PokemonTypeListResponse> getPokemonTypes();

  /// Get Pokemon details for a specific type
  Future<PokemonTypeDetails> getPokemonsByType(String typeNameOrId);
}
