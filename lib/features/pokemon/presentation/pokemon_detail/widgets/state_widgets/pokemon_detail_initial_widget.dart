import 'package:flutter/material.dart';
import 'package:pokemon_app/core/utils/context_extensions.dart';

import '../../../../../../theme/theme.dart';

/// Initial state widget for Pokemon detail screen
class PokemonDetailInitialWidget extends StatelessWidget {
  const PokemonDetailInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.contrastCardBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.brightGreen, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.catching_pokemon,
              size: 48,
              color: AppColors.brightGreen,
            ),
            const SizedBox(height: 16),
            Text(
              'POKEDEX',
              style: context.titleLarge.copyWith(
                color: AppColors.brightGreen,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'READY TO SCAN',
              style: context.bodySmall.copyWith(
                color: AppColors.brightGreen.withOpacity(0.7),
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
