// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokedex_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PokedexState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showingList,
    required TResult Function(String pokemonId, Pokemon? pokemon)
    showingDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showingList,
    TResult? Function(String pokemonId, Pokemon? pokemon)? showingDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showingList,
    TResult Function(String pokemonId, Pokemon? pokemon)? showingDetails,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokedexShowingList value) showingList,
    required TResult Function(PokedexShowingDetails value) showingDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokedexShowingList value)? showingList,
    TResult? Function(PokedexShowingDetails value)? showingDetails,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokedexShowingList value)? showingList,
    TResult Function(PokedexShowingDetails value)? showingDetails,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokedexStateCopyWith<$Res> {
  factory $PokedexStateCopyWith(
    PokedexState value,
    $Res Function(PokedexState) then,
  ) = _$PokedexStateCopyWithImpl<$Res, PokedexState>;
}

/// @nodoc
class _$PokedexStateCopyWithImpl<$Res, $Val extends PokedexState>
    implements $PokedexStateCopyWith<$Res> {
  _$PokedexStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokedexState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PokedexShowingListImplCopyWith<$Res> {
  factory _$$PokedexShowingListImplCopyWith(
    _$PokedexShowingListImpl value,
    $Res Function(_$PokedexShowingListImpl) then,
  ) = __$$PokedexShowingListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PokedexShowingListImplCopyWithImpl<$Res>
    extends _$PokedexStateCopyWithImpl<$Res, _$PokedexShowingListImpl>
    implements _$$PokedexShowingListImplCopyWith<$Res> {
  __$$PokedexShowingListImplCopyWithImpl(
    _$PokedexShowingListImpl _value,
    $Res Function(_$PokedexShowingListImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokedexState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PokedexShowingListImpl implements PokedexShowingList {
  const _$PokedexShowingListImpl();

  @override
  String toString() {
    return 'PokedexState.showingList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PokedexShowingListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showingList,
    required TResult Function(String pokemonId, Pokemon? pokemon)
    showingDetails,
  }) {
    return showingList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showingList,
    TResult? Function(String pokemonId, Pokemon? pokemon)? showingDetails,
  }) {
    return showingList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showingList,
    TResult Function(String pokemonId, Pokemon? pokemon)? showingDetails,
    required TResult orElse(),
  }) {
    if (showingList != null) {
      return showingList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokedexShowingList value) showingList,
    required TResult Function(PokedexShowingDetails value) showingDetails,
  }) {
    return showingList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokedexShowingList value)? showingList,
    TResult? Function(PokedexShowingDetails value)? showingDetails,
  }) {
    return showingList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokedexShowingList value)? showingList,
    TResult Function(PokedexShowingDetails value)? showingDetails,
    required TResult orElse(),
  }) {
    if (showingList != null) {
      return showingList(this);
    }
    return orElse();
  }
}

abstract class PokedexShowingList implements PokedexState {
  const factory PokedexShowingList() = _$PokedexShowingListImpl;
}

/// @nodoc
abstract class _$$PokedexShowingDetailsImplCopyWith<$Res> {
  factory _$$PokedexShowingDetailsImplCopyWith(
    _$PokedexShowingDetailsImpl value,
    $Res Function(_$PokedexShowingDetailsImpl) then,
  ) = __$$PokedexShowingDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pokemonId, Pokemon? pokemon});

  $PokemonCopyWith<$Res>? get pokemon;
}

/// @nodoc
class __$$PokedexShowingDetailsImplCopyWithImpl<$Res>
    extends _$PokedexStateCopyWithImpl<$Res, _$PokedexShowingDetailsImpl>
    implements _$$PokedexShowingDetailsImplCopyWith<$Res> {
  __$$PokedexShowingDetailsImplCopyWithImpl(
    _$PokedexShowingDetailsImpl _value,
    $Res Function(_$PokedexShowingDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PokedexState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pokemonId = null, Object? pokemon = freezed}) {
    return _then(
      _$PokedexShowingDetailsImpl(
        pokemonId: null == pokemonId
            ? _value.pokemonId
            : pokemonId // ignore: cast_nullable_to_non_nullable
                  as String,
        pokemon: freezed == pokemon
            ? _value.pokemon
            : pokemon // ignore: cast_nullable_to_non_nullable
                  as Pokemon?,
      ),
    );
  }

  /// Create a copy of PokedexState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonCopyWith<$Res>? get pokemon {
    if (_value.pokemon == null) {
      return null;
    }

    return $PokemonCopyWith<$Res>(_value.pokemon!, (value) {
      return _then(_value.copyWith(pokemon: value));
    });
  }
}

/// @nodoc

class _$PokedexShowingDetailsImpl implements PokedexShowingDetails {
  const _$PokedexShowingDetailsImpl({required this.pokemonId, this.pokemon});

  @override
  final String pokemonId;
  @override
  final Pokemon? pokemon;

  @override
  String toString() {
    return 'PokedexState.showingDetails(pokemonId: $pokemonId, pokemon: $pokemon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokedexShowingDetailsImpl &&
            (identical(other.pokemonId, pokemonId) ||
                other.pokemonId == pokemonId) &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pokemonId, pokemon);

  /// Create a copy of PokedexState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokedexShowingDetailsImplCopyWith<_$PokedexShowingDetailsImpl>
  get copyWith =>
      __$$PokedexShowingDetailsImplCopyWithImpl<_$PokedexShowingDetailsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showingList,
    required TResult Function(String pokemonId, Pokemon? pokemon)
    showingDetails,
  }) {
    return showingDetails(pokemonId, pokemon);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showingList,
    TResult? Function(String pokemonId, Pokemon? pokemon)? showingDetails,
  }) {
    return showingDetails?.call(pokemonId, pokemon);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showingList,
    TResult Function(String pokemonId, Pokemon? pokemon)? showingDetails,
    required TResult orElse(),
  }) {
    if (showingDetails != null) {
      return showingDetails(pokemonId, pokemon);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokedexShowingList value) showingList,
    required TResult Function(PokedexShowingDetails value) showingDetails,
  }) {
    return showingDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokedexShowingList value)? showingList,
    TResult? Function(PokedexShowingDetails value)? showingDetails,
  }) {
    return showingDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokedexShowingList value)? showingList,
    TResult Function(PokedexShowingDetails value)? showingDetails,
    required TResult orElse(),
  }) {
    if (showingDetails != null) {
      return showingDetails(this);
    }
    return orElse();
  }
}

abstract class PokedexShowingDetails implements PokedexState {
  const factory PokedexShowingDetails({
    required final String pokemonId,
    final Pokemon? pokemon,
  }) = _$PokedexShowingDetailsImpl;

  String get pokemonId;
  Pokemon? get pokemon;

  /// Create a copy of PokedexState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokedexShowingDetailsImplCopyWith<_$PokedexShowingDetailsImpl>
  get copyWith => throw _privateConstructorUsedError;
}
