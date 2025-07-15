import 'package:freezed_annotation/freezed_annotation.dart';

import 'pokemon_models.dart';

part 'pokemon_type_models.freezed.dart';
part 'pokemon_type_models.g.dart';

@freezed
class PokemonTypeListResponse with _$PokemonTypeListResponse {
  const factory PokemonTypeListResponse({
    required int count,
    required String? next,
    required String? previous,
    required List<PokemonTypeBasic> results,
  }) = _PokemonTypeListResponse;

  factory PokemonTypeListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeListResponseFromJson(json);
}

@freezed
class PokemonTypeBasic with _$PokemonTypeBasic {
  const factory PokemonTypeBasic({required String name, required String url}) =
      _PokemonTypeBasic;

  factory PokemonTypeBasic.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeBasicFromJson(json);
}

@freezed
class PokemonTypeDetails with _$PokemonTypeDetails {
  const factory PokemonTypeDetails({
    required int id,
    required String name,
    required List<PokemonTypeSlot> pokemon,
  }) = _PokemonTypeDetails;

  factory PokemonTypeDetails.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeDetailsFromJson(json);
}

@freezed
class PokemonTypeSlot with _$PokemonTypeSlot {
  const factory PokemonTypeSlot({required int slot, required Pokemon pokemon}) =
      _PokemonTypeSlot;

  factory PokemonTypeSlot.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeSlotFromJson(json);
}

/// Predefiniowane typy Pokemonów zgodnie z API
class PokemonTypes {
  static const List<PokemonTypeBasic> predefinedTypes = [
    PokemonTypeBasic(name: 'normal', url: 'https://pokeapi.co/api/v2/type/1/'),
    PokemonTypeBasic(
      name: 'fighting',
      url: 'https://pokeapi.co/api/v2/type/2/',
    ),
    PokemonTypeBasic(name: 'flying', url: 'https://pokeapi.co/api/v2/type/3/'),
    PokemonTypeBasic(name: 'poison', url: 'https://pokeapi.co/api/v2/type/4/'),
    PokemonTypeBasic(name: 'ground', url: 'https://pokeapi.co/api/v2/type/5/'),
    PokemonTypeBasic(name: 'rock', url: 'https://pokeapi.co/api/v2/type/6/'),
    PokemonTypeBasic(name: 'bug', url: 'https://pokeapi.co/api/v2/type/7/'),
    PokemonTypeBasic(name: 'ghost', url: 'https://pokeapi.co/api/v2/type/8/'),
    PokemonTypeBasic(name: 'steel', url: 'https://pokeapi.co/api/v2/type/9/'),
    PokemonTypeBasic(name: 'fire', url: 'https://pokeapi.co/api/v2/type/10/'),
    PokemonTypeBasic(name: 'water', url: 'https://pokeapi.co/api/v2/type/11/'),
    PokemonTypeBasic(name: 'grass', url: 'https://pokeapi.co/api/v2/type/12/'),
    PokemonTypeBasic(
      name: 'electric',
      url: 'https://pokeapi.co/api/v2/type/13/',
    ),
    PokemonTypeBasic(
      name: 'psychic',
      url: 'https://pokeapi.co/api/v2/type/14/',
    ),
    PokemonTypeBasic(name: 'ice', url: 'https://pokeapi.co/api/v2/type/15/'),
    PokemonTypeBasic(name: 'dragon', url: 'https://pokeapi.co/api/v2/type/16/'),
    PokemonTypeBasic(name: 'dark', url: 'https://pokeapi.co/api/v2/type/17/'),
    PokemonTypeBasic(name: 'fairy', url: 'https://pokeapi.co/api/v2/type/18/'),
    PokemonTypeBasic(
      name: 'stellar',
      url: 'https://pokeapi.co/api/v2/type/19/',
    ),
    PokemonTypeBasic(
      name: 'unknown',
      url: 'https://pokeapi.co/api/v2/type/10001/',
    ),
  ];

  static String getTypeDisplayName(String typeName) {
    switch (typeName.toLowerCase()) {
      case 'normal':
        return 'NORMAL';
      case 'fighting':
        return 'FIGHTING';
      case 'flying':
        return 'FLYING';
      case 'poison':
        return 'POISON';
      case 'ground':
        return 'GROUND';
      case 'rock':
        return 'ROCK';
      case 'bug':
        return 'BUG';
      case 'ghost':
        return 'GHOST';
      case 'steel':
        return 'STEEL';
      case 'fire':
        return 'FIRE';
      case 'water':
        return 'WATER';
      case 'grass':
        return 'GRASS';
      case 'electric':
        return 'ELECTRIC';
      case 'psychic':
        return 'PSYCHIC';
      case 'ice':
        return 'ICE';
      case 'dragon':
        return 'DRAGON';
      case 'dark':
        return 'DARK';
      case 'fairy':
        return 'FAIRY';
      case 'stellar':
        return 'STELLAR';
      case 'unknown':
        return 'UNKNOWN';
      default:
        return typeName.toUpperCase();
    }
  }
}
