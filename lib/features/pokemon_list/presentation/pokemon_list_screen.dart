import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/service_locator.dart';
import '../../../theme/theme.dart';
import '../data/pokemon_models.dart';
import 'pokemon_list_cubit.dart';
import 'widgets/pokemon_card.dart';
import 'widgets/pokemon_loading_card.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final PokemonListCubit _cubit;
  bool _isLoadingMore = false;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<PokemonListCubit>();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController?.dispose();
    _cubit.close();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && !_isLoadingMore) {
      _isLoadingMore = true;
      _cubit.loadMorePokemon().then((_) {
        if (mounted) {
          _isLoadingMore = false;
        }
      });
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.85);
  }

  String _getPokemonImageUrl(String url) {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    final id = segments[segments.length - 2];
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  }

  void _onPokemonTap(Pokemon pokemon) {
    // TODO: Navigate to Pokemon details
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tapped on ${pokemon.name}'),
        backgroundColor: AppColors.brightGreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.retroBackground,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.retroBackground,
              AppColors.retroBackground.withOpacity(0.8),
              Colors.black,
            ],
          ),
        ),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.pokedexRed,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.gameBoyBezel,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  // Game Boy header with buttons
                  Container(
                    height: 80,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.pokedexRed,
                          AppColors.pokedexRed.withOpacity(0.9),
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        // Left side - Power indicator
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: AppColors.screenGreen,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.screenGreen,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'POWER',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'POKÉDEX',
                          style: TextStyle(
                            color: AppColors.pokedexGold,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(1, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        // Right side buttons
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppColors.buttonBlue,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppColors.buttonYellow,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Main screen area
                  Expanded(
                    child: Container(
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
                        child: Stack(
                          children: [
                            // Scanlines overlay
                            Positioned.fill(
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

                            // Screen content
                            RefreshIndicator(
                              onRefresh: () async {
                                await _cubit.refreshPokemonList();
                              },
                              color: AppColors.brightGreen,
                              backgroundColor: AppColors.highContrastDark,
                              child: CustomScrollView(
                                controller: _scrollController,
                                physics: const AlwaysScrollableScrollPhysics(),
                                slivers: [
                                  BlocBuilder<
                                    PokemonListCubit,
                                    PokemonListState
                                  >(
                                    bloc: _cubit,
                                    builder: (context, state) {
                                      return state.when(
                                        initial: () => SliverFillRemaining(
                                          child: _buildInitialState(),
                                        ),
                                        loading: () => SliverFillRemaining(
                                          child: _buildLoadingState(),
                                        ),
                                        loaded:
                                            (
                                              pokemonList,
                                              totalCount,
                                              hasMore,
                                              isLoadingMore,
                                            ) => _buildLoadedSlivers(
                                              pokemonList,
                                              hasMore,
                                              isLoadingMore,
                                              totalCount,
                                            ),

                                        error: (message) => SliverFillRemaining(
                                          child: _buildErrorState(message),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bottom controls
                  Container(
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
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.black.withOpacity(0.6),
                            size: 20,
                          ),
                        ),

                        // Center area
                        Expanded(
                          child: Center(
                            child: Text(
                              'NINTENDO POKÉDEX',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),

                        // Action buttons
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: AppColors.pokedexRed.withOpacity(0.8),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'B',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: AppColors.pokedexRed.withOpacity(0.8),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'A',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
          ),
        ),
      ),
    );
  }

  Widget _buildInitialState() {
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
            // Game Boy style Pokédex boot screen
            Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.contrastCardBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.brightGreen, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.brightGreen.withOpacity(0.3),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Screen content
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Pokéball pixel art style
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.brightGreen,
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                height: 20,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.brightGreen.withOpacity(
                                      0.7,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: AppColors.contrastCardBackground,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'POKÉDX',
                          style: TextStyle(
                            color: AppColors.brightGreen,
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                            fontFamily: 'monospace',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Ver 1.0',
                          style: TextStyle(
                            color: AppColors.brightGreen.withOpacity(0.7),
                            fontSize: 8,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Corner pixels for retro effect
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Container(
                      width: 2,
                      height: 2,
                      color: AppColors.brightGreen.withOpacity(0.5),
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Container(
                      width: 2,
                      height: 2,
                      color: AppColors.brightGreen.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Boot text
            Text(
              'GAME BOY',
              style: TextStyle(
                color: AppColors.brightGreen,
                fontSize: 20,
                fontWeight: FontWeight.w900,
                letterSpacing: 3,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'POKÉDEX CARTRIDGE',
              style: TextStyle(
                color: AppColors.brightGreen.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(height: 40),

            // Start button
            GestureDetector(
              onTap: () => _cubit.loadPokemonList(),
              child: Container(
                width: 160,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.contrastCardBackground,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.brightGreen, width: 2),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: AppColors.brightGreen,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'PRESS START',
                        style: TextStyle(
                          color: AppColors.brightGreen,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Blinking cursor
            AnimatedBuilder(
              animation: _animationController ??= AnimationController(
                duration: const Duration(milliseconds: 800),
                vsync: this,
              )..repeat(reverse: true),
              builder: (context, child) {
                return Opacity(
                  opacity: _animationController!.value,
                  child: Container(
                    width: 8,
                    height: 12,
                    color: AppColors.gameBoyGreen,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
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
            Container(
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
                        // Loading spinner Game Boy style
                        Container(
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
                                    backgroundColor: AppColors.brightGreen
                                        .withOpacity(0.2),
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
                        ),
                        const SizedBox(height: 20),

                        // Loading text
                        Text(
                          'LOADING...',
                          style: TextStyle(
                            color: AppColors.brightGreen,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                            fontFamily: 'monospace',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'ACCESSING POKÉDEX DATA',
                          style: TextStyle(
                            color: AppColors.brightGreen.withOpacity(0.7),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            fontFamily: 'monospace',
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Progress bar Game Boy style
                        Container(
                          width: 160,
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppColors.contrastCardBackground,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: AppColors.brightGreen,
                              width: 1,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.transparent,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.brightGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Corner decorations
                  Positioned(
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
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Loading status
            Text(
              'PLEASE WAIT...',
              style: TextStyle(
                color: AppColors.brightGreen,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadedSlivers(
    List<Pokemon> pokemonList,
    bool hasMore,
    bool isLoadingMore,
    int totalCount,
  ) {
    return SliverMainAxisGroup(
      slivers: [
        // Header
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Status bar
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.highContrastDark,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.brightGreen, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.brightGreen.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
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
                      const SizedBox(width: 8),
                      Text(
                        'POKÉDEX ONLINE',
                        style: TextStyle(
                          color: AppColors.brightGreen,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          fontFamily: 'monospace',
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${pokemonList.length} ENTRIES',
                        style: TextStyle(
                          color: AppColors.brightGreen,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'monospace',
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Filter feature coming soon!'),
                              backgroundColor: AppColors.brightGreen,
                            ),
                          );
                        },
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.brightGreen.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: AppColors.brightGreen,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.tune,
                            color: AppColors.brightGreen,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Pokemon grid
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index >= pokemonList.length) {
                return const PokemonLoadingCard();
              }

              final pokemon = pokemonList[index];
              return PokemonCard(
                pokemon: pokemon,
                imageUrl: _getPokemonImageUrl(pokemon.url),
                onTap: () => _onPokemonTap(pokemon),
              );
            }, childCount: pokemonList.length + (isLoadingMore ? 2 : 0)),
          ),
        ),

        // Bottom padding
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }

  Widget _buildErrorState(String message) {
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
            Container(
              width: 240,
              height: 160,
              decoration: BoxDecoration(
                color: AppColors.contrastCardBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.brightRed, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.brightRed.withOpacity(0.3),
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
                        Container(
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
                                fontFamily: 'monospace',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Error message
                        Text(
                          'ERROR',
                          style: TextStyle(
                            color: AppColors.brightRed,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                            fontFamily: 'monospace',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 180,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.contrastCardBackground,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: AppColors.brightRed.withOpacity(0.5),
                            ),
                          ),
                          child: Text(
                            message.toUpperCase(),
                            style: TextStyle(
                              color: AppColors.brightRed,
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'monospace',
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Blinking error indicators
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
              ),
            ),
            const SizedBox(height: 40),

            // Retry button
            GestureDetector(
              onTap: () => _cubit.loadPokemonList(),
              child: Container(
                width: 160,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.contrastCardBackground,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.brightRed, width: 2),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh, color: AppColors.brightRed, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        'TRY AGAIN',
                        style: TextStyle(
                          color: AppColors.brightRed,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // System message
            Text(
              'SYSTEM HALT',
              style: TextStyle(
                color: AppColors.brightRed.withOpacity(0.6),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
