// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return _Pokemon.fromJson(json);
}

/// @nodoc
mixin _$Pokemon {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this Pokemon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonCopyWith<Pokemon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonCopyWith<$Res> {
  factory $PokemonCopyWith(Pokemon value, $Res Function(Pokemon) then) =
      _$PokemonCopyWithImpl<$Res, Pokemon>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonCopyWithImpl<$Res, $Val extends Pokemon>
    implements $PokemonCopyWith<$Res> {
  _$PokemonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? url = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PokemonImplCopyWith<$Res> implements $PokemonCopyWith<$Res> {
  factory _$$PokemonImplCopyWith(
    _$PokemonImpl value,
    $Res Function(_$PokemonImpl) then,
  ) = __$$PokemonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$PokemonImplCopyWithImpl<$Res>
    extends _$PokemonCopyWithImpl<$Res, _$PokemonImpl>
    implements _$$PokemonImplCopyWith<$Res> {
  __$$PokemonImplCopyWithImpl(
    _$PokemonImpl _value,
    $Res Function(_$PokemonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? url = null}) {
    return _then(
      _$PokemonImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonImpl implements _Pokemon {
  const _$PokemonImpl({required this.name, required this.url});

  factory _$PokemonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'Pokemon(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonImplCopyWith<_$PokemonImpl> get copyWith =>
      __$$PokemonImplCopyWithImpl<_$PokemonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonImplToJson(this);
  }
}

abstract class _Pokemon implements Pokemon {
  const factory _Pokemon({
    required final String name,
    required final String url,
  }) = _$PokemonImpl;

  factory _Pokemon.fromJson(Map<String, dynamic> json) = _$PokemonImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of Pokemon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonImplCopyWith<_$PokemonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonListResponse _$PokemonListResponseFromJson(Map<String, dynamic> json) {
  return _PokemonListResponse.fromJson(json);
}

/// @nodoc
mixin _$PokemonListResponse {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Pokemon> get results => throw _privateConstructorUsedError;

  /// Serializes this PokemonListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonListResponseCopyWith<PokemonListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListResponseCopyWith<$Res> {
  factory $PokemonListResponseCopyWith(
    PokemonListResponse value,
    $Res Function(PokemonListResponse) then,
  ) = _$PokemonListResponseCopyWithImpl<$Res, PokemonListResponse>;
  @useResult
  $Res call({int count, String? next, String? previous, List<Pokemon> results});
}

/// @nodoc
class _$PokemonListResponseCopyWithImpl<$Res, $Val extends PokemonListResponse>
    implements $PokemonListResponseCopyWith<$Res> {
  _$PokemonListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(
      _value.copyWith(
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            next: freezed == next
                ? _value.next
                : next // ignore: cast_nullable_to_non_nullable
                      as String?,
            previous: freezed == previous
                ? _value.previous
                : previous // ignore: cast_nullable_to_non_nullable
                      as String?,
            results: null == results
                ? _value.results
                : results // ignore: cast_nullable_to_non_nullable
                      as List<Pokemon>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PokemonListResponseImplCopyWith<$Res>
    implements $PokemonListResponseCopyWith<$Res> {
  factory _$$PokemonListResponseImplCopyWith(
    _$PokemonListResponseImpl value,
    $Res Function(_$PokemonListResponseImpl) then,
  ) = __$$PokemonListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, String? next, String? previous, List<Pokemon> results});
}

/// @nodoc
class __$$PokemonListResponseImplCopyWithImpl<$Res>
    extends _$PokemonListResponseCopyWithImpl<$Res, _$PokemonListResponseImpl>
    implements _$$PokemonListResponseImplCopyWith<$Res> {
  __$$PokemonListResponseImplCopyWithImpl(
    _$PokemonListResponseImpl _value,
    $Res Function(_$PokemonListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(
      _$PokemonListResponseImpl(
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        next: freezed == next
            ? _value.next
            : next // ignore: cast_nullable_to_non_nullable
                  as String?,
        previous: freezed == previous
            ? _value.previous
            : previous // ignore: cast_nullable_to_non_nullable
                  as String?,
        results: null == results
            ? _value._results
            : results // ignore: cast_nullable_to_non_nullable
                  as List<Pokemon>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonListResponseImpl implements _PokemonListResponse {
  const _$PokemonListResponseImpl({
    required this.count,
    required this.next,
    required this.previous,
    required final List<Pokemon> results,
  }) : _results = results;

  factory _$PokemonListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonListResponseImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<Pokemon> _results;
  @override
  List<Pokemon> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PokemonListResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonListResponseImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    count,
    next,
    previous,
    const DeepCollectionEquality().hash(_results),
  );

  /// Create a copy of PokemonListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonListResponseImplCopyWith<_$PokemonListResponseImpl> get copyWith =>
      __$$PokemonListResponseImplCopyWithImpl<_$PokemonListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonListResponseImplToJson(this);
  }
}

abstract class _PokemonListResponse implements PokemonListResponse {
  const factory _PokemonListResponse({
    required final int count,
    required final String? next,
    required final String? previous,
    required final List<Pokemon> results,
  }) = _$PokemonListResponseImpl;

  factory _PokemonListResponse.fromJson(Map<String, dynamic> json) =
      _$PokemonListResponseImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<Pokemon> get results;

  /// Create a copy of PokemonListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonListResponseImplCopyWith<_$PokemonListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonDetails _$PokemonDetailsFromJson(Map<String, dynamic> json) {
  return _PokemonDetails.fromJson(json);
}

/// @nodoc
mixin _$PokemonDetails {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  List<PokemonType> get types => throw _privateConstructorUsedError;
  List<PokemonStat> get stats => throw _privateConstructorUsedError;
  PokemonSprites get sprites => throw _privateConstructorUsedError;

  /// Serializes this PokemonDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonDetailsCopyWith<PokemonDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailsCopyWith<$Res> {
  factory $PokemonDetailsCopyWith(
    PokemonDetails value,
    $Res Function(PokemonDetails) then,
  ) = _$PokemonDetailsCopyWithImpl<$Res, PokemonDetails>;
  @useResult
  $Res call({
    int id,
    String name,
    int height,
    int weight,
    List<PokemonType> types,
    List<PokemonStat> stats,
    PokemonSprites sprites,
  });

  $PokemonSpritesCopyWith<$Res> get sprites;
}

/// @nodoc
class _$PokemonDetailsCopyWithImpl<$Res, $Val extends PokemonDetails>
    implements $PokemonDetailsCopyWith<$Res> {
  _$PokemonDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? types = null,
    Object? stats = null,
    Object? sprites = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as int,
            weight: null == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as int,
            types: null == types
                ? _value.types
                : types // ignore: cast_nullable_to_non_nullable
                      as List<PokemonType>,
            stats: null == stats
                ? _value.stats
                : stats // ignore: cast_nullable_to_non_nullable
                      as List<PokemonStat>,
            sprites: null == sprites
                ? _value.sprites
                : sprites // ignore: cast_nullable_to_non_nullable
                      as PokemonSprites,
          )
          as $Val,
    );
  }

  /// Create a copy of PokemonDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonSpritesCopyWith<$Res> get sprites {
    return $PokemonSpritesCopyWith<$Res>(_value.sprites, (value) {
      return _then(_value.copyWith(sprites: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonDetailsImplCopyWith<$Res>
    implements $PokemonDetailsCopyWith<$Res> {
  factory _$$PokemonDetailsImplCopyWith(
    _$PokemonDetailsImpl value,
    $Res Function(_$PokemonDetailsImpl) then,
  ) = __$$PokemonDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    int height,
    int weight,
    List<PokemonType> types,
    List<PokemonStat> stats,
    PokemonSprites sprites,
  });

  @override
  $PokemonSpritesCopyWith<$Res> get sprites;
}

/// @nodoc
class __$$PokemonDetailsImplCopyWithImpl<$Res>
    extends _$PokemonDetailsCopyWithImpl<$Res, _$PokemonDetailsImpl>
    implements _$$PokemonDetailsImplCopyWith<$Res> {
  __$$PokemonDetailsImplCopyWithImpl(
    _$PokemonDetailsImpl _value,
    $Res Function(_$PokemonDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? height = null,
    Object? weight = null,
    Object? types = null,
    Object? stats = null,
    Object? sprites = null,
  }) {
    return _then(
      _$PokemonDetailsImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as int,
        weight: null == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as int,
        types: null == types
            ? _value._types
            : types // ignore: cast_nullable_to_non_nullable
                  as List<PokemonType>,
        stats: null == stats
            ? _value._stats
            : stats // ignore: cast_nullable_to_non_nullable
                  as List<PokemonStat>,
        sprites: null == sprites
            ? _value.sprites
            : sprites // ignore: cast_nullable_to_non_nullable
                  as PokemonSprites,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonDetailsImpl implements _PokemonDetails {
  const _$PokemonDetailsImpl({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required final List<PokemonType> types,
    required final List<PokemonStat> stats,
    required this.sprites,
  }) : _types = types,
       _stats = stats;

  factory _$PokemonDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonDetailsImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int height;
  @override
  final int weight;
  final List<PokemonType> _types;
  @override
  List<PokemonType> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  final List<PokemonStat> _stats;
  @override
  List<PokemonStat> get stats {
    if (_stats is EqualUnmodifiableListView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stats);
  }

  @override
  final PokemonSprites sprites;

  @override
  String toString() {
    return 'PokemonDetails(id: $id, name: $name, height: $height, weight: $weight, types: $types, stats: $stats, sprites: $sprites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(other._stats, _stats) &&
            (identical(other.sprites, sprites) || other.sprites == sprites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    height,
    weight,
    const DeepCollectionEquality().hash(_types),
    const DeepCollectionEquality().hash(_stats),
    sprites,
  );

  /// Create a copy of PokemonDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonDetailsImplCopyWith<_$PokemonDetailsImpl> get copyWith =>
      __$$PokemonDetailsImplCopyWithImpl<_$PokemonDetailsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonDetailsImplToJson(this);
  }
}

abstract class _PokemonDetails implements PokemonDetails {
  const factory _PokemonDetails({
    required final int id,
    required final String name,
    required final int height,
    required final int weight,
    required final List<PokemonType> types,
    required final List<PokemonStat> stats,
    required final PokemonSprites sprites,
  }) = _$PokemonDetailsImpl;

  factory _PokemonDetails.fromJson(Map<String, dynamic> json) =
      _$PokemonDetailsImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get height;
  @override
  int get weight;
  @override
  List<PokemonType> get types;
  @override
  List<PokemonStat> get stats;
  @override
  PokemonSprites get sprites;

  /// Create a copy of PokemonDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonDetailsImplCopyWith<_$PokemonDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) {
  return _PokemonType.fromJson(json);
}

/// @nodoc
mixin _$PokemonType {
  int get slot => throw _privateConstructorUsedError;
  TypeInfo get type => throw _privateConstructorUsedError;

  /// Serializes this PokemonType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTypeCopyWith<PokemonType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeCopyWith<$Res> {
  factory $PokemonTypeCopyWith(
    PokemonType value,
    $Res Function(PokemonType) then,
  ) = _$PokemonTypeCopyWithImpl<$Res, PokemonType>;
  @useResult
  $Res call({int slot, TypeInfo type});

  $TypeInfoCopyWith<$Res> get type;
}

/// @nodoc
class _$PokemonTypeCopyWithImpl<$Res, $Val extends PokemonType>
    implements $PokemonTypeCopyWith<$Res> {
  _$PokemonTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? slot = null, Object? type = null}) {
    return _then(
      _value.copyWith(
            slot: null == slot
                ? _value.slot
                : slot // ignore: cast_nullable_to_non_nullable
                      as int,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as TypeInfo,
          )
          as $Val,
    );
  }

  /// Create a copy of PokemonType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TypeInfoCopyWith<$Res> get type {
    return $TypeInfoCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonTypeImplCopyWith<$Res>
    implements $PokemonTypeCopyWith<$Res> {
  factory _$$PokemonTypeImplCopyWith(
    _$PokemonTypeImpl value,
    $Res Function(_$PokemonTypeImpl) then,
  ) = __$$PokemonTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int slot, TypeInfo type});

  @override
  $TypeInfoCopyWith<$Res> get type;
}

/// @nodoc
class __$$PokemonTypeImplCopyWithImpl<$Res>
    extends _$PokemonTypeCopyWithImpl<$Res, _$PokemonTypeImpl>
    implements _$$PokemonTypeImplCopyWith<$Res> {
  __$$PokemonTypeImplCopyWithImpl(
    _$PokemonTypeImpl _value,
    $Res Function(_$PokemonTypeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? slot = null, Object? type = null}) {
    return _then(
      _$PokemonTypeImpl(
        slot: null == slot
            ? _value.slot
            : slot // ignore: cast_nullable_to_non_nullable
                  as int,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as TypeInfo,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonTypeImpl implements _PokemonType {
  const _$PokemonTypeImpl({required this.slot, required this.type});

  factory _$PokemonTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonTypeImplFromJson(json);

  @override
  final int slot;
  @override
  final TypeInfo type;

  @override
  String toString() {
    return 'PokemonType(slot: $slot, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTypeImpl &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slot, type);

  /// Create a copy of PokemonType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTypeImplCopyWith<_$PokemonTypeImpl> get copyWith =>
      __$$PokemonTypeImplCopyWithImpl<_$PokemonTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonTypeImplToJson(this);
  }
}

abstract class _PokemonType implements PokemonType {
  const factory _PokemonType({
    required final int slot,
    required final TypeInfo type,
  }) = _$PokemonTypeImpl;

  factory _PokemonType.fromJson(Map<String, dynamic> json) =
      _$PokemonTypeImpl.fromJson;

  @override
  int get slot;
  @override
  TypeInfo get type;

  /// Create a copy of PokemonType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTypeImplCopyWith<_$PokemonTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TypeInfo _$TypeInfoFromJson(Map<String, dynamic> json) {
  return _TypeInfo.fromJson(json);
}

/// @nodoc
mixin _$TypeInfo {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this TypeInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TypeInfoCopyWith<TypeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeInfoCopyWith<$Res> {
  factory $TypeInfoCopyWith(TypeInfo value, $Res Function(TypeInfo) then) =
      _$TypeInfoCopyWithImpl<$Res, TypeInfo>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$TypeInfoCopyWithImpl<$Res, $Val extends TypeInfo>
    implements $TypeInfoCopyWith<$Res> {
  _$TypeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? url = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TypeInfoImplCopyWith<$Res>
    implements $TypeInfoCopyWith<$Res> {
  factory _$$TypeInfoImplCopyWith(
    _$TypeInfoImpl value,
    $Res Function(_$TypeInfoImpl) then,
  ) = __$$TypeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$TypeInfoImplCopyWithImpl<$Res>
    extends _$TypeInfoCopyWithImpl<$Res, _$TypeInfoImpl>
    implements _$$TypeInfoImplCopyWith<$Res> {
  __$$TypeInfoImplCopyWithImpl(
    _$TypeInfoImpl _value,
    $Res Function(_$TypeInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? url = null}) {
    return _then(
      _$TypeInfoImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeInfoImpl implements _TypeInfo {
  const _$TypeInfoImpl({required this.name, required this.url});

  factory _$TypeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'TypeInfo(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of TypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeInfoImplCopyWith<_$TypeInfoImpl> get copyWith =>
      __$$TypeInfoImplCopyWithImpl<_$TypeInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeInfoImplToJson(this);
  }
}

abstract class _TypeInfo implements TypeInfo {
  const factory _TypeInfo({
    required final String name,
    required final String url,
  }) = _$TypeInfoImpl;

  factory _TypeInfo.fromJson(Map<String, dynamic> json) =
      _$TypeInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of TypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypeInfoImplCopyWith<_$TypeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonStat _$PokemonStatFromJson(Map<String, dynamic> json) {
  return _PokemonStat.fromJson(json);
}

/// @nodoc
mixin _$PokemonStat {
  @JsonKey(name: 'base_stat')
  int get baseStat => throw _privateConstructorUsedError;
  int get effort => throw _privateConstructorUsedError;
  StatInfo get stat => throw _privateConstructorUsedError;

  /// Serializes this PokemonStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonStatCopyWith<PokemonStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStatCopyWith<$Res> {
  factory $PokemonStatCopyWith(
    PokemonStat value,
    $Res Function(PokemonStat) then,
  ) = _$PokemonStatCopyWithImpl<$Res, PokemonStat>;
  @useResult
  $Res call({
    @JsonKey(name: 'base_stat') int baseStat,
    int effort,
    StatInfo stat,
  });

  $StatInfoCopyWith<$Res> get stat;
}

/// @nodoc
class _$PokemonStatCopyWithImpl<$Res, $Val extends PokemonStat>
    implements $PokemonStatCopyWith<$Res> {
  _$PokemonStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? effort = null,
    Object? stat = null,
  }) {
    return _then(
      _value.copyWith(
            baseStat: null == baseStat
                ? _value.baseStat
                : baseStat // ignore: cast_nullable_to_non_nullable
                      as int,
            effort: null == effort
                ? _value.effort
                : effort // ignore: cast_nullable_to_non_nullable
                      as int,
            stat: null == stat
                ? _value.stat
                : stat // ignore: cast_nullable_to_non_nullable
                      as StatInfo,
          )
          as $Val,
    );
  }

  /// Create a copy of PokemonStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatInfoCopyWith<$Res> get stat {
    return $StatInfoCopyWith<$Res>(_value.stat, (value) {
      return _then(_value.copyWith(stat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonStatImplCopyWith<$Res>
    implements $PokemonStatCopyWith<$Res> {
  factory _$$PokemonStatImplCopyWith(
    _$PokemonStatImpl value,
    $Res Function(_$PokemonStatImpl) then,
  ) = __$$PokemonStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'base_stat') int baseStat,
    int effort,
    StatInfo stat,
  });

  @override
  $StatInfoCopyWith<$Res> get stat;
}

/// @nodoc
class __$$PokemonStatImplCopyWithImpl<$Res>
    extends _$PokemonStatCopyWithImpl<$Res, _$PokemonStatImpl>
    implements _$$PokemonStatImplCopyWith<$Res> {
  __$$PokemonStatImplCopyWithImpl(
    _$PokemonStatImpl _value,
    $Res Function(_$PokemonStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? effort = null,
    Object? stat = null,
  }) {
    return _then(
      _$PokemonStatImpl(
        baseStat: null == baseStat
            ? _value.baseStat
            : baseStat // ignore: cast_nullable_to_non_nullable
                  as int,
        effort: null == effort
            ? _value.effort
            : effort // ignore: cast_nullable_to_non_nullable
                  as int,
        stat: null == stat
            ? _value.stat
            : stat // ignore: cast_nullable_to_non_nullable
                  as StatInfo,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonStatImpl implements _PokemonStat {
  const _$PokemonStatImpl({
    @JsonKey(name: 'base_stat') required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory _$PokemonStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonStatImplFromJson(json);

  @override
  @JsonKey(name: 'base_stat')
  final int baseStat;
  @override
  final int effort;
  @override
  final StatInfo stat;

  @override
  String toString() {
    return 'PokemonStat(baseStat: $baseStat, effort: $effort, stat: $stat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonStatImpl &&
            (identical(other.baseStat, baseStat) ||
                other.baseStat == baseStat) &&
            (identical(other.effort, effort) || other.effort == effort) &&
            (identical(other.stat, stat) || other.stat == stat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, baseStat, effort, stat);

  /// Create a copy of PokemonStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonStatImplCopyWith<_$PokemonStatImpl> get copyWith =>
      __$$PokemonStatImplCopyWithImpl<_$PokemonStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonStatImplToJson(this);
  }
}

abstract class _PokemonStat implements PokemonStat {
  const factory _PokemonStat({
    @JsonKey(name: 'base_stat') required final int baseStat,
    required final int effort,
    required final StatInfo stat,
  }) = _$PokemonStatImpl;

  factory _PokemonStat.fromJson(Map<String, dynamic> json) =
      _$PokemonStatImpl.fromJson;

  @override
  @JsonKey(name: 'base_stat')
  int get baseStat;
  @override
  int get effort;
  @override
  StatInfo get stat;

  /// Create a copy of PokemonStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonStatImplCopyWith<_$PokemonStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatInfo _$StatInfoFromJson(Map<String, dynamic> json) {
  return _StatInfo.fromJson(json);
}

/// @nodoc
mixin _$StatInfo {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this StatInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatInfoCopyWith<StatInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatInfoCopyWith<$Res> {
  factory $StatInfoCopyWith(StatInfo value, $Res Function(StatInfo) then) =
      _$StatInfoCopyWithImpl<$Res, StatInfo>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$StatInfoCopyWithImpl<$Res, $Val extends StatInfo>
    implements $StatInfoCopyWith<$Res> {
  _$StatInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? url = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StatInfoImplCopyWith<$Res>
    implements $StatInfoCopyWith<$Res> {
  factory _$$StatInfoImplCopyWith(
    _$StatInfoImpl value,
    $Res Function(_$StatInfoImpl) then,
  ) = __$$StatInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$StatInfoImplCopyWithImpl<$Res>
    extends _$StatInfoCopyWithImpl<$Res, _$StatInfoImpl>
    implements _$$StatInfoImplCopyWith<$Res> {
  __$$StatInfoImplCopyWithImpl(
    _$StatInfoImpl _value,
    $Res Function(_$StatInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? url = null}) {
    return _then(
      _$StatInfoImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StatInfoImpl implements _StatInfo {
  const _$StatInfoImpl({required this.name, required this.url});

  factory _$StatInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatInfoImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'StatInfo(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of StatInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatInfoImplCopyWith<_$StatInfoImpl> get copyWith =>
      __$$StatInfoImplCopyWithImpl<_$StatInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatInfoImplToJson(this);
  }
}

abstract class _StatInfo implements StatInfo {
  const factory _StatInfo({
    required final String name,
    required final String url,
  }) = _$StatInfoImpl;

  factory _StatInfo.fromJson(Map<String, dynamic> json) =
      _$StatInfoImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of StatInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatInfoImplCopyWith<_$StatInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonSprites _$PokemonSpritesFromJson(Map<String, dynamic> json) {
  return _PokemonSprites.fromJson(json);
}

/// @nodoc
mixin _$PokemonSprites {
  @JsonKey(name: 'front_default')
  String? get frontDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'front_shiny')
  String? get frontShiny => throw _privateConstructorUsedError;
  @JsonKey(name: 'back_default')
  String? get backDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'back_shiny')
  String? get backShiny => throw _privateConstructorUsedError;
  PokemonSpritesOther? get other => throw _privateConstructorUsedError;

  /// Serializes this PokemonSprites to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonSpritesCopyWith<PokemonSprites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonSpritesCopyWith<$Res> {
  factory $PokemonSpritesCopyWith(
    PokemonSprites value,
    $Res Function(PokemonSprites) then,
  ) = _$PokemonSpritesCopyWithImpl<$Res, PokemonSprites>;
  @useResult
  $Res call({
    @JsonKey(name: 'front_default') String? frontDefault,
    @JsonKey(name: 'front_shiny') String? frontShiny,
    @JsonKey(name: 'back_default') String? backDefault,
    @JsonKey(name: 'back_shiny') String? backShiny,
    PokemonSpritesOther? other,
  });

  $PokemonSpritesOtherCopyWith<$Res>? get other;
}

/// @nodoc
class _$PokemonSpritesCopyWithImpl<$Res, $Val extends PokemonSprites>
    implements $PokemonSpritesCopyWith<$Res> {
  _$PokemonSpritesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
    Object? frontShiny = freezed,
    Object? backDefault = freezed,
    Object? backShiny = freezed,
    Object? other = freezed,
  }) {
    return _then(
      _value.copyWith(
            frontDefault: freezed == frontDefault
                ? _value.frontDefault
                : frontDefault // ignore: cast_nullable_to_non_nullable
                      as String?,
            frontShiny: freezed == frontShiny
                ? _value.frontShiny
                : frontShiny // ignore: cast_nullable_to_non_nullable
                      as String?,
            backDefault: freezed == backDefault
                ? _value.backDefault
                : backDefault // ignore: cast_nullable_to_non_nullable
                      as String?,
            backShiny: freezed == backShiny
                ? _value.backShiny
                : backShiny // ignore: cast_nullable_to_non_nullable
                      as String?,
            other: freezed == other
                ? _value.other
                : other // ignore: cast_nullable_to_non_nullable
                      as PokemonSpritesOther?,
          )
          as $Val,
    );
  }

  /// Create a copy of PokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonSpritesOtherCopyWith<$Res>? get other {
    if (_value.other == null) {
      return null;
    }

    return $PokemonSpritesOtherCopyWith<$Res>(_value.other!, (value) {
      return _then(_value.copyWith(other: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonSpritesImplCopyWith<$Res>
    implements $PokemonSpritesCopyWith<$Res> {
  factory _$$PokemonSpritesImplCopyWith(
    _$PokemonSpritesImpl value,
    $Res Function(_$PokemonSpritesImpl) then,
  ) = __$$PokemonSpritesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'front_default') String? frontDefault,
    @JsonKey(name: 'front_shiny') String? frontShiny,
    @JsonKey(name: 'back_default') String? backDefault,
    @JsonKey(name: 'back_shiny') String? backShiny,
    PokemonSpritesOther? other,
  });

  @override
  $PokemonSpritesOtherCopyWith<$Res>? get other;
}

/// @nodoc
class __$$PokemonSpritesImplCopyWithImpl<$Res>
    extends _$PokemonSpritesCopyWithImpl<$Res, _$PokemonSpritesImpl>
    implements _$$PokemonSpritesImplCopyWith<$Res> {
  __$$PokemonSpritesImplCopyWithImpl(
    _$PokemonSpritesImpl _value,
    $Res Function(_$PokemonSpritesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = freezed,
    Object? frontShiny = freezed,
    Object? backDefault = freezed,
    Object? backShiny = freezed,
    Object? other = freezed,
  }) {
    return _then(
      _$PokemonSpritesImpl(
        frontDefault: freezed == frontDefault
            ? _value.frontDefault
            : frontDefault // ignore: cast_nullable_to_non_nullable
                  as String?,
        frontShiny: freezed == frontShiny
            ? _value.frontShiny
            : frontShiny // ignore: cast_nullable_to_non_nullable
                  as String?,
        backDefault: freezed == backDefault
            ? _value.backDefault
            : backDefault // ignore: cast_nullable_to_non_nullable
                  as String?,
        backShiny: freezed == backShiny
            ? _value.backShiny
            : backShiny // ignore: cast_nullable_to_non_nullable
                  as String?,
        other: freezed == other
            ? _value.other
            : other // ignore: cast_nullable_to_non_nullable
                  as PokemonSpritesOther?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonSpritesImpl implements _PokemonSprites {
  const _$PokemonSpritesImpl({
    @JsonKey(name: 'front_default') this.frontDefault,
    @JsonKey(name: 'front_shiny') this.frontShiny,
    @JsonKey(name: 'back_default') this.backDefault,
    @JsonKey(name: 'back_shiny') this.backShiny,
    this.other,
  });

  factory _$PokemonSpritesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonSpritesImplFromJson(json);

  @override
  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @override
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @override
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @override
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @override
  final PokemonSpritesOther? other;

  @override
  String toString() {
    return 'PokemonSprites(frontDefault: $frontDefault, frontShiny: $frontShiny, backDefault: $backDefault, backShiny: $backShiny, other: $other)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonSpritesImpl &&
            (identical(other.frontDefault, frontDefault) ||
                other.frontDefault == frontDefault) &&
            (identical(other.frontShiny, frontShiny) ||
                other.frontShiny == frontShiny) &&
            (identical(other.backDefault, backDefault) ||
                other.backDefault == backDefault) &&
            (identical(other.backShiny, backShiny) ||
                other.backShiny == backShiny) &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    frontDefault,
    frontShiny,
    backDefault,
    backShiny,
    other,
  );

  /// Create a copy of PokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonSpritesImplCopyWith<_$PokemonSpritesImpl> get copyWith =>
      __$$PokemonSpritesImplCopyWithImpl<_$PokemonSpritesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonSpritesImplToJson(this);
  }
}

abstract class _PokemonSprites implements PokemonSprites {
  const factory _PokemonSprites({
    @JsonKey(name: 'front_default') final String? frontDefault,
    @JsonKey(name: 'front_shiny') final String? frontShiny,
    @JsonKey(name: 'back_default') final String? backDefault,
    @JsonKey(name: 'back_shiny') final String? backShiny,
    final PokemonSpritesOther? other,
  }) = _$PokemonSpritesImpl;

  factory _PokemonSprites.fromJson(Map<String, dynamic> json) =
      _$PokemonSpritesImpl.fromJson;

  @override
  @JsonKey(name: 'front_default')
  String? get frontDefault;
  @override
  @JsonKey(name: 'front_shiny')
  String? get frontShiny;
  @override
  @JsonKey(name: 'back_default')
  String? get backDefault;
  @override
  @JsonKey(name: 'back_shiny')
  String? get backShiny;
  @override
  PokemonSpritesOther? get other;

  /// Create a copy of PokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonSpritesImplCopyWith<_$PokemonSpritesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonSpritesOther _$PokemonSpritesOtherFromJson(Map<String, dynamic> json) {
  return _PokemonSpritesOther.fromJson(json);
}

/// @nodoc
mixin _$PokemonSpritesOther {
  @JsonKey(name: 'official-artwork')
  OfficialArtwork? get officialArtwork => throw _privateConstructorUsedError;

  /// Serializes this PokemonSpritesOther to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonSpritesOther
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonSpritesOtherCopyWith<PokemonSpritesOther> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonSpritesOtherCopyWith<$Res> {
  factory $PokemonSpritesOtherCopyWith(
    PokemonSpritesOther value,
    $Res Function(PokemonSpritesOther) then,
  ) = _$PokemonSpritesOtherCopyWithImpl<$Res, PokemonSpritesOther>;
  @useResult
  $Res call({
    @JsonKey(name: 'official-artwork') OfficialArtwork? officialArtwork,
  });

  $OfficialArtworkCopyWith<$Res>? get officialArtwork;
}

/// @nodoc
class _$PokemonSpritesOtherCopyWithImpl<$Res, $Val extends PokemonSpritesOther>
    implements $PokemonSpritesOtherCopyWith<$Res> {
  _$PokemonSpritesOtherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonSpritesOther
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? officialArtwork = freezed}) {
    return _then(
      _value.copyWith(
            officialArtwork: freezed == officialArtwork
                ? _value.officialArtwork
                : officialArtwork // ignore: cast_nullable_to_non_nullable
                      as OfficialArtwork?,
          )
          as $Val,
    );
  }

  /// Create a copy of PokemonSpritesOther
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OfficialArtworkCopyWith<$Res>? get officialArtwork {
    if (_value.officialArtwork == null) {
      return null;
    }

    return $OfficialArtworkCopyWith<$Res>(_value.officialArtwork!, (value) {
      return _then(_value.copyWith(officialArtwork: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonSpritesOtherImplCopyWith<$Res>
    implements $PokemonSpritesOtherCopyWith<$Res> {
  factory _$$PokemonSpritesOtherImplCopyWith(
    _$PokemonSpritesOtherImpl value,
    $Res Function(_$PokemonSpritesOtherImpl) then,
  ) = __$$PokemonSpritesOtherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'official-artwork') OfficialArtwork? officialArtwork,
  });

  @override
  $OfficialArtworkCopyWith<$Res>? get officialArtwork;
}

/// @nodoc
class __$$PokemonSpritesOtherImplCopyWithImpl<$Res>
    extends _$PokemonSpritesOtherCopyWithImpl<$Res, _$PokemonSpritesOtherImpl>
    implements _$$PokemonSpritesOtherImplCopyWith<$Res> {
  __$$PokemonSpritesOtherImplCopyWithImpl(
    _$PokemonSpritesOtherImpl _value,
    $Res Function(_$PokemonSpritesOtherImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonSpritesOther
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? officialArtwork = freezed}) {
    return _then(
      _$PokemonSpritesOtherImpl(
        officialArtwork: freezed == officialArtwork
            ? _value.officialArtwork
            : officialArtwork // ignore: cast_nullable_to_non_nullable
                  as OfficialArtwork?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonSpritesOtherImpl implements _PokemonSpritesOther {
  const _$PokemonSpritesOtherImpl({
    @JsonKey(name: 'official-artwork') this.officialArtwork,
  });

  factory _$PokemonSpritesOtherImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonSpritesOtherImplFromJson(json);

  @override
  @JsonKey(name: 'official-artwork')
  final OfficialArtwork? officialArtwork;

  @override
  String toString() {
    return 'PokemonSpritesOther(officialArtwork: $officialArtwork)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonSpritesOtherImpl &&
            (identical(other.officialArtwork, officialArtwork) ||
                other.officialArtwork == officialArtwork));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, officialArtwork);

  /// Create a copy of PokemonSpritesOther
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonSpritesOtherImplCopyWith<_$PokemonSpritesOtherImpl> get copyWith =>
      __$$PokemonSpritesOtherImplCopyWithImpl<_$PokemonSpritesOtherImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonSpritesOtherImplToJson(this);
  }
}

abstract class _PokemonSpritesOther implements PokemonSpritesOther {
  const factory _PokemonSpritesOther({
    @JsonKey(name: 'official-artwork') final OfficialArtwork? officialArtwork,
  }) = _$PokemonSpritesOtherImpl;

  factory _PokemonSpritesOther.fromJson(Map<String, dynamic> json) =
      _$PokemonSpritesOtherImpl.fromJson;

  @override
  @JsonKey(name: 'official-artwork')
  OfficialArtwork? get officialArtwork;

  /// Create a copy of PokemonSpritesOther
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonSpritesOtherImplCopyWith<_$PokemonSpritesOtherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OfficialArtwork _$OfficialArtworkFromJson(Map<String, dynamic> json) {
  return _OfficialArtwork.fromJson(json);
}

/// @nodoc
mixin _$OfficialArtwork {
  @JsonKey(name: 'front_default')
  String? get frontDefault => throw _privateConstructorUsedError;

  /// Serializes this OfficialArtwork to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfficialArtworkCopyWith<OfficialArtwork> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficialArtworkCopyWith<$Res> {
  factory $OfficialArtworkCopyWith(
    OfficialArtwork value,
    $Res Function(OfficialArtwork) then,
  ) = _$OfficialArtworkCopyWithImpl<$Res, OfficialArtwork>;
  @useResult
  $Res call({@JsonKey(name: 'front_default') String? frontDefault});
}

/// @nodoc
class _$OfficialArtworkCopyWithImpl<$Res, $Val extends OfficialArtwork>
    implements $OfficialArtworkCopyWith<$Res> {
  _$OfficialArtworkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? frontDefault = freezed}) {
    return _then(
      _value.copyWith(
            frontDefault: freezed == frontDefault
                ? _value.frontDefault
                : frontDefault // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OfficialArtworkImplCopyWith<$Res>
    implements $OfficialArtworkCopyWith<$Res> {
  factory _$$OfficialArtworkImplCopyWith(
    _$OfficialArtworkImpl value,
    $Res Function(_$OfficialArtworkImpl) then,
  ) = __$$OfficialArtworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'front_default') String? frontDefault});
}

/// @nodoc
class __$$OfficialArtworkImplCopyWithImpl<$Res>
    extends _$OfficialArtworkCopyWithImpl<$Res, _$OfficialArtworkImpl>
    implements _$$OfficialArtworkImplCopyWith<$Res> {
  __$$OfficialArtworkImplCopyWithImpl(
    _$OfficialArtworkImpl _value,
    $Res Function(_$OfficialArtworkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? frontDefault = freezed}) {
    return _then(
      _$OfficialArtworkImpl(
        frontDefault: freezed == frontDefault
            ? _value.frontDefault
            : frontDefault // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficialArtworkImpl implements _OfficialArtwork {
  const _$OfficialArtworkImpl({
    @JsonKey(name: 'front_default') this.frontDefault,
  });

  factory _$OfficialArtworkImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficialArtworkImplFromJson(json);

  @override
  @JsonKey(name: 'front_default')
  final String? frontDefault;

  @override
  String toString() {
    return 'OfficialArtwork(frontDefault: $frontDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficialArtworkImpl &&
            (identical(other.frontDefault, frontDefault) ||
                other.frontDefault == frontDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, frontDefault);

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficialArtworkImplCopyWith<_$OfficialArtworkImpl> get copyWith =>
      __$$OfficialArtworkImplCopyWithImpl<_$OfficialArtworkImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficialArtworkImplToJson(this);
  }
}

abstract class _OfficialArtwork implements OfficialArtwork {
  const factory _OfficialArtwork({
    @JsonKey(name: 'front_default') final String? frontDefault,
  }) = _$OfficialArtworkImpl;

  factory _OfficialArtwork.fromJson(Map<String, dynamic> json) =
      _$OfficialArtworkImpl.fromJson;

  @override
  @JsonKey(name: 'front_default')
  String? get frontDefault;

  /// Create a copy of OfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfficialArtworkImplCopyWith<_$OfficialArtworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
