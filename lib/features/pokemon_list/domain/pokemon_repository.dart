import '../data/pokemon_models.dart';

abstract class PokemonRepository {
  Future<PokemonListResponse> getPokemonList({int limit = 20, int offset = 0});

  Future<PokemonDetails> getPokemonDetails(String nameOrId);
}
