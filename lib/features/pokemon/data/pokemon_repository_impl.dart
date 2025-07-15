import 'package:flutter/material.dart';

import '../../../core/cache/pokemon_cache_manager.dart';
import '../../../core/constants/pagination_constants.dart';
import '../domain/pokemon_repository.dart';
import 'pokemon_data_source.dart';
import 'pokemon_models.dart';
import 'pokemon_type_models.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource _dataSource;
  final PokemonCacheManager _cacheManager;

  PokemonRepositoryImpl(this._dataSource, this._cacheManager);

  @override
  Future<PokemonListResponse> getPokemonList({
    int limit = PaginationConstants.defaultPageSize,
    int offset = PaginationConstants.defaultOffset,
  }) async {
    final cacheKey = _cacheManager.generateListCacheKey(
      limit: limit,
      offset: offset,
    );

    try {
      // 1. Try to get from local cache first
      final cachedResponse = await _cacheManager.getCachedPokemonList(cacheKey);
      if (cachedResponse != null) {
        debugPrint('📦 Pokemon list loaded from Hive cache');
        return cachedResponse;
      }

      // 2. Fetch from network (with HTTP cache)
      debugPrint('🌐 Fetching Pokemon list from API');
      final response = await _dataSource.getPokemonList(
        limit: limit,
        offset: offset,
      );

      // 3. Cache the response locally
      await _cacheManager.cachePokemonList(
        cacheKey: cacheKey,
        response: response,
      );

      return response;
    } catch (e) {
      // 4. Fallback to expired cache if network fails
      debugPrint('❌ Network error, trying expired cache');
      final expiredCache = await _cacheManager.getCachedPokemonListFallback(
        cacheKey,
      );
      if (expiredCache != null) {
        debugPrint('📦 Using expired cache as fallback');
        return expiredCache;
      }

      rethrow;
    }
  }

  @override
  Future<PokemonListResponse> getPokemonListFromUrl(String url) async {
    final cacheKey = _cacheManager.generateListCacheKeyFromUrl(url);

    try {
      // 1. Try to get from local cache first
      final cachedResponse = await _cacheManager.getCachedPokemonList(cacheKey);
      if (cachedResponse != null) {
        debugPrint('📦 Pokemon list (from URL) loaded from Hive cache');
        return cachedResponse;
      }

      // 2. Fetch from network (with HTTP cache)
      debugPrint('🌐 Fetching Pokemon list from URL: $url');
      final response = await _dataSource.getPokemonListFromUrl(url);

      // 3. Cache the response locally
      await _cacheManager.cachePokemonList(
        cacheKey: cacheKey,
        response: response,
      );

      return response;
    } catch (e) {
      // 4. Fallback to expired cache if network fails
      debugPrint('❌ Network error, trying expired cache');
      final expiredCache = await _cacheManager.getCachedPokemonListFallback(
        cacheKey,
      );
      if (expiredCache != null) {
        debugPrint('📦 Using expired cache as fallback');
        return expiredCache;
      }

      rethrow;
    }
  }

  @override
  Future<PokemonDetails> getPokemonDetails(String nameOrId) async {
    // For now, just delegate to data source
    // TODO: Add caching for Pokemon details in next iteration
    return await _dataSource.getPokemonDetails(nameOrId);
  }

  @override
  Future<PokemonTypeListResponse> getPokemonTypes() async {
    try {
      // 1. Try to get from local cache first
      final cachedResponse = await _cacheManager.getCachedPokemonTypes();
      if (cachedResponse != null) {
        debugPrint('📦 Pokemon types loaded from Hive cache');
        return cachedResponse;
      }

      // 2. Fetch from network (with HTTP cache)
      debugPrint('🌐 Fetching Pokemon types from API');
      final response = await _dataSource.getPokemonTypes();

      // 3. Cache the response locally
      await _cacheManager.cachePokemonTypes(response: response);

      return response;
    } catch (e) {
      // 4. Fallback to expired cache if network fails
      debugPrint('❌ Network error, trying expired cache for types');
      final expiredCache = await _cacheManager.getCachedPokemonTypesFallback();
      if (expiredCache != null) {
        debugPrint('📦 Using expired cache as fallback for types');
        return expiredCache;
      }

      rethrow;
    }
  }

  @override
  Future<PokemonTypeDetails> getPokemonsByType(String typeNameOrId) async {
    try {
      // 1. Try to get from local cache first
      final cachedResponse = await _cacheManager.getCachedPokemonByType(
        typeNameOrId,
      );
      if (cachedResponse != null) {
        debugPrint('📦 Pokemon by type "$typeNameOrId" loaded from Hive cache');
        return cachedResponse;
      }

      // 2. Fetch from network (with HTTP cache)
      debugPrint('🌐 Fetching Pokemon by type "$typeNameOrId" from API');
      final response = await _dataSource.getPokemonsByType(typeNameOrId);

      // 3. Cache the response locally
      await _cacheManager.cachePokemonByType(
        typeName: typeNameOrId,
        typeDetails: response,
      );

      return response;
    } catch (e) {
      // 4. Fallback to expired cache if network fails
      debugPrint(
        '❌ Network error, trying expired cache for type "$typeNameOrId"',
      );
      final expiredCache = await _cacheManager.getCachedPokemonByTypeFallback(
        typeNameOrId,
      );
      if (expiredCache != null) {
        debugPrint(
          '📦 Using expired cache as fallback for type "$typeNameOrId"',
        );
        return expiredCache;
      }

      rethrow;
    }
  }
}
