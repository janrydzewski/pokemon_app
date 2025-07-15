import 'package:flutter/material.dart';
import 'package:pokemon_app/theme/theme.dart';

import '../components/animated_game_boy_button.dart';

/// Error state widget displaying Game Boy style error screen
/// Shows error message, retry button and system halt status
class PokemonListErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetryPressed;

  const PokemonListErrorWidget({
    required this.message,
    required this.onRetryPressed,
    super.key,
  });

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
            // Game Boy style error screen
            _ErrorScreen(message: message),
            const SizedBox(height: 40),

            // Retry button
            _RetryButton(onPressed: onRetryPressed),
            const SizedBox(height: 20),

            // System halt message
            const _SystemHaltMessage(),
          ],
        ),
      ),
    );
  }
}

/// Main error screen container with error details
class _ErrorScreen extends StatelessWidget {
  final String message;

  const _ErrorScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.contrastCardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.brightRed, width: 3),
        boxShadow: [
          BoxShadow(
            color: AppColors.brightRed.withValues(alpha: 0.3),
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
                // Error icon
                const _ErrorIcon(),
                const SizedBox(height: 16),

                // Error title
                const _ErrorTitle(),
                const SizedBox(height: 8),

                // Error message
                _ErrorMessage(message: message),
              ],
            ),
          ),

          // Blinking error indicators
          const _ErrorIndicators(),
        ],
      ),
    );
  }
}

/// Error icon with exclamation mark
class _ErrorIcon extends StatelessWidget {
  const _ErrorIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.brightRed,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          '!',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

/// Error title
class _ErrorTitle extends StatelessWidget {
  const _ErrorTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'ERROR',
      style: TextStyle(
        color: AppColors.brightRed,
        fontSize: 16,
        fontWeight: FontWeight.w900,
        letterSpacing: 2,
      ),
    );
  }
}

/// Error message container
class _ErrorMessage extends StatelessWidget {
  final String message;

  const _ErrorMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.contrastCardBackground,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.brightRed.withValues(alpha: 0.5)),
      ),
      child: Text(
        message.toUpperCase(),
        style: TextStyle(
          color: AppColors.brightRed,
          fontSize: 8,
          fontWeight: FontWeight.w600,

          height: 1.2,
        ),
        textAlign: TextAlign.center,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

/// Blinking error indicators in corners
class _ErrorIndicators extends StatelessWidget {
  const _ErrorIndicators();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.brightRed,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.brightRed,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

/// Retry button component using AnimatedGameBoyButton
class _RetryButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _RetryButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AnimatedGameBoyButton(
      label: 'TRY AGAIN',
      onPressed: onPressed,
      icon: Icon(Icons.refresh),
      backgroundColor: AppColors.contrastCardBackground,
      textColor: AppColors.brightRed,
      width: 160,
      height: 40,
    );
  }
}

/// System halt message
class _SystemHaltMessage extends StatelessWidget {
  const _SystemHaltMessage();

  @override
  Widget build(BuildContext context) {
    return Text(
      'SYSTEM HALT',
      style: TextStyle(
        color: AppColors.brightRed.withValues(alpha: 0.6),
        fontSize: 10,
        fontWeight: FontWeight.w700,
        letterSpacing: 1,
      ),
    );
  }
}
