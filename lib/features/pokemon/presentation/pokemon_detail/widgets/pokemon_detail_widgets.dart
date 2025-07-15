import 'package:flutter/material.dart';
import 'package:pokemon_app/core/utils/context_extensions.dart';

import '../../../../../theme/theme.dart';
import '../../../data/pokemon_models.dart';
import '../../../data/pokemon_type_models.dart';

/// Pokemon type badge widget
class PokemonTypeBadge extends StatelessWidget {
  final String typeName;

  const PokemonTypeBadge({super.key, required this.typeName});

  Color get _getTypeColor {
    switch (typeName.toLowerCase()) {
      case 'fire':
        return const Color(0xFFFF6B35);
      case 'water':
        return const Color(0xFF4FC3F7);
      case 'grass':
        return const Color(0xFF66BB6A);
      case 'electric':
        return const Color(0xFFFFEB3B);
      case 'psychic':
        return const Color(0xFFE91E63);
      case 'ice':
        return const Color(0xFF81D4FA);
      case 'dragon':
        return const Color(0xFF7B1FA2);
      case 'dark':
        return const Color(0xFF424242);
      case 'fairy':
        return const Color(0xFFF8BBD9);
      case 'fighting':
        return const Color(0xFFD32F2F);
      case 'poison':
        return const Color(0xFF9C27B0);
      case 'ground':
        return const Color(0xFFBCAAA4);
      case 'flying':
        return const Color(0xFF90CAF9);
      case 'bug':
        return const Color(0xFF8BC34A);
      case 'rock':
        return const Color(0xFF8D6E63);
      case 'ghost':
        return const Color(0xFF673AB7);
      case 'steel':
        return const Color(0xFF607D8B);
      case 'normal':
        return const Color(0xFF9E9E9E);
      default:
        return AppColors.brightGreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getTypeColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: _getTypeColor.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        PokemonTypes.getTypeDisplayName(typeName),
        style: context.bodySmall.copyWith(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// Pokemon stat bar widget
class PokemonStatBar extends StatelessWidget {
  final String statName;
  final int statValue;
  final int maxValue;

  const PokemonStatBar({
    super.key,
    required this.statName,
    required this.statValue,
    required this.maxValue,
  });

  String get _getDisplayStatName {
    switch (statName.toLowerCase()) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'ATK';
      case 'defense':
        return 'DEF';
      case 'special-attack':
        return 'SP.ATK';
      case 'special-defense':
        return 'SP.DEF';
      case 'speed':
        return 'SPEED';
      default:
        return statName.toUpperCase();
    }
  }

  Color get _getStatColor {
    final percentage = statValue / maxValue;
    if (percentage >= 0.8) return Colors.green;
    if (percentage >= 0.6) return Colors.lightGreen;
    if (percentage >= 0.4) return Colors.orange;
    if (percentage >= 0.2) return Colors.red;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final percentage = (statValue / maxValue).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.contrastCardBackground,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.brightGreen, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stat name and value
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _getDisplayStatName,
                style: context.bodySmall.copyWith(
                  color: AppColors.brightGreen,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                statValue.toString(),
                style: context.bodySmall.copyWith(
                  color: AppColors.brightGreen,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          // Progress bar
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.highContrastDark,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: AppColors.brightGreen, width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: _getStatColor,
                    boxShadow: [
                      BoxShadow(
                        color: _getStatColor.withValues(alpha: 0.5),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Pokemon basic info panel
class PokemonBasicInfoPanel extends StatelessWidget {
  final PokemonDetails pokemon;

  const PokemonBasicInfoPanel({super.key, required this.pokemon});

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
          // Header
          Text(
            'BASIC INFO',
            style: context.labelSmall.copyWith(
              color: AppColors.brightGreen,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 8),

          // Info grid
          Row(
            children: [
              Expanded(
                child: _InfoItem(
                  label: 'ID',
                  value: '#${pokemon.id.toString().padLeft(3, '0')}',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _InfoItem(
                  label: 'HEIGHT',
                  value: '${(pokemon.height / 10).toStringAsFixed(1)}m',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _InfoItem(
                  label: 'WEIGHT',
                  value: '${(pokemon.weight / 10).toStringAsFixed(1)}kg',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const _InfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.highContrastDark,
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: AppColors.brightGreen, width: 1),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: context.bodySmall.copyWith(
              color: AppColors.brightGreen.withValues(alpha: 0.7),
              fontSize: 8,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: context.bodySmall.copyWith(
              color: AppColors.brightGreen,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
