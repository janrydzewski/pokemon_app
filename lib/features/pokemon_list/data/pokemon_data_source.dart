import '../../../core/network/network_client.dart';
import 'pokemon_models.dart';

class PokemonDataSource {
  final NetworkClient _networkClient;

  PokemonDataSource(this._networkClient);

  Future<PokemonListResponse> getPokemonList({
    int limit = 20,
    int offset = 0,
  }) async {
    final response = await _networkClient.get<Map<String, dynamic>>(
      endpoint: '/pokemon',
      queryParameters: {'limit': limit, 'offset': offset},
    );

    return PokemonListResponse.fromJson(response);
  }

  Future<PokemonDetails> getPokemonDetails(String nameOrId) async {
    final response = await _networkClient.get<Map<String, dynamic>>(
      endpoint: '/pokemon/$nameOrId',
    );

    return PokemonDetails.fromJson(response);
  }
}
