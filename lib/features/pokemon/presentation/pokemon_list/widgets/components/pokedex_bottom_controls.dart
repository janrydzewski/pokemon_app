import 'package:flutter/material.dart';
import 'package:pokemon_app/theme/theme.dart';


/// Bottom controls component simulating Game Boy controls
/// Includes D-pad, Nintendo branding, and action buttons (A/B)
class PokedexBottomControls extends StatelessWidget {
  const PokedexBottomControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.gameBoyBezel,
            AppColors.gameBoyBezel.withOpacity(0.8),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // D-pad representation
          const _DPadControl(),

          // Center Nintendo branding
          const Expanded(child: _NintendoBranding()),

          // Action buttons (A/B)
          const _ActionButtons(),
        ],
      ),
    );
  }
}

/// D-pad control component
class _DPadControl extends StatelessWidget {
  const _DPadControl();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(Icons.add, color: Colors.black.withOpacity(0.6), size: 20),
    );
  }
}

/// Nintendo Pokedex branding in center
class _NintendoBranding extends StatelessWidget {
  const _NintendoBranding();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'NINTENDO POKÉDX',
        style: TextStyle(
          color: Colors.black.withOpacity(0.7),
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

/// A/B action buttons
class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ActionButton(label: 'B'),
        const SizedBox(width: 8),
        _ActionButton(label: 'A'),
      ],
    );
  }
}

/// Individual action button (A or B)
class _ActionButton extends StatelessWidget {
  final String label;

  const _ActionButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: AppColors.pokedexRed.withOpacity(0.8),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
