import 'package:flutter/material.dart';

import '../../../../../theme/theme.dart';

/// Pokedex header component with power indicator and decorative buttons
/// Reusable header component following Game Boy Pokedex design
class PokedexHeader extends StatelessWidget {
  const PokedexHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.pokedexRed, AppColors.pokedexRed.withOpacity(0.9)],
        ),
      ),
      child: Row(
        children: [
          // Power indicator with glow effect
          _buildPowerIndicator(),
          const SizedBox(width: 8),
          const _PowerLabel(),
          const Spacer(),

          // Main title
          const _PokedexTitle(),
          const Spacer(),

          // Decorative action buttons
          _buildActionButtons(),
        ],
      ),
    );
  }

  /// Power indicator with animated glow effect
  Widget _buildPowerIndicator() {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: AppColors.screenGreen,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: [BoxShadow(color: AppColors.screenGreen, blurRadius: 8)],
      ),
    );
  }

  /// Decorative action buttons (Blue and Yellow)
  Widget _buildActionButtons() {
    return Row(
      children: [
        _DecorativeButton(color: AppColors.buttonBlue),
        const SizedBox(width: 8),
        _DecorativeButton(color: AppColors.buttonYellow),
      ],
    );
  }
}

/// Power label component
class _PowerLabel extends StatelessWidget {
  const _PowerLabel();

  @override
  Widget build(BuildContext context) {
    return Text(
      'POWER',
      style: TextStyle(
        color: Colors.white,
        fontSize: 8,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }
}

/// Main Pokedex title with golden styling
class _PokedexTitle extends StatelessWidget {
  const _PokedexTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'POKÉDEX',
      style: TextStyle(
        color: AppColors.pokedexGold,
        fontSize: 16,
        fontWeight: FontWeight.w900,
        letterSpacing: 2,
        shadows: [
          Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 2),
        ],
      ),
    );
  }
}

/// Decorative button component
class _DecorativeButton extends StatelessWidget {
  final Color color;

  const _DecorativeButton({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1),
      ),
    );
  }
}
