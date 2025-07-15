// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonImpl _$$PokemonImplFromJson(Map<String, dynamic> json) =>
    _$PokemonImpl(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$$PokemonImplToJson(_$PokemonImpl instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

_$PokemonListResponseImpl _$$PokemonListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PokemonListResponseImpl(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$PokemonListResponseImplToJson(
  _$PokemonListResponseImpl instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};

_$PokemonDetailsImpl _$$PokemonDetailsImplFromJson(Map<String, dynamic> json) =>
    _$PokemonDetailsImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PokemonStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: PokemonSprites.fromJson(json['sprites'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonDetailsImplToJson(
  _$PokemonDetailsImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'height': instance.height,
  'weight': instance.weight,
  'types': instance.types,
  'stats': instance.stats,
  'sprites': instance.sprites,
};

_$PokemonTypeImpl _$$PokemonTypeImplFromJson(Map<String, dynamic> json) =>
    _$PokemonTypeImpl(
      slot: (json['slot'] as num).toInt(),
      type: TypeInfo.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonTypeImplToJson(_$PokemonTypeImpl instance) =>
    <String, dynamic>{'slot': instance.slot, 'type': instance.type};

_$TypeInfoImpl _$$TypeInfoImplFromJson(Map<String, dynamic> json) =>
    _$TypeInfoImpl(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$$TypeInfoImplToJson(_$TypeInfoImpl instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

_$PokemonStatImpl _$$PokemonStatImplFromJson(Map<String, dynamic> json) =>
    _$PokemonStatImpl(
      baseStat: (json['base_stat'] as num).toInt(),
      effort: (json['effort'] as num).toInt(),
      stat: StatInfo.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonStatImplToJson(_$PokemonStatImpl instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

_$StatInfoImpl _$$StatInfoImplFromJson(Map<String, dynamic> json) =>
    _$StatInfoImpl(name: json['name'] as String, url: json['url'] as String);

Map<String, dynamic> _$$StatInfoImplToJson(_$StatInfoImpl instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

_$PokemonSpritesImpl _$$PokemonSpritesImplFromJson(Map<String, dynamic> json) =>
    _$PokemonSpritesImpl(
      frontDefault: json['front_default'] as String?,
      frontShiny: json['front_shiny'] as String?,
      backDefault: json['back_default'] as String?,
      backShiny: json['back_shiny'] as String?,
      other: json['other'] == null
          ? null
          : PokemonSpritesOther.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonSpritesImplToJson(
  _$PokemonSpritesImpl instance,
) => <String, dynamic>{
  'front_default': instance.frontDefault,
  'front_shiny': instance.frontShiny,
  'back_default': instance.backDefault,
  'back_shiny': instance.backShiny,
  'other': instance.other,
};

_$PokemonSpritesOtherImpl _$$PokemonSpritesOtherImplFromJson(
  Map<String, dynamic> json,
) => _$PokemonSpritesOtherImpl(
  officialArtwork: json['official-artwork'] == null
      ? null
      : OfficialArtwork.fromJson(
          json['official-artwork'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$PokemonSpritesOtherImplToJson(
  _$PokemonSpritesOtherImpl instance,
) => <String, dynamic>{'official-artwork': instance.officialArtwork};

_$OfficialArtworkImpl _$$OfficialArtworkImplFromJson(
  Map<String, dynamic> json,
) => _$OfficialArtworkImpl(frontDefault: json['front_default'] as String?);

Map<String, dynamic> _$$OfficialArtworkImplToJson(
  _$OfficialArtworkImpl instance,
) => <String, dynamic>{'front_default': instance.frontDefault};
