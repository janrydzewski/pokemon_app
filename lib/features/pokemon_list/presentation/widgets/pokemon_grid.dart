import 'package:flutter/material.dart';

import '../../data/pokemon_models.dart';
import 'pokemon_card.dart';
import 'pokemon_loading_card.dart';

class PokemonGrid extends StatelessWidget {
  final List<Pokemon> pokemonList;
  final bool isLoadingMore;
  final ScrollController scrollController;
  final Function(String) getPokemonImageUrl;
  final Function(Pokemon)? onPokemonTap;

  const PokemonGrid({
    super.key,
    required this.pokemonList,
    required this.isLoadingMore,
    required this.scrollController,
    required this.getPokemonImageUrl,
    this.onPokemonTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: pokemonList.length + (isLoadingMore ? 2 : 0),
      itemBuilder: (context, index) {
        if (index >= pokemonList.length) {
          return const PokemonLoadingCard();
        }

        final pokemon = pokemonList[index];
        return PokemonCard(
          pokemon: pokemon,
          imageUrl: getPokemonImageUrl(pokemon.url),
          onTap: onPokemonTap != null ? () => onPokemonTap!(pokemon) : null,
        );
      },
    );
  }
}
