import 'package:flutter/material.dart';

import '../../../../../theme/theme.dart';
import '../components/animated_game_boy_button.dart';

/// Initial state widget displaying the Game Boy boot screen
/// Shows Pokedex logo, version info and start button
class PokemonListInitialWidget extends StatefulWidget {
  final VoidCallback onStartPressed;

  const PokemonListInitialWidget({required this.onStartPressed, super.key});

  @override
  State<PokemonListInitialWidget> createState() =>
      _PokemonListInitialWidgetState();
}

class _PokemonListInitialWidgetState extends State<PokemonListInitialWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _cursorController;

  @override
  void initState() {
    super.initState();
    _cursorController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _cursorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.highContrastDark,
            AppColors.contrastCardBackground,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _BootScreen(),
            const SizedBox(height: 40),
            const _GameBoyBranding(),
            const SizedBox(height: 40),
            _StartButton(onPressed: widget.onStartPressed),
            const SizedBox(height: 20),
            _BlinkingCursor(animation: _cursorController),
          ],
        ),
      ),
    );
  }
}

class _BootScreen extends StatelessWidget {
  const _BootScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.contrastCardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.brightGreen, width: 3),
        boxShadow: [
          BoxShadow(
            color: AppColors.brightGreen.withOpacity(0.3),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Screen content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Pokéball pixel art style icon
                const _PixelPokeball(),
                const SizedBox(height: 16),

                // Pokedx title
                Text(
                  'POKÉDX',
                  style: TextStyle(
                    color: AppColors.brightGreen,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                    fontFamily: 'monospace',
                  ),
                ),
                const SizedBox(height: 4),

                // Version info
                Text(
                  'Ver 1.0',
                  style: TextStyle(
                    color: AppColors.brightGreen.withOpacity(0.7),
                    fontSize: 8,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),

          // Corner pixels for retro effect
          const _CornerPixels(),
        ],
      ),
    );
  }
}

class _PixelPokeball extends StatelessWidget {
  const _PixelPokeball();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.brightGreen,
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          // Top half
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 20,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.brightGreen.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),

          // Center button
          Center(
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: AppColors.contrastCardBackground,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CornerPixels extends StatelessWidget {
  const _CornerPixels();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 4,
          left: 4,
          child: Container(
            width: 2,
            height: 2,
            color: AppColors.brightGreen.withOpacity(0.5),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: Container(
            width: 2,
            height: 2,
            color: AppColors.brightGreen.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}

class _GameBoyBranding extends StatelessWidget {
  const _GameBoyBranding();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'GAME BOY',
          style: TextStyle(
            color: AppColors.brightGreen,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
            fontFamily: 'monospace',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'POKÉDEX CARTRIDGE',
          style: TextStyle(
            color: AppColors.brightGreen.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }
}

class _StartButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _StartButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AnimatedGameBoyButton(
      label: 'PRESS START',
      onPressed: onPressed,
      icon: Icon(Icons.play_arrow),
      width: 160,
      height: 40,
    );
  }
}

class _BlinkingCursor extends StatelessWidget {
  final AnimationController animation;

  const _BlinkingCursor({required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value,
          child: Container(width: 8, height: 12, color: AppColors.gameBoyGreen),
        );
      },
    );
  }
}
