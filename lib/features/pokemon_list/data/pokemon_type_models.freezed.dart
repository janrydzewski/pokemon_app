// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_type_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PokemonTypeListResponse _$PokemonTypeListResponseFromJson(
  Map<String, dynamic> json,
) {
  return _PokemonTypeListResponse.fromJson(json);
}

/// @nodoc
mixin _$PokemonTypeListResponse {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<PokemonTypeBasic> get results => throw _privateConstructorUsedError;

  /// Serializes this PokemonTypeListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonTypeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTypeListResponseCopyWith<PokemonTypeListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeListResponseCopyWith<$Res> {
  factory $PokemonTypeListResponseCopyWith(
    PokemonTypeListResponse value,
    $Res Function(PokemonTypeListResponse) then,
  ) = _$PokemonTypeListResponseCopyWithImpl<$Res, PokemonTypeListResponse>;
  @useResult
  $Res call({
    int count,
    String? next,
    String? previous,
    List<PokemonTypeBasic> results,
  });
}

/// @nodoc
class _$PokemonTypeListResponseCopyWithImpl<
  $Res,
  $Val extends PokemonTypeListResponse
>
    implements $PokemonTypeListResponseCopyWith<$Res> {
  _$PokemonTypeListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonTypeListResponse
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
                      as List<PokemonTypeBasic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PokemonTypeListResponseImplCopyWith<$Res>
    implements $PokemonTypeListResponseCopyWith<$Res> {
  factory _$$PokemonTypeListResponseImplCopyWith(
    _$PokemonTypeListResponseImpl value,
    $Res Function(_$PokemonTypeListResponseImpl) then,
  ) = __$$PokemonTypeListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int count,
    String? next,
    String? previous,
    List<PokemonTypeBasic> results,
  });
}

/// @nodoc
class __$$PokemonTypeListResponseImplCopyWithImpl<$Res>
    extends
        _$PokemonTypeListResponseCopyWithImpl<
          $Res,
          _$PokemonTypeListResponseImpl
        >
    implements _$$PokemonTypeListResponseImplCopyWith<$Res> {
  __$$PokemonTypeListResponseImplCopyWithImpl(
    _$PokemonTypeListResponseImpl _value,
    $Res Function(_$PokemonTypeListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonTypeListResponse
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
      _$PokemonTypeListResponseImpl(
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
                  as List<PokemonTypeBasic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonTypeListResponseImpl implements _PokemonTypeListResponse {
  const _$PokemonTypeListResponseImpl({
    required this.count,
    required this.next,
    required this.previous,
    required final List<PokemonTypeBasic> results,
  }) : _results = results;

  factory _$PokemonTypeListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonTypeListResponseImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<PokemonTypeBasic> _results;
  @override
  List<PokemonTypeBasic> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PokemonTypeListResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTypeListResponseImpl &&
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

  /// Create a copy of PokemonTypeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTypeListResponseImplCopyWith<_$PokemonTypeListResponseImpl>
  get copyWith =>
      __$$PokemonTypeListResponseImplCopyWithImpl<
        _$PokemonTypeListResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonTypeListResponseImplToJson(this);
  }
}

abstract class _PokemonTypeListResponse implements PokemonTypeListResponse {
  const factory _PokemonTypeListResponse({
    required final int count,
    required final String? next,
    required final String? previous,
    required final List<PokemonTypeBasic> results,
  }) = _$PokemonTypeListResponseImpl;

  factory _PokemonTypeListResponse.fromJson(Map<String, dynamic> json) =
      _$PokemonTypeListResponseImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<PokemonTypeBasic> get results;

  /// Create a copy of PokemonTypeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTypeListResponseImplCopyWith<_$PokemonTypeListResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PokemonTypeBasic _$PokemonTypeBasicFromJson(Map<String, dynamic> json) {
  return _PokemonTypeBasic.fromJson(json);
}

/// @nodoc
mixin _$PokemonTypeBasic {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PokemonTypeBasic to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonTypeBasic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTypeBasicCopyWith<PokemonTypeBasic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeBasicCopyWith<$Res> {
  factory $PokemonTypeBasicCopyWith(
    PokemonTypeBasic value,
    $Res Function(PokemonTypeBasic) then,
  ) = _$PokemonTypeBasicCopyWithImpl<$Res, PokemonTypeBasic>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokemonTypeBasicCopyWithImpl<$Res, $Val extends PokemonTypeBasic>
    implements $PokemonTypeBasicCopyWith<$Res> {
  _$PokemonTypeBasicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonTypeBasic
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
abstract class _$$PokemonTypeBasicImplCopyWith<$Res>
    implements $PokemonTypeBasicCopyWith<$Res> {
  factory _$$PokemonTypeBasicImplCopyWith(
    _$PokemonTypeBasicImpl value,
    $Res Function(_$PokemonTypeBasicImpl) then,
  ) = __$$PokemonTypeBasicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$PokemonTypeBasicImplCopyWithImpl<$Res>
    extends _$PokemonTypeBasicCopyWithImpl<$Res, _$PokemonTypeBasicImpl>
    implements _$$PokemonTypeBasicImplCopyWith<$Res> {
  __$$PokemonTypeBasicImplCopyWithImpl(
    _$PokemonTypeBasicImpl _value,
    $Res Function(_$PokemonTypeBasicImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonTypeBasic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? url = null}) {
    return _then(
      _$PokemonTypeBasicImpl(
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
class _$PokemonTypeBasicImpl implements _PokemonTypeBasic {
  const _$PokemonTypeBasicImpl({required this.name, required this.url});

  factory _$PokemonTypeBasicImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonTypeBasicImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'PokemonTypeBasic(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTypeBasicImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of PokemonTypeBasic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTypeBasicImplCopyWith<_$PokemonTypeBasicImpl> get copyWith =>
      __$$PokemonTypeBasicImplCopyWithImpl<_$PokemonTypeBasicImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonTypeBasicImplToJson(this);
  }
}

abstract class _PokemonTypeBasic implements PokemonTypeBasic {
  const factory _PokemonTypeBasic({
    required final String name,
    required final String url,
  }) = _$PokemonTypeBasicImpl;

  factory _PokemonTypeBasic.fromJson(Map<String, dynamic> json) =
      _$PokemonTypeBasicImpl.fromJson;

  @override
  String get name;
  @override
  String get url;

  /// Create a copy of PokemonTypeBasic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTypeBasicImplCopyWith<_$PokemonTypeBasicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonTypeDetails _$PokemonTypeDetailsFromJson(Map<String, dynamic> json) {
  return _PokemonTypeDetails.fromJson(json);
}

/// @nodoc
mixin _$PokemonTypeDetails {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<PokemonTypeSlot> get pokemon => throw _privateConstructorUsedError;

  /// Serializes this PokemonTypeDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonTypeDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTypeDetailsCopyWith<PokemonTypeDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeDetailsCopyWith<$Res> {
  factory $PokemonTypeDetailsCopyWith(
    PokemonTypeDetails value,
    $Res Function(PokemonTypeDetails) then,
  ) = _$PokemonTypeDetailsCopyWithImpl<$Res, PokemonTypeDetails>;
  @useResult
  $Res call({int id, String name, List<PokemonTypeSlot> pokemon});
}

/// @nodoc
class _$PokemonTypeDetailsCopyWithImpl<$Res, $Val extends PokemonTypeDetails>
    implements $PokemonTypeDetailsCopyWith<$Res> {
  _$PokemonTypeDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonTypeDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? pokemon = null}) {
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
            pokemon: null == pokemon
                ? _value.pokemon
                : pokemon // ignore: cast_nullable_to_non_nullable
                      as List<PokemonTypeSlot>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PokemonTypeDetailsImplCopyWith<$Res>
    implements $PokemonTypeDetailsCopyWith<$Res> {
  factory _$$PokemonTypeDetailsImplCopyWith(
    _$PokemonTypeDetailsImpl value,
    $Res Function(_$PokemonTypeDetailsImpl) then,
  ) = __$$PokemonTypeDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, List<PokemonTypeSlot> pokemon});
}

/// @nodoc
class __$$PokemonTypeDetailsImplCopyWithImpl<$Res>
    extends _$PokemonTypeDetailsCopyWithImpl<$Res, _$PokemonTypeDetailsImpl>
    implements _$$PokemonTypeDetailsImplCopyWith<$Res> {
  __$$PokemonTypeDetailsImplCopyWithImpl(
    _$PokemonTypeDetailsImpl _value,
    $Res Function(_$PokemonTypeDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonTypeDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? pokemon = null}) {
    return _then(
      _$PokemonTypeDetailsImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        pokemon: null == pokemon
            ? _value._pokemon
            : pokemon // ignore: cast_nullable_to_non_nullable
                  as List<PokemonTypeSlot>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonTypeDetailsImpl implements _PokemonTypeDetails {
  const _$PokemonTypeDetailsImpl({
    required this.id,
    required this.name,
    required final List<PokemonTypeSlot> pokemon,
  }) : _pokemon = pokemon;

  factory _$PokemonTypeDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonTypeDetailsImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final List<PokemonTypeSlot> _pokemon;
  @override
  List<PokemonTypeSlot> get pokemon {
    if (_pokemon is EqualUnmodifiableListView) return _pokemon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemon);
  }

  @override
  String toString() {
    return 'PokemonTypeDetails(id: $id, name: $name, pokemon: $pokemon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTypeDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._pokemon, _pokemon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_pokemon),
  );

  /// Create a copy of PokemonTypeDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTypeDetailsImplCopyWith<_$PokemonTypeDetailsImpl> get copyWith =>
      __$$PokemonTypeDetailsImplCopyWithImpl<_$PokemonTypeDetailsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonTypeDetailsImplToJson(this);
  }
}

abstract class _PokemonTypeDetails implements PokemonTypeDetails {
  const factory _PokemonTypeDetails({
    required final int id,
    required final String name,
    required final List<PokemonTypeSlot> pokemon,
  }) = _$PokemonTypeDetailsImpl;

  factory _PokemonTypeDetails.fromJson(Map<String, dynamic> json) =
      _$PokemonTypeDetailsImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<PokemonTypeSlot> get pokemon;

  /// Create a copy of PokemonTypeDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTypeDetailsImplCopyWith<_$PokemonTypeDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonTypeSlot _$PokemonTypeSlotFromJson(Map<String, dynamic> json) {
  return _PokemonTypeSlot.fromJson(json);
}

/// @nodoc
mixin _$PokemonTypeSlot {
  int get slot => throw _privateConstructorUsedError;
  Pokemon get pokemon => throw _privateConstructorUsedError;

  /// Serializes this PokemonTypeSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTypeSlotCopyWith<PokemonTypeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTypeSlotCopyWith<$Res> {
  factory $PokemonTypeSlotCopyWith(
    PokemonTypeSlot value,
    $Res Function(PokemonTypeSlot) then,
  ) = _$PokemonTypeSlotCopyWithImpl<$Res, PokemonTypeSlot>;
  @useResult
  $Res call({int slot, Pokemon pokemon});

  $PokemonCopyWith<$Res> get pokemon;
}

/// @nodoc
class _$PokemonTypeSlotCopyWithImpl<$Res, $Val extends PokemonTypeSlot>
    implements $PokemonTypeSlotCopyWith<$Res> {
  _$PokemonTypeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? slot = null, Object? pokemon = null}) {
    return _then(
      _value.copyWith(
            slot: null == slot
                ? _value.slot
                : slot // ignore: cast_nullable_to_non_nullable
                      as int,
            pokemon: null == pokemon
                ? _value.pokemon
                : pokemon // ignore: cast_nullable_to_non_nullable
                      as Pokemon,
          )
          as $Val,
    );
  }

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonCopyWith<$Res> get pokemon {
    return $PokemonCopyWith<$Res>(_value.pokemon, (value) {
      return _then(_value.copyWith(pokemon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonTypeSlotImplCopyWith<$Res>
    implements $PokemonTypeSlotCopyWith<$Res> {
  factory _$$PokemonTypeSlotImplCopyWith(
    _$PokemonTypeSlotImpl value,
    $Res Function(_$PokemonTypeSlotImpl) then,
  ) = __$$PokemonTypeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int slot, Pokemon pokemon});

  @override
  $PokemonCopyWith<$Res> get pokemon;
}

/// @nodoc
class __$$PokemonTypeSlotImplCopyWithImpl<$Res>
    extends _$PokemonTypeSlotCopyWithImpl<$Res, _$PokemonTypeSlotImpl>
    implements _$$PokemonTypeSlotImplCopyWith<$Res> {
  __$$PokemonTypeSlotImplCopyWithImpl(
    _$PokemonTypeSlotImpl _value,
    $Res Function(_$PokemonTypeSlotImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? slot = null, Object? pokemon = null}) {
    return _then(
      _$PokemonTypeSlotImpl(
        slot: null == slot
            ? _value.slot
            : slot // ignore: cast_nullable_to_non_nullable
                  as int,
        pokemon: null == pokemon
            ? _value.pokemon
            : pokemon // ignore: cast_nullable_to_non_nullable
                  as Pokemon,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonTypeSlotImpl implements _PokemonTypeSlot {
  const _$PokemonTypeSlotImpl({required this.slot, required this.pokemon});

  factory _$PokemonTypeSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonTypeSlotImplFromJson(json);

  @override
  final int slot;
  @override
  final Pokemon pokemon;

  @override
  String toString() {
    return 'PokemonTypeSlot(slot: $slot, pokemon: $pokemon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTypeSlotImpl &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slot, pokemon);

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTypeSlotImplCopyWith<_$PokemonTypeSlotImpl> get copyWith =>
      __$$PokemonTypeSlotImplCopyWithImpl<_$PokemonTypeSlotImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonTypeSlotImplToJson(this);
  }
}

abstract class _PokemonTypeSlot implements PokemonTypeSlot {
  const factory _PokemonTypeSlot({
    required final int slot,
    required final Pokemon pokemon,
  }) = _$PokemonTypeSlotImpl;

  factory _PokemonTypeSlot.fromJson(Map<String, dynamic> json) =
      _$PokemonTypeSlotImpl.fromJson;

  @override
  int get slot;
  @override
  Pokemon get pokemon;

  /// Create a copy of PokemonTypeSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTypeSlotImplCopyWith<_$PokemonTypeSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
