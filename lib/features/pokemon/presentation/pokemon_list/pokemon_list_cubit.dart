import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/pagination_constants.dart';
import '../../data/pokemon_models.dart';
import '../../data/pokemon_type_models.dart';
import '../../domain/pokemon_repository.dart';

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
    PokemonTypeBasic? selectedType,
  }) = PokemonListLoaded;
  const factory PokemonListState.error(String message) = PokemonListError;
}

class PokemonListCubit extends Cubit<PokemonListState> {
  final PokemonRepository _repository;
  List<Pokemon> _allPokemon = [];
  String? _nextPageUrl;
  int? _totalCount;
  bool _isCurrentlyLoading = false;
  PokemonTypeBasic? _selectedType;

  PokemonListCubit(this._repository) : super(const PokemonListState.initial());
  Future<void> loadPokemonList() async {
    if (_isCurrentlyLoading) return;

    _isCurrentlyLoading = true;
    emit(const PokemonListState.loading());

    try {
      _allPokemon.clear();
      _nextPageUrl = null;
      _selectedType = null;

      final response = await _repository.getPokemonList(
        limit: PaginationConstants.defaultPageSize,
        offset: PaginationConstants.defaultOffset,
      );

      _allPokemon = List.from(response.results);
      _nextPageUrl = response.next;
      _totalCount = response.count;

      emit(
        PokemonListState.loaded(
          pokemonList: _allPokemon,
          totalCount: response.count,
          hasMore: response.next != null,
          isLoadingMore: false,
          selectedType: _selectedType,
        ),
      );
    } catch (e) {
      emit(PokemonListState.error('Failed to load Pokemon list: $e'));
    } finally {
      _isCurrentlyLoading = false;
    }
  }

  Future<void> loadPokemonByType(PokemonTypeBasic type) async {
    if (_isCurrentlyLoading) return;

    _isCurrentlyLoading = true;
    emit(const PokemonListState.loading());

    try {
      _allPokemon.clear();
      _nextPageUrl = null;
      _selectedType = type;

      final typeDetails = await _repository.getPokemonsByType(type.name);

      // Convert PokemonTypeDetails to list of Pokemon
      final pokemonList = typeDetails.pokemon
          .map((slot) => slot.pokemon)
          .toList();

      _allPokemon = pokemonList;
      _totalCount = pokemonList.length;

      emit(
        PokemonListState.loaded(
          pokemonList: _allPokemon,
          totalCount: pokemonList.length,
          hasMore: false, // Type filtering doesn't support pagination
          isLoadingMore: false,
          selectedType: _selectedType,
        ),
      );
    } catch (e) {
      emit(PokemonListState.error('Failed to load Pokemon by type: $e'));
    } finally {
      _isCurrentlyLoading = false;
    }
  }

  Future<void> clearFilter() async {
    _selectedType = null;
    await loadPokemonList();
  }

  Future<void> loadMorePokemon() async {
    final currentState = state;
    if (currentState is! PokemonListLoaded ||
        currentState.isLoadingMore ||
        !currentState.hasMore ||
        _nextPageUrl == null ||
        _isCurrentlyLoading) {
      return;
    }

    _isCurrentlyLoading = true;
    emit(currentState.copyWith(isLoadingMore: true));

    try {
      final response = await _repository.getPokemonListFromUrl(_nextPageUrl!);

      final newPokemon = response.results;
      _allPokemon = [..._allPokemon, ...newPokemon];
      _nextPageUrl = response.next;

      emit(
        PokemonListState.loaded(
          pokemonList: List.from(_allPokemon),
          totalCount: _totalCount ?? response.count,
          hasMore:
              response.next != null &&
              _allPokemon.length < (_totalCount ?? response.count),
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(currentState.copyWith(isLoadingMore: false));
    } finally {
      _isCurrentlyLoading = false;
    }
  }

  Future<void> refreshPokemonList() async {
    if (_isCurrentlyLoading) return;

    _isCurrentlyLoading = true;

    try {
      _allPokemon.clear();
      _nextPageUrl = null;

      final response = await _repository.getPokemonList(
        limit: PaginationConstants.defaultPageSize,
        offset: PaginationConstants.defaultOffset,
      );

      _allPokemon = List.from(response.results);
      _nextPageUrl = response.next;
      _totalCount = response.count;

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
    } finally {
      _isCurrentlyLoading = false;
    }
  }
}
