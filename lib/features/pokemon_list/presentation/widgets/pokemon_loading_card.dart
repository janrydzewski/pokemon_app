import 'package:flutter/material.dart';

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
    _animation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
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
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFE2E8F0),
              const Color(0xFFCBD5E0),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Background pattern
            Positioned(
              top: -50,
              right: -50,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Loading content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header skeleton
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Container(
                            width: 100,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(_animation.value * 0.8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Container(
                            width: 40,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(_animation.value * 0.6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Image skeleton
                  Expanded(
                    child: Center(
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(_animation.value * 0.7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.catching_pokemon,
                                size: 40,
                                color: Colors.grey.withOpacity(_animation.value * 0.5),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Bottom skeleton
                  Row(
                    children: [
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Container(
                            width: 60,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(_animation.value * 0.6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(_animation.value * 0.6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          );
                        },
                      ),
                    ],
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
