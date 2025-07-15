import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/core/utils/context_extensions.dart';

import '../../../../../../theme/theme.dart';
import '../../../../data/pokemon_models.dart';
import '../pokemon_detail_widgets.dart';

/// Loaded state widget for Pokemon detail screen
class PokemonDetailLoadedWidget extends StatelessWidget {
  final PokemonDetails pokemon;

  const PokemonDetailLoadedWidget({super.key, required this.pokemon});

  String get _getHighResImageUrl {
    return pokemon.sprites.other?.officialArtwork?.frontDefault ??
        pokemon.sprites.frontDefault ??
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.id}.png';
  }

  int get _maxStatValue {
    // Find the maximum stat value to scale progress bars appropriately
    return pokemon.stats
        .map((stat) => stat.baseStat)
        .reduce((a, b) => a > b ? a : b);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pokemon header with image and basic info
          _PokemonHeader(pokemon: pokemon, imageUrl: _getHighResImageUrl),

          const SizedBox(height: 16),

          // Basic info panel
          PokemonBasicInfoPanel(pokemon: pokemon),

          const SizedBox(height: 16),

          // Types section
          _TypesSection(pokemon: pokemon),

          const SizedBox(height: 16),

          // Stats section
          _StatsSection(pokemon: pokemon, maxStatValue: _maxStatValue),
        ],
      ),
    );
  }
}

/// Pokemon header with image and name
class _PokemonHeader extends StatelessWidget {
  final PokemonDetails pokemon;
  final String imageUrl;

  const _PokemonHeader({required this.pokemon, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.contrastCardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.brightGreen, width: 2),
        boxShadow: [
          BoxShadow(
            color: AppColors.brightGreen.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Pokemon image
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.highContrastDark,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.brightGreen, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.brightGreen,
                    strokeWidth: 3,
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.catching_pokemon,
                        size: 60,
                        color: AppColors.brightGreen,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'IMAGE NOT FOUND',
                        style: context.bodySmall.copyWith(
                          color: AppColors.brightGreen.withValues(alpha: 0.6),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Pokemon name
          Text(
            pokemon.name
                .split('-')
                .map((word) => word[0].toUpperCase() + word.substring(1))
                .join(' ')
                .toUpperCase(),
            style: context.titleLarge.copyWith(
              color: AppColors.brightGreen,
              fontSize: 24,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Subtitle with "POKEMON DATA"
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.brightGreen.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.brightGreen, width: 1),
            ),
            child: Text(
              'POKEMON DATA',
              style: context.bodySmall.copyWith(
                color: AppColors.brightGreen,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Types section
class _TypesSection extends StatelessWidget {
  final PokemonDetails pokemon;

  const _TypesSection({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.contrastCardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.brightGreen, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TYPE(S)',
            style: context.labelSmall.copyWith(
              color: AppColors.brightGreen,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 8),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: pokemon.types
                .map((type) => PokemonTypeBadge(typeName: type.type.name))
                .toList(),
          ),
        ],
      ),
    );
  }
}

/// Stats section
class _StatsSection extends StatelessWidget {
  final PokemonDetails pokemon;
  final int maxStatValue;

  const _StatsSection({required this.pokemon, required this.maxStatValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.contrastCardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.brightGreen, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BASE STATISTICS',
            style: context.labelSmall.copyWith(
              color: AppColors.brightGreen,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 12),

          ...pokemon.stats.map(
            (stat) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: PokemonStatBar(
                statName: stat.stat.name,
                statValue: stat.baseStat,
                maxValue: maxStatValue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
