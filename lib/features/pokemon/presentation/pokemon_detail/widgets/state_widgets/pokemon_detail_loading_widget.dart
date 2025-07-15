import 'package:flutter/material.dart';
import 'package:pokemon_app/core/utils/context_extensions.dart';

import '../../../../../../theme/theme.dart';

/// Loading state widget for Pokemon detail screen
class PokemonDetailLoadingWidget extends StatefulWidget {
  const PokemonDetailLoadingWidget({super.key});

  @override
  State<PokemonDetailLoadingWidget> createState() =>
      _PokemonDetailLoadingWidgetState();
}

class _PokemonDetailLoadingWidgetState extends State<PokemonDetailLoadingWidget>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _pulseController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.linear),
    );

    _pulseAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: AppColors.contrastCardBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.brightGreen, width: 2),
          boxShadow: [
            BoxShadow(
              color: AppColors.brightGreen.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animated Pokeball
            AnimatedBuilder(
              animation: _rotationAnimation,
              builder: (context, child) {
                return AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _pulseAnimation.value,
                      child: Transform.rotate(
                        angle: _rotationAnimation.value * 2 * 3.14159,
                        child: Icon(
                          Icons.catching_pokemon,
                          size: 60,
                          color: AppColors.brightGreen,
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 20),

            // Loading text
            Text(
              'SCANNING...',
              style: context.titleLarge.copyWith(
                color: AppColors.brightGreen,
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 12),

            // Progress dots
            AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (index) {
                    final delay = index * 0.2;
                    final opacity = ((_pulseController.value + delay) % 1.0);
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColors.brightGreen.withValues(alpha: opacity),
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                );
              },
            ),

            const SizedBox(height: 8),

            Text(
              'PLEASE WAIT',
              style: context.bodySmall.copyWith(
                color: AppColors.brightGreen.withValues(alpha: 0.6),
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
