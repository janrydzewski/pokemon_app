import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_models.freezed.dart';
part 'pokemon_models.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({required String name, required String url}) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}

@freezed
class PokemonListResponse with _$PokemonListResponse {
  const factory PokemonListResponse({
    required int count,
    required String? next,
    required String? previous,
    required List<Pokemon> results,
  }) = _PokemonListResponse;

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);
}

@freezed
class PokemonDetails with _$PokemonDetails {
  const factory PokemonDetails({
    required int id,
    required String name,
    required int height,
    required int weight,
    required List<PokemonType> types,
    required List<PokemonStat> stats,
    required PokemonSprites sprites,
  }) = _PokemonDetails;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsFromJson(json);
}

@freezed
class PokemonType with _$PokemonType {
  const factory PokemonType({required int slot, required TypeInfo type}) =
      _PokemonType;

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);
}

@freezed
class TypeInfo with _$TypeInfo {
  const factory TypeInfo({required String name, required String url}) =
      _TypeInfo;

  factory TypeInfo.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoFromJson(json);
}

@freezed
class PokemonStat with _$PokemonStat {
  const factory PokemonStat({
    required int baseStat,
    required int effort,
    required StatInfo stat,
  }) = _PokemonStat;

  factory PokemonStat.fromJson(Map<String, dynamic> json) => PokemonStat(
    baseStat: json['base_stat'] as int,
    effort: json['effort'] as int,
    stat: StatInfo.fromJson(json['stat'] as Map<String, dynamic>),
  );

  @override
  Map<String, dynamic> toJson() => {
    'base_stat': baseStat,
    'effort': effort,
    'stat': stat.toJson(),
  };
}

@freezed
class StatInfo with _$StatInfo {
  const factory StatInfo({required String name, required String url}) =
      _StatInfo;

  factory StatInfo.fromJson(Map<String, dynamic> json) =>
      _$StatInfoFromJson(json);
}

@freezed
class PokemonSprites with _$PokemonSprites {
  const factory PokemonSprites({
    String? frontDefault,
    String? frontShiny,
    String? backDefault,
    String? backShiny,
    PokemonSpritesOther? other,
  }) = _PokemonSprites;

  factory PokemonSprites.fromJson(Map<String, dynamic> json) => PokemonSprites(
    frontDefault: json['front_default'] as String?,
    frontShiny: json['front_shiny'] as String?,
    backDefault: json['back_default'] as String?,
    backShiny: json['back_shiny'] as String?,
    other: json['other'] != null
        ? PokemonSpritesOther.fromJson(json['other'] as Map<String, dynamic>)
        : null,
  );

  @override
  Map<String, dynamic> toJson() => {
    'front_default': frontDefault,
    'front_shiny': frontShiny,
    'back_default': backDefault,
    'back_shiny': backShiny,
    'other': other?.toJson(),
  };
}

@freezed
class PokemonSpritesOther with _$PokemonSpritesOther {
  const factory PokemonSpritesOther({OfficialArtwork? officialArtwork}) =
      _PokemonSpritesOther;

  factory PokemonSpritesOther.fromJson(Map<String, dynamic> json) =>
      PokemonSpritesOther(
        officialArtwork: json['official-artwork'] != null
            ? OfficialArtwork.fromJson(
                json['official-artwork'] as Map<String, dynamic>,
              )
            : null,
      );

  @override
  Map<String, dynamic> toJson() => {
    'official-artwork': officialArtwork?.toJson(),
  };
}

@freezed
class OfficialArtwork with _$OfficialArtwork {
  const factory OfficialArtwork({String? frontDefault}) = _OfficialArtwork;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(frontDefault: json['front_default'] as String?);

  @override
  Map<String, dynamic> toJson() => {'front_default': frontDefault};
}
