import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/service_locator.dart';
import '../../../theme/theme.dart';
import '../data/pokemon_models.dart';
import 'pokemon_list_cubit.dart';
import 'widgets/pokemon_grid.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final ScrollController _scrollController = ScrollController();
  late final PokemonListCubit _cubit;

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
    if (_isBottom) {
      _cubit.loadMorePokemon();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFF8F9FA),
              const Color(0xFFE9ECEF),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Modern Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pokédex',
                              style: textTheme.headlineMedium?.copyWith(
                                color: const Color(0xFF2D3748),
                                fontWeight: FontWeight.w800,
                                fontSize: 32,
                              ),
                            ),
                            Text(
                              'Discover amazing creatures',
                              style: textTheme.bodyMedium?.copyWith(
                                color: const Color(0xFF718096),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.seed,
                                AppColors.seed.withOpacity(0.8),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.seed.withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.catching_pokemon,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Search bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 16,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: const Color(0xFFA0AEC0),
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Search Pokémon...',
                              style: textTheme.bodyMedium?.copyWith(
                                color: const Color(0xFFA0AEC0),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7FAFC),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.tune,
                              color: const Color(0xFF718096),
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Main content area
              Expanded(
                child: BlocBuilder<PokemonListCubit, PokemonListState>(
                  bloc: _cubit,
                  builder: (context, state) {
                    return state.when(
                      initial: () => _buildInitialState(),
                      loading: () => _buildLoadingState(),
                      loaded: (pokemonList, hasMore, isLoadingMore) => 
                          _buildLoadedState(pokemonList, hasMore, isLoadingMore),
                      error: (message) => _buildErrorState(message),
                    );
                  },
                ),
              ),
            ],
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
            style: TextStyle(
              color: const Color(0xFF718096),
              fontSize: 16,
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
                  colors: [
                    AppColors.seed,
                    AppColors.seed.withOpacity(0.8),
                  ],
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
            style: TextStyle(
              color: const Color(0xFF718096),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadedState(
    List<Pokemon> pokemonList,
    bool hasMore,
    bool isLoadingMore,
  ) {
    return Column(
      children: [
        // Stats header
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${pokemonList.length}',
                    style: TextStyle(
                      color: const Color(0xFF2D3748),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Pokémon found',
                    style: TextStyle(
                      color: const Color(0xFF718096),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Online',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Pokemon grid
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              await _cubit.refreshPokemonList();
            },
            color: AppColors.seed,
            backgroundColor: Colors.white,
            child: PokemonGrid(
              pokemonList: pokemonList,
              isLoadingMore: isLoadingMore,
              scrollController: _scrollController,
              getPokemonImageUrl: _getPokemonImageUrl,
              onPokemonTap: _onPokemonTap,
            ),
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
            child: Icon(
              Icons.error_outline,
              size: 60,
              color: Colors.red,
            ),
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
              style: TextStyle(
                color: const Color(0xFF718096),
                fontSize: 16,
              ),
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
                  colors: [
                    Colors.red,
                    Colors.red.withOpacity(0.8),
                  ],
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
