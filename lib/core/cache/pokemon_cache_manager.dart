import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../features/pokemon_list/data/pokemon_models.dart';
import '../../features/pokemon_list/data/pokemon_type_models.dart';

/// Local cache manager for Pokemon data using Hive
class PokemonCacheManager {
  static const String _pokemonListBoxName = 'pokemon_list_cache';
  static const String _pokemonDetailsBoxName = 'pokemon_details_cache';
  static const String _pokemonTypesBoxName = 'pokemon_types_cache';
  static const String _metadataBoxName = 'cache_metadata';

  // Cache duration settings
  static const Duration _listCacheDuration = Duration(hours: 1);
  static const Duration _detailsCacheDuration = Duration(hours: 6);
  static const Duration _typesCacheDuration = Duration(
    hours: 24,
  ); // Types change less frequently

  late Box<String> _pokemonListBox;
  late Box<String> _pokemonDetailsBox;
  late Box<String> _pokemonTypesBox;
  late Box<Map<dynamic, dynamic>> _metadataBox;

  /// Initialize Hive boxes
  Future<void> initialize() async {
    _pokemonListBox = await Hive.openBox<String>(_pokemonListBoxName);
    _pokemonDetailsBox = await Hive.openBox<String>(_pokemonDetailsBoxName);
    _pokemonTypesBox = await Hive.openBox<String>(_pokemonTypesBoxName);
    _metadataBox = await Hive.openBox<Map<dynamic, dynamic>>(_metadataBoxName);
  }

  /// Cache Pokemon list response
  Future<void> cachePokemonList({
    required String cacheKey,
    required PokemonListResponse response,
  }) async {
    try {
      final jsonString = jsonEncode(response.toJson());
      await _pokemonListBox.put(cacheKey, jsonString);

      // Store metadata with timestamp
      await _metadataBox.put(cacheKey, {
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'type': 'pokemon_list',
      });
    } catch (e) {
      debugPrint('Error caching Pokemon list: $e');
      rethrow;
    }
  }

  /// Get cached Pokemon list response
  Future<PokemonListResponse?> getCachedPokemonList(String cacheKey) async {
    try {
      // Check if cache exists and is valid
      if (!await _isCacheValid(cacheKey, _listCacheDuration)) {
        return null;
      }

      final jsonString = _pokemonListBox.get(cacheKey);
      if (jsonString == null) return null;

      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      return PokemonListResponse.fromJson(data);
    } catch (e) {
      debugPrint('Error reading cached Pokemon list: $e');
      // Remove corrupted cache
      await _pokemonListBox.delete(cacheKey);
      await _metadataBox.delete(cacheKey);
      return null;
    }
  }

  /// Get cached Pokemon list response ignoring TTL (for fallback)
  Future<PokemonListResponse?> getCachedPokemonListFallback(
    String cacheKey,
  ) async {
    try {
      final jsonString = _pokemonListBox.get(cacheKey);
      if (jsonString == null) return null;

      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      return PokemonListResponse.fromJson(data);
    } catch (e) {
      debugPrint('Error reading fallback cached Pokemon list: $e');
      // Remove corrupted cache
      await _pokemonListBox.delete(cacheKey);
      await _metadataBox.delete(cacheKey);
      return null;
    }
  }

  /// Cache Pokemon details
  Future<void> cachePokemonDetails({
    required String pokemonId,
    required PokemonDetails details,
  }) async {
    try {
      final jsonString = jsonEncode(details.toJson());
      await _pokemonDetailsBox.put(pokemonId, jsonString);

      // Store metadata with timestamp
      await _metadataBox.put('details_$pokemonId', {
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'type': 'pokemon_details',
      });
    } catch (e) {
      debugPrint('Error caching Pokemon details: $e');
      rethrow;
    }
  }

  /// Get cached Pokemon details
  Future<PokemonDetails?> getCachedPokemonDetails(String pokemonId) async {
    try {
      // Check if cache exists and is valid
      if (!await _isCacheValid('details_$pokemonId', _detailsCacheDuration)) {
        return null;
      }

      final jsonString = _pokemonDetailsBox.get(pokemonId);
      if (jsonString == null) return null;

      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      return PokemonDetails.fromJson(data);
    } catch (e) {
      debugPrint('Error reading cached Pokemon details: $e');
      // Remove corrupted cache
      await _pokemonDetailsBox.delete(pokemonId);
      await _metadataBox.delete('details_$pokemonId');
      return null;
    }
  }

  /// Cache Pokemon types list
  Future<void> cachePokemonTypes({
    required PokemonTypeListResponse response,
  }) async {
    try {
      final jsonString = jsonEncode(response.toJson());
      await _pokemonTypesBox.put('pokemon_types_list', jsonString);

      // Store metadata with timestamp
      await _metadataBox.put('pokemon_types_list', {
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'type': 'pokemon_types',
      });
    } catch (e) {
      debugPrint('Error caching Pokemon types: $e');
      rethrow;
    }
  }

  /// Get cached Pokemon types list
  Future<PokemonTypeListResponse?> getCachedPokemonTypes() async {
    try {
      // Check if cache exists and is valid
      if (!await _isCacheValid('pokemon_types_list', _typesCacheDuration)) {
        return null;
      }

      final jsonString = _pokemonTypesBox.get('pokemon_types_list');
      if (jsonString == null) return null;

      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      return PokemonTypeListResponse.fromJson(data);
    } catch (e) {
      debugPrint('Error reading cached Pokemon types: $e');
      // Remove corrupted cache
      await _pokemonTypesBox.delete('pokemon_types_list');
      await _metadataBox.delete('pokemon_types_list');
      return null;
    }
  }

  /// Get cached Pokemon types ignoring TTL (for fallback)
  Future<PokemonTypeListResponse?> getCachedPokemonTypesFallback() async {
    try {
      final jsonString = _pokemonTypesBox.get('pokemon_types_list');
      if (jsonString == null) return null;

      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      return PokemonTypeListResponse.fromJson(data);
    } catch (e) {
      debugPrint('Error reading fallback cached Pokemon types: $e');
      // Remove corrupted cache
      await _pokemonTypesBox.delete('pokemon_types_list');
      await _metadataBox.delete('pokemon_types_list');
      return null;
    }
  }

  /// Cache Pokemon by type details
  Future<void> cachePokemonByType({
    required String typeName,
    required PokemonTypeDetails typeDetails,
  }) async {
    try {
      final cacheKey = 'pokemon_type_$typeName';
      final jsonString = jsonEncode(typeDetails.toJson());
      await _pokemonTypesBox.put(cacheKey, jsonString);

      // Store metadata with timestamp
      await _metadataBox.put(cacheKey, {
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'type': 'pokemon_type_details',
      });
    } catch (e) {
      debugPrint('Error caching Pokemon by type: $e');
      rethrow;
    }
  }

  /// Get cached Pokemon by type details
  Future<PokemonTypeDetails?> getCachedPokemonByType(String typeName) async {
    try {
      final cacheKey = 'pokemon_type_$typeName';

      // Check if cache exists and is valid
      if (!await _isCacheValid(cacheKey, _typesCacheDuration)) {
        return null;
      }

      final jsonString = _pokemonTypesBox.get(cacheKey);
      if (jsonString == null) return null;

      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      return PokemonTypeDetails.fromJson(data);
    } catch (e) {
      debugPrint('Error reading cached Pokemon by type: $e');
      // Remove corrupted cache
      final cacheKey = 'pokemon_type_$typeName';
      await _pokemonTypesBox.delete(cacheKey);
      await _metadataBox.delete(cacheKey);
      return null;
    }
  }

  /// Get cached Pokemon by type ignoring TTL (for fallback)
  Future<PokemonTypeDetails?> getCachedPokemonByTypeFallback(
    String typeName,
  ) async {
    try {
      final cacheKey = 'pokemon_type_$typeName';
      final jsonString = _pokemonTypesBox.get(cacheKey);
      if (jsonString == null) return null;

      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      return PokemonTypeDetails.fromJson(data);
    } catch (e) {
      debugPrint('Error reading fallback cached Pokemon by type: $e');
      // Remove corrupted cache
      final cacheKey = 'pokemon_type_$typeName';
      await _pokemonTypesBox.delete(cacheKey);
      await _metadataBox.delete(cacheKey);
      return null;
    }
  }

  /// Check if cache is valid based on timestamp and TTL
  Future<bool> _isCacheValid(String cacheKey, Duration maxAge) async {
    final metadata = _metadataBox.get(cacheKey);
    if (metadata == null) return false;

    final timestamp = metadata['timestamp'] as int?;
    if (timestamp == null) return false;

    final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final now = DateTime.now();

    return now.difference(cacheTime) < maxAge;
  }

  /// Generate cache key for Pokemon list based on pagination parameters
  String generateListCacheKey({required int limit, required int offset}) {
    return 'pokemon_list_${limit}_$offset';
  }

  /// Generate cache key from URL
  String generateListCacheKeyFromUrl(String url) {
    final uri = Uri.parse(url);
    final limit = uri.queryParameters['limit'] ?? '20';
    final offset = uri.queryParameters['offset'] ?? '0';
    return 'pokemon_list_${limit}_$offset';
  }

  /// Clear all expired cache entries
  Future<void> clearExpiredCache() async {
    final now = DateTime.now();
    final keysToDelete = <String>[];

    for (final key in _metadataBox.keys) {
      final metadata = _metadataBox.get(key);
      if (metadata == null) continue;

      final timestamp = metadata['timestamp'] as int?;
      if (timestamp == null) {
        keysToDelete.add(key as String);
        continue;
      }

      final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      final type = metadata['type'] as String?;

      Duration maxAge;
      switch (type) {
        case 'pokemon_list':
          maxAge = _listCacheDuration;
          break;
        case 'pokemon_details':
          maxAge = _detailsCacheDuration;
          break;
        case 'pokemon_types':
        case 'pokemon_type_details':
          maxAge = _typesCacheDuration;
          break;
        default:
          maxAge = _listCacheDuration;
      }

      if (now.difference(cacheTime) > maxAge) {
        keysToDelete.add(key as String);
      }
    }

    // Delete expired entries
    for (final key in keysToDelete) {
      await _metadataBox.delete(key);

      if (key.startsWith('details_')) {
        final pokemonId = key.replaceFirst('details_', '');
        await _pokemonDetailsBox.delete(pokemonId);
      } else if (key.startsWith('pokemon_type_') ||
          key == 'pokemon_types_list') {
        await _pokemonTypesBox.delete(key);
      } else {
        await _pokemonListBox.delete(key);
      }
    }
  }

  /// Clear all cache
  Future<void> clearAllCache() async {
    await _pokemonListBox.clear();
    await _pokemonDetailsBox.clear();
    await _pokemonTypesBox.clear();
    await _metadataBox.clear();
  }

  /// Get cache statistics
  Future<Map<String, dynamic>> getCacheStats() async {
    return {
      'pokemon_list_entries': _pokemonListBox.length,
      'pokemon_details_entries': _pokemonDetailsBox.length,
      'pokemon_types_entries': _pokemonTypesBox.length,
      'metadata_entries': _metadataBox.length,
    };
  }
}
