import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/pokemon_models.dart';
import '../../domain/pokemon_repository.dart';

abstract class PokemonDetailState {}

class PokemonDetailInitial extends PokemonDetailState {}

class PokemonDetailLoading extends PokemonDetailState {}

class PokemonDetailLoaded extends PokemonDetailState {
  final PokemonDetails pokemon;

  PokemonDetailLoaded({required this.pokemon});
}

class PokemonDetailError extends PokemonDetailState {
  final String message;

  PokemonDetailError({required this.message});
}

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  final PokemonRepository _repository;

  PokemonDetailCubit(this._repository) : super(PokemonDetailInitial());

  Future<void> loadPokemonDetails(String pokemonId) async {
    try {
      emit(PokemonDetailLoading());
      final pokemonDetails = await _repository.getPokemonDetails(pokemonId);
      emit(PokemonDetailLoaded(pokemon: pokemonDetails));
    } catch (e) {
      emit(PokemonDetailError(message: e.toString()));
    }
  }
}
