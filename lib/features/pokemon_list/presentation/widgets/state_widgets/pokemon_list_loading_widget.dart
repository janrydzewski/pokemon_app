import 'package:flutter/material.dart';

import '../../../../../theme/theme.dart';

/// Loading state widget displaying Game Boy style loading screen
/// Shows animated loading spinner, progress bar and status text
class PokemonListLoadingWidget extends StatelessWidget {
  const PokemonListLoadingWidget({super.key});

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
            // Game Boy style loading screen
            const _LoadingScreen(),
            const SizedBox(height: 40),

            // Loading status message
            const _LoadingStatus(),
          ],
        ),
      ),
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 180,
      decoration: BoxDecoration(
        color: AppColors.contrastCardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.brightGreen, width: 3),
        boxShadow: [
          BoxShadow(
            color: AppColors.brightGreen.withOpacity(0.3),
            blurRadius: 12,
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Loading spinner with Pokemon icon
                const _LoadingSpinner(),
                const SizedBox(height: 20),

                // Loading text
                const _LoadingText(),
                const SizedBox(height: 8),

                // Subtitle
                const _LoadingSubtitle(),
                const SizedBox(height: 16),

                // Progress bar
                const _LoadingProgressBar(),
              ],
            ),
          ),

          // Corner decorations
          const _LoadingScreenDecorations(),
        ],
      ),
    );
  }
}

class _LoadingSpinner extends StatelessWidget {
  const _LoadingSpinner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                color: AppColors.brightGreen,
                strokeWidth: 3,
                backgroundColor: AppColors.brightGreen.withOpacity(0.2),
              ),
            ),
          ),
          Center(
            child: Icon(
              Icons.catching_pokemon,
              size: 20,
              color: AppColors.brightGreen,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingText extends StatelessWidget {
  const _LoadingText();

  @override
  Widget build(BuildContext context) {
    return Text(
      'LOADING...',
      style: TextStyle(
        color: AppColors.brightGreen,
        fontSize: 16,
        fontWeight: FontWeight.w900,
        letterSpacing: 2,
        fontFamily: 'monospace',
      ),
    );
  }
}

class _LoadingSubtitle extends StatelessWidget {
  const _LoadingSubtitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'ACCESSING POKÉDEX DATA',
      style: TextStyle(
        color: AppColors.brightGreen.withOpacity(0.7),
        fontSize: 10,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        fontFamily: 'monospace',
      ),
    );
  }
}

class _LoadingProgressBar extends StatelessWidget {
  const _LoadingProgressBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 8,
      decoration: BoxDecoration(
        color: AppColors.contrastCardBackground,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.brightGreen, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: LinearProgressIndicator(
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.brightGreen),
        ),
      ),
    );
  }
}

class _LoadingScreenDecorations extends StatelessWidget {
  const _LoadingScreenDecorations();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      left: 8,
      child: Row(
        children: List.generate(
          3,
          (index) => Container(
            width: 4,
            height: 4,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              color: AppColors.brightGreen.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

/// Loading status message
class _LoadingStatus extends StatelessWidget {
  const _LoadingStatus();

  @override
  Widget build(BuildContext context) {
    return Text(
      'PLEASE WAIT...',
      style: TextStyle(
        color: AppColors.brightGreen,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 2,
        fontFamily: 'monospace',
      ),
    );
  }
}
