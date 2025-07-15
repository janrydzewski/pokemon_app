// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonTypeListResponseImpl _$$PokemonTypeListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PokemonTypeListResponseImpl(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => PokemonTypeBasic.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$PokemonTypeListResponseImplToJson(
  _$PokemonTypeListResponseImpl instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};

_$PokemonTypeBasicImpl _$$PokemonTypeBasicImplFromJson(
  Map<String, dynamic> json,
) => _$PokemonTypeBasicImpl(
  name: json['name'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$$PokemonTypeBasicImplToJson(
  _$PokemonTypeBasicImpl instance,
) => <String, dynamic>{'name': instance.name, 'url': instance.url};

_$PokemonTypeDetailsImpl _$$PokemonTypeDetailsImplFromJson(
  Map<String, dynamic> json,
) => _$PokemonTypeDetailsImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  pokemon: (json['pokemon'] as List<dynamic>)
      .map((e) => PokemonTypeSlot.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$PokemonTypeDetailsImplToJson(
  _$PokemonTypeDetailsImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'pokemon': instance.pokemon,
};

_$PokemonTypeSlotImpl _$$PokemonTypeSlotImplFromJson(
  Map<String, dynamic> json,
) => _$PokemonTypeSlotImpl(
  slot: (json['slot'] as num).toInt(),
  pokemon: Pokemon.fromJson(json['pokemon'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$PokemonTypeSlotImplToJson(
  _$PokemonTypeSlotImpl instance,
) => <String, dynamic>{'slot': instance.slot, 'pokemon': instance.pokemon};
