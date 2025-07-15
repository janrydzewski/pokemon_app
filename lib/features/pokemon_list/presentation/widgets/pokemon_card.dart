import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../theme/theme.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.highContrastDark,
              border: Border.all(color: AppColors.brightGreen, width: 1),
            ),
            child: Stack(
              children: [
                // Scanlines effect
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: List.generate(25, (index) {
                          return index.isEven
                              ? Colors.transparent
                              : Colors.black.withOpacity(0.1);
                        }),
                      ),
                    ),
                  ),
                ),

                // Card content
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top row with ID and status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.brightGreen,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Text(
                              _pokemonId,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ),
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppColors.brightGreen,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.brightGreen,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Pokemon image area
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
                          child: Hero(
                            tag: 'pokemon_${pokemon.name}',
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.contain,
                              placeholder: (context, url) => Container(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          color: AppColors.brightGreen,
                                          strokeWidth: 2,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Container(
                                        width: 20,
                                        height: 2,
                                        decoration: BoxDecoration(
                                          color: AppColors.brightGreen,
                                          borderRadius: BorderRadius.circular(
                                            1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: AppColors.brightGreen,
                                          borderRadius: BorderRadius.circular(
                                            3,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.catching_pokemon,
                                          size: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'NO DATA',
                                        style: TextStyle(
                                          color: AppColors.brightGreen,
                                          fontSize: 6,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'monospace',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Bottom name panel
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.contrastCardBackground,
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: AppColors.brightGreen,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              pokemon.name
                                  .split(' ')
                                  .map(
                                    (word) =>
                                        word[0].toUpperCase() +
                                        word.substring(1),
                                  )
                                  .join(' ')
                                  .toUpperCase(),
                              style: TextStyle(
                                color: AppColors.brightGreen,
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'monospace',
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: 2,
                                    decoration: BoxDecoration(
                                      color: AppColors.brightGreen,
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'RDY',
                                  style: TextStyle(
                                    color: AppColors.brightGreen,
                                    fontSize: 6,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'monospace',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
