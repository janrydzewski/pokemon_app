import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/pokemon_models.dart';

part 'pokedex_cubit.freezed.dart';

@freezed
class PokedexState with _$PokedexState {
  const factory PokedexState.showingList() = PokedexShowingList;
  const factory PokedexState.showingDetails({
    required String pokemonId,
    Pokemon? pokemon,
  }) = PokedexShowingDetails;
}

/// Cubit that manages the main Pokedex view state
/// Controls whether we're showing the Pokemon list or details view
class PokedexCubit extends Cubit<PokedexState> {
  PokedexCubit() : super(const PokedexState.showingList());

  /// Show Pokemon details view
  void showPokemonDetails(String pokemonId, [Pokemon? pokemon]) {
    emit(PokedexState.showingDetails(pokemonId: pokemonId, pokemon: pokemon));
  }

  /// Go back to Pokemon list view
  void showPokemonList() {
    emit(const PokedexState.showingList());
  }

  /// Check if currently showing list
  bool get isShowingList => state is PokedexShowingList;

  /// Check if currently showing details
  bool get isShowingDetails => state is PokedexShowingDetails;

  /// Get current Pokemon ID if showing details
  String? get currentPokemonId {
    final currentState = state;
    if (currentState is PokedexShowingDetails) {
      return currentState.pokemonId;
    }
    return null;
  }
}
