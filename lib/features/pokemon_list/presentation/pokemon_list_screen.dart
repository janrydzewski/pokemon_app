import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/core/utils/context_extensions.dart';

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

class _PokemonListScreenState extends State<PokemonListScreen> {
  final ScrollController _scrollController = ScrollController();
  late final PokemonListCubit _cubit;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<PokemonListCubit>();
    _scrollController.addListener(_onScroll);
    _cubit.loadPokemonList();
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xFFF8F9FA), const Color(0xFFE9ECEF)],
            ),
          ),
          child: RefreshIndicator(
            onRefresh: () async {
              await _cubit.refreshPokemonList();
            },
            backgroundColor: Colors.white,
            child: CustomScrollView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                // Main content area
                BlocBuilder<PokemonListCubit, PokemonListState>(
                  bloc: _cubit,
                  builder: (context, state) {
                    return state.when(
                      initial: () =>
                          SliverFillRemaining(child: _buildInitialState()),
                      loading: () =>
                          SliverFillRemaining(child: _buildLoadingState()),
                      loaded:
                          (pokemonList, totalCount, hasMore, isLoadingMore) =>
                              _buildLoadedSlivers(
                                pokemonList,
                                hasMore,
                                isLoadingMore,
                                totalCount,
                              ),
                      error: (message) =>
                          SliverFillRemaining(child: _buildErrorState(message)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryYellow.withOpacity(0.2),
                  AppColors.primaryYellow.withOpacity(0.1),
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryYellow.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              Icons.catching_pokemon,
              size: 60,
              color: AppColors.primaryYellow,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Welcome to Pokédex',
            style: TextStyle(
              color: const Color(0xFF2D3748),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Pull to refresh and discover Pokémon',
            style: TextStyle(color: const Color(0xFF718096), fontSize: 16),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () => _cubit.loadPokemonList(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.seed, AppColors.seed.withOpacity(0.8)],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.seed.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                'Start Exploring',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.seed.withOpacity(0.2),
                  AppColors.seed.withOpacity(0.1),
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: CircularProgressIndicator(
              color: AppColors.seed,
              strokeWidth: 3,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Loading Pokémon...',
            style: TextStyle(
              color: const Color(0xFF2D3748),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Please wait while we fetch data',
            style: TextStyle(color: const Color(0xFF718096), fontSize: 14),
          ),
        ],
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
        SliverAppBar.medium(
          expandedHeight: 110,
          surfaceTintColor: Colors.white,
          title: Row(
            children: [
              Expanded(
                child: Text(
                  'Pokédex',
                  style: context.titleLarge.copyWith(
                    color: AppColors.darkText,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.seed.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu, color: Colors.white),
                ),
              ),
            ],
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.seed, AppColors.seed.withOpacity(0.8)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.seed.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Background pattern circles
                    Positioned(
                      top: -30,
                      right: -30,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      left: -20,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    // Main content
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.catching_pokemon,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Pokédex',
                                    style: context.titleLarge.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Discover and catch them all!',
                                    style: context.bodyMedium.copyWith(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.menu, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Pokemon grid sliver
        SliverPadding(
          padding: const EdgeInsets.all(12),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index >= pokemonList.length) {
                // Loading cards at the bottom
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
      ],
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.red.withOpacity(0.2),
                  Colors.red.withOpacity(0.1),
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(Icons.error_outline, size: 60, color: Colors.red),
          ),
          const SizedBox(height: 32),
          Text(
            'Something went wrong',
            style: TextStyle(
              color: const Color(0xFF2D3748),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              message,
              style: TextStyle(color: const Color(0xFF718096), fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () => _cubit.loadPokemonList(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.red, Colors.red.withOpacity(0.8)],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                'Try Again',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
