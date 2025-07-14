import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/pokemon_models.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final String imageUrl;
  final VoidCallback? onTap;

  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.imageUrl,
    this.onTap,
  });

  String get _pokemonId {
    final uri = Uri.parse(pokemon.url);
    final segments = uri.pathSegments;
    final id = segments[segments.length - 2];
    return '#${id.padLeft(3, '0')}';
  }

  Color get _cardColor {
    final id = int.tryParse(_pokemonId.substring(1)) ?? 1;
    // Different colors based on pokemon ID to mimic the attached design
    final colors = [
      [const Color(0xFF4ECDC4), const Color(0xFF44A08D)], // Teal
      [const Color(0xFFFF6B6B), const Color(0xFFE74C3C)], // Red
      [const Color(0xFF4ECDC4), const Color(0xFF44A08D)], // Teal again
      [const Color(0xFFFFBE0B), const Color(0xFFF39C12)], // Yellow
      [const Color(0xFF6C5CE7), const Color(0xFFA29BFE)], // Purple
      [const Color(0xFF00B894), const Color(0xFF00CEC9)], // Green
    ];
    return Color.lerp(
      colors[id % colors.length][0],
      colors[id % colors.length][1],
      0.5,
    )!;
  }

  List<Color> get _gradientColors {
    final id = int.tryParse(_pokemonId.substring(1)) ?? 1;
    final colorSets = [
      [const Color(0xFF4ECDC4), const Color(0xFF44A08D)], // Teal like Bulbasaur
      [const Color(0xFFFF6B6B), const Color(0xFFE74C3C)], // Red like Charmander
      [const Color(0xFF74B9FF), const Color(0xFF0984E3)], // Blue
      [const Color(0xFFFFBE0B), const Color(0xFFF39C12)], // Yellow
      [const Color(0xFF6C5CE7), const Color(0xFFA29BFE)], // Purple
      [const Color(0xFF00B894), const Color(0xFF00CEC9)], // Green
    ];
    return colorSets[id % colorSets.length];
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: _cardColor.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: _gradientColors,
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
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with name and ID
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              pokemon.name
                                  .split(' ')
                                  .map(
                                    (word) =>
                                        word[0].toUpperCase() +
                                        word.substring(1),
                                  )
                                  .join(' '),
                              style: textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            _pokemonId,
                            style: textTheme.titleMedium?.copyWith(
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Pokemon image
                      Expanded(
                        child: Center(
                          child: Hero(
                            tag: 'pokemon_${pokemon.name}',
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              width: 100,
                              height: 100,
                              placeholder: (context, url) => Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.catching_pokemon,
                                      size: 40,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'No Image',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
