import 'package:flutter/material.dart';

import '../../../../../theme/theme.dart';
import '../../../data/pokemon_models.dart';
import '../../../data/pokemon_type_models.dart';
import '../pokemon_card.dart';
import '../pokemon_loading_card.dart';

/// Loaded state widget displaying Pokemon grid with status bar
/// Includes header with connection status and Pokemon count
class PokemonListLoadedWidget extends StatelessWidget {
  final List<Pokemon> pokemonList;
  final int totalCount;
  final bool hasMore;
  final bool isLoadingMore;
  final ScrollController scrollController;
  final String Function(String) getPokemonImageUrl;
  final void Function(Pokemon) onPokemonTap;
  final VoidCallback onFilterTap;
  final Future<void> Function() onRefresh;
  final PokemonTypeBasic? selectedType;

  const PokemonListLoadedWidget({
    required this.pokemonList,
    required this.totalCount,
    required this.hasMore,
    required this.isLoadingMore,
    required this.scrollController,
    required this.getPokemonImageUrl,
    required this.onPokemonTap,
    required this.onFilterTap,
    required this.onRefresh,
    this.selectedType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColors.brightGreen,
      backgroundColor: AppColors.highContrastDark,
      child: CustomScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // Status header
          SliverToBoxAdapter(
            child: _StatusHeader(
              pokemonCount: totalCount,
              onFilterTap: onFilterTap,
              selectedType: selectedType,
            ),
          ),

          // Pokemon grid
          _PokemonGrid(
            pokemonList: pokemonList,
            isLoadingMore: isLoadingMore,
            getPokemonImageUrl: getPokemonImageUrl,
            onPokemonTap: onPokemonTap,
          ),

          // Bottom padding
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}

/// Status header showing connection status and Pokemon count
class _StatusHeader extends StatelessWidget {
  final int pokemonCount;
  final VoidCallback onFilterTap;
  final PokemonTypeBasic? selectedType;

  const _StatusHeader({
    required this.pokemonCount,
    required this.onFilterTap,
    this.selectedType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.highContrastDark,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.brightGreen, width: 3),
          boxShadow: [
            BoxShadow(
              color: AppColors.brightGreen.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            // Online indicator
            const _OnlineIndicator(),
            const SizedBox(width: 8),

            // Status text
            _StatusText(selectedType: selectedType),
            const Spacer(),

            // Pokemon count
            _PokemonCount(count: pokemonCount),
            const SizedBox(width: 8),

            // Filter button
            _FilterButton(onTap: onFilterTap),
          ],
        ),
      ),
    );
  }
}

/// Online status indicator with glowing effect
class _OnlineIndicator extends StatelessWidget {
  const _OnlineIndicator();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: AppColors.brightGreen,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: AppColors.brightGreen, blurRadius: 6)],
      ),
    );
  }
}

/// Online status text
class _StatusText extends StatelessWidget {
  final PokemonTypeBasic? selectedType;

  const _StatusText({this.selectedType});

  @override
  Widget build(BuildContext context) {
    return Text(
      selectedType != null
          ? 'FILTER: ${PokemonTypes.getTypeDisplayName(selectedType!.name)}'
          : 'POKÉDEX ONLINE',
      style: TextStyle(
        color: AppColors.brightGreen,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 1,
        fontFamily: 'monospace',
      ),
    );
  }
}

/// Pokemon count display
class _PokemonCount extends StatelessWidget {
  final int count;

  const _PokemonCount({required this.count});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$count ENTRIES',
      style: TextStyle(
        color: AppColors.brightGreen,
        fontSize: 10,
        fontWeight: FontWeight.w600,
        fontFamily: 'monospace',
      ),
    );
  }
}

/// Filter button
class _FilterButton extends StatelessWidget {
  final VoidCallback onTap;

  const _FilterButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: AppColors.brightGreen.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.brightGreen, width: 2),
        ),
        child: Icon(Icons.tune, color: AppColors.brightGreen, size: 12),
      ),
    );
  }
}

/// Pokemon grid with loading cards when needed
class _PokemonGrid extends StatelessWidget {
  final List<Pokemon> pokemonList;
  final bool isLoadingMore;
  final String Function(String) getPokemonImageUrl;
  final void Function(Pokemon) onPokemonTap;

  const _PokemonGrid({
    required this.pokemonList,
    required this.isLoadingMore,
    required this.getPokemonImageUrl,
    required this.onPokemonTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          // Show loading cards when loading more
          if (index >= pokemonList.length) {
            return const PokemonLoadingCard();
          }

          final pokemon = pokemonList[index];
          return PokemonCard(
            pokemon: pokemon,
            imageUrl: getPokemonImageUrl(pokemon.url),
            onTap: () => onPokemonTap(pokemon),
          );
        }, childCount: pokemonList.length + (isLoadingMore ? 2 : 0)),
      ),
    );
  }
}
