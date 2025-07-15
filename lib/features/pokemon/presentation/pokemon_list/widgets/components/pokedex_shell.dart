import 'package:flutter/material.dart';
import 'package:pokemon_app/theme/theme.dart';

import 'pokedex_bottom_controls.dart';
import 'pokedex_header.dart';
import 'pokedex_screen_wrapper.dart';

/// Main Pokedex shell wrapper component
/// Provides the outer Game Boy-style casing with header, screen area, and bottom controls
/// This is the main visual container that wraps all state-specific content
class PokedexShell extends StatelessWidget {
  final Widget child;

  const PokedexShell({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.retroBackground,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.retroBackground,
              AppColors.retroBackground.withOpacity(0.8),
              Colors.black,
            ],
          ),
        ),
        child: SafeArea(child: _PokedexCasing(child: child)),
      ),
    );
  }
}

class _PokedexCasing extends StatelessWidget {
  final Widget child;

  const _PokedexCasing({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.pokedexRed,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: _PokedexBezel(child: child),
    );
  }
}

class _PokedexBezel extends StatelessWidget {
  final Widget child;

  const _PokedexBezel({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.gameBoyBezel,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.5), width: 2),
      ),
      child: Column(
        children: [
          const PokedexHeader(),
          Expanded(child: PokedexScreenWrapper(child: child)),
          const PokedexBottomControls(),
        ],
      ),
    );
  }
}
