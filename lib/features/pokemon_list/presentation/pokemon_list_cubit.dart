import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/pokemon_models.dart';
import '../domain/pokemon_repository.dart';

part 'pokemon_list_cubit.freezed.dart';

@freezed
class PokemonListState with _$PokemonListState {
  const factory PokemonListState.initial() = PokemonListInitial;
  const factory PokemonListState.loading() = PokemonListLoading;
  const factory PokemonListState.loaded({
    required List<Pokemon> pokemonList,
    required int totalCount,
    required bool hasMore,
    required bool isLoadingMore,
  }) = PokemonListLoaded;
  const factory PokemonListState.error(String message) = PokemonListError;
}

class PokemonListCubit extends Cubit<PokemonListState> {
  final PokemonRepository _repository;
  List<Pokemon> _allPokemon = [];
  static const int _pageSize = 20;
  int _currentOffset = 0;

  PokemonListCubit(this._repository) : super(const PokemonListState.initial());

  Future<void> loadPokemonList() async {
    emit(const PokemonListState.loading());

    try {
      _currentOffset = 0;
      final response = await _repository.getPokemonList(
        limit: _pageSize,
        offset: _currentOffset,
      );

      _allPokemon = response.results;
      _currentOffset += _pageSize;

      emit(
        PokemonListState.loaded(
          pokemonList: _allPokemon,
          totalCount: response.count,
          hasMore: response.next != null,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(PokemonListState.error('Failed to load Pokemon list: $e'));
    }
  }

  Future<void> loadMorePokemon() async {
    final currentState = state;
    if (currentState is! PokemonListLoaded ||
        currentState.isLoadingMore ||
        !currentState.hasMore) {
      return;
    }

    emit(currentState.copyWith(isLoadingMore: true));

    try {
      final response = await _repository.getPokemonList(
        limit: _pageSize,
        offset: _currentOffset,
      );

      _allPokemon.addAll(response.results);
      _currentOffset += _pageSize;

      emit(
        PokemonListState.loaded(
          pokemonList: List.from(_allPokemon),
          totalCount: response.count,
          hasMore: response.next != null,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(currentState.copyWith(isLoadingMore: false));
    }
  }

  Future<void> refreshPokemonList() async {
    try {
      _currentOffset = 0;
      final response = await _repository.getPokemonList(
        limit: _pageSize,
        offset: _currentOffset,
      );

      _allPokemon = response.results;
      _currentOffset += _pageSize;

      emit(
        PokemonListState.loaded(
          pokemonList: _allPokemon,
          totalCount: response.count,
          hasMore: response.next != null,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(PokemonListState.error('Failed to refresh Pokemon list: $e'));
    }
  }
}
