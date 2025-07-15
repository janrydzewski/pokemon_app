import 'package:flutter/material.dart';
import 'package:pokemon_app/theme/theme.dart';

/// Screen wrapper component that provides the Game Boy-style screen container
/// with border, scanlines overlay, and proper styling
class PokedexScreenWrapper extends StatelessWidget {
  final Widget child;

  const PokedexScreenWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.gameBoyScreenDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Stack(children: [child, const _ScanlinesOverlay()]),
      ),
    );
  }
}

class _ScanlinesOverlay extends StatelessWidget {
  const _ScanlinesOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: List.generate(40, (index) {
                return index.isEven
                    ? Colors.transparent
                    : Colors.black.withOpacity(0.1);
              }),
            ),
          ),
        ),
      ),
    );
  }
}
