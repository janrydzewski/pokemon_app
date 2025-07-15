import '../../../core/constants/pagination_constants.dart';
import '../../../core/network/network_client.dart';
import 'pokemon_models.dart';

class PokemonDataSource {
  final NetworkClient _networkClient;

  PokemonDataSource(this._networkClient);

  Future<PokemonListResponse> getPokemonList({
    int limit = PaginationConstants.defaultPageSize,
    int offset = PaginationConstants.defaultOffset,
  }) async {
    final response = await _networkClient.get<Map<String, dynamic>>(
      endpoint: '/pokemon',
      queryParameters: {'limit': limit, 'offset': offset},
    );

    return PokemonListResponse.fromJson(response);
  }

  Future<PokemonListResponse> getPokemonListFromUrl(String url) async {
    final uri = Uri.parse(url);
    final endpoint = uri.path.replaceFirst('/api/v2', '');
    final queryParams = uri.queryParameters;

    final response = await _networkClient.get<Map<String, dynamic>>(
      endpoint: endpoint,
      queryParameters: queryParams,
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
