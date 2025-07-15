import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/core/utils/context_extensions.dart';
import 'package:pokemon_app/features/pokemon/presentation/pokemon_detail/widgets/pokemon_detail_widgets.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../theme/theme.dart';
import '../../data/pokemon_models.dart';
import 'pokemon_detail_cubit.dart';

/// Pokemon Detail Screen with Game Boy Pokédex design
class PokemonDetailScreen extends StatefulWidget {
  final String pokemonId;

  const PokemonDetailScreen({super.key, required this.pokemonId});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  late final PokemonDetailCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<PokemonDetailCubit>();
    _cubit.loadPokemonDetails(widget.pokemonId);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  String _getPokemonImageUrl(int id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.retroBackground,
      body: SafeArea(
        child: BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
          bloc: _cubit,
          builder: (context, state) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.pokedexSilver,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.8),
                    blurRadius: 20,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  // Header with back button
                  _buildHeader(context),

                  // Main content based on state
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.highContrastDark,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.brightGreen,
                          width: 3,
                        ),
                      ),
                      child: _buildContent(state),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.pokedexSilver,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          // Power indicator
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: AppColors.brightGreen,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: AppColors.brightGreen, blurRadius: 8),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // Title
          Text(
            'POKÉDEX',
            style: context.titleLarge.copyWith(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),

          const Spacer(),

          // Back button
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.brightRed.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.brightRed, width: 2),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back, size: 12, color: AppColors.brightRed),
                  const SizedBox(width: 4),
                  Text(
                    'BACK',
                    style: context.labelSmall.copyWith(
                      color: AppColors.brightRed,
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(PokemonDetailState state) {
    if (state is PokemonDetailLoading) {
      return _buildLoadingContent();
    } else if (state is PokemonDetailLoaded) {
      return _buildLoadedContent(state.pokemon);
    } else if (state is PokemonDetailError) {
      return _buildErrorContent(state.message);
    } else {
      return _buildLoadingContent();
    }
  }

  Widget _buildLoadingContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.brightGreen.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.brightGreen, width: 2),
            ),
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: AppColors.brightGreen,
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'LOADING POKEMON DATA...',
            style: context.bodyMedium.copyWith(
              color: AppColors.brightGreen,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          // Scanning animation
          Container(
            width: 100,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.highContrastDark,
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: AppColors.brightGreen, width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1),
              child: LinearProgressIndicator(
                color: AppColors.brightGreen,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorContent(String message) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.brightRed.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.brightRed, width: 2),
            ),
            child: Icon(
              Icons.error_outline,
              color: AppColors.brightRed,
              size: 20,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'ERROR LOADING POKEMON',
            style: context.bodyMedium.copyWith(
              color: AppColors.brightRed,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: context.bodySmall.copyWith(
              color: AppColors.brightRed.withOpacity(0.7),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => _cubit.loadPokemonDetails(widget.pokemonId),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.brightRed.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.brightRed, width: 2),
              ),
              child: Text(
                'RETRY',
                style: context.labelLarge.copyWith(
                  color: AppColors.brightRed,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadedContent(PokemonDetails pokemon) {
    final maxStat = pokemon.stats.isNotEmpty
        ? pokemon.stats
              .map((stat) => stat.baseStat)
              .reduce((a, b) => a > b ? a : b)
        : 255;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pokemon name header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.contrastCardBackground,
              border: Border(
                bottom: BorderSide(color: AppColors.brightGreen, width: 2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'POKEMON DATA:',
                  style: context.labelSmall.copyWith(
                    color: AppColors.brightGreen,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  pokemon.name.toUpperCase(),
                  style: context.bodyMedium.copyWith(
                    color: AppColors.brightGreen,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Pokemon image
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.contrastCardBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.brightGreen, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: _getPokemonImageUrl(pokemon.id),
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: AppColors.brightGreen,
                      strokeWidth: 2,
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.catching_pokemon,
                          size: 40,
                          color: AppColors.brightGreen,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'NO IMAGE DATA',
                          style: context.bodySmall.copyWith(
                            color: AppColors.brightGreen,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Types
          if (pokemon.types.isNotEmpty) ...[
            Text(
              'TYPES:',
              style: context.labelSmall.copyWith(
                color: AppColors.brightGreen,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: pokemon.types
                  .map((type) => PokemonTypeBadge(typeName: type.type.name))
                  .toList(),
            ),
            const SizedBox(height: 16),
          ],

          // Basic info
          PokemonBasicInfoPanel(pokemon: pokemon),

          const SizedBox(height: 16),

          // Stats
          if (pokemon.stats.isNotEmpty) ...[
            Text(
              'STATS:',
              style: context.labelSmall.copyWith(
                color: AppColors.brightGreen,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            ...pokemon.stats.map(
              (stat) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: PokemonStatBar(
                  statName: stat.stat.name,
                  statValue: stat.baseStat,
                  maxValue: maxStat > 0 ? maxStat : 255,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
