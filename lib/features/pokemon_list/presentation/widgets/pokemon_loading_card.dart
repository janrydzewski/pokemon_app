import 'package:flutter/material.dart';

import '../../../../theme/theme.dart';

class PokemonLoadingCard extends StatefulWidget {
  const PokemonLoadingCard({super.key});

  @override
  State<PokemonLoadingCard> createState() => _PokemonLoadingCardState();
}

class _PokemonLoadingCardState extends State<PokemonLoadingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.pokedexSilver,
        border: Border.all(color: Colors.black.withOpacity(0.8), width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 10,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.highContrastDark,
          border: Border.all(color: AppColors.brightGreen, width: 1),
        ),
        child: Stack(
          children: [
            // Scanlines effect
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: List.generate(20, (index) {
                      return index.isEven
                          ? Colors.transparent
                          : Colors.black.withOpacity(0.1);
                    }),
                  ),
                ),
              ),
            ),

            // Loading content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // Top ID area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Container(
                            width: 40,
                            height: 12,
                            decoration: BoxDecoration(
                              color: AppColors.brightGreen.withOpacity(
                                _animation.value,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppColors.brightGreen.withOpacity(
                                _animation.value,
                              ),
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Main loading area
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.contrastCardBackground,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: AppColors.brightGreen,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: AppColors.brightGreen.withOpacity(
                                      _animation.value,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.catching_pokemon,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // Loading dots
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(3, (index) {
                                    final delay = index * 0.3;
                                    final animValue =
                                        (_animation.value + delay) % 1.0;
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 2,
                                      ),
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color: AppColors.brightGreen
                                            .withOpacity(animValue),
                                        shape: BoxShape.circle,
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Bottom status bar
                  Container(
                    height: 16,
                    decoration: BoxDecoration(
                      color: AppColors.contrastCardBackground,
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(
                        color: AppColors.brightGreen,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 4),
                        Expanded(
                          child: AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Container(
                                height: 2,
                                decoration: BoxDecoration(
                                  color: AppColors.brightGreen.withOpacity(
                                    _animation.value,
                                  ),
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 4),
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Container(
                              width: 12,
                              height: 6,
                              decoration: BoxDecoration(
                                color: AppColors.brightGreen.withOpacity(
                                  _animation.value * 0.8,
                                ),
                                borderRadius: BorderRadius.circular(1),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
