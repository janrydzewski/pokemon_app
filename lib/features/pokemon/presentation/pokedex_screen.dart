import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/core/utils/context_extensions.dart';
import 'package:pokemon_app/features/pokemon/presentation/pokemon_detail/pokemon_detail_cubit.dart';

import '../../../core/di/service_locator.dart';
import '../../../theme/theme.dart';
import '../data/pokemon_models.dart';
import '../data/pokemon_type_models.dart';
import 'pokedex_cubit.dart';
import 'pokemon_detail/widgets/state_widgets/pokemon_detail_error_widget.dart';
import 'pokemon_detail/widgets/state_widgets/pokemon_detail_initial_widget.dart';
import 'pokemon_detail/widgets/state_widgets/pokemon_detail_loaded_widget.dart';
import 'pokemon_detail/widgets/state_widgets/pokemon_detail_loading_widget.dart';
import 'pokemon_list/pokemon_list_cubit.dart';
import 'pokemon_list/widgets/components/pokedex_shell.dart';
import 'pokemon_list/widgets/state_widgets/pokemon_list_error_widget.dart';
import 'pokemon_list/widgets/state_widgets/pokemon_list_initial_widget.dart';
import 'pokemon_list/widgets/state_widgets/pokemon_list_loaded_widget.dart';
import 'pokemon_list/widgets/state_widgets/pokemon_list_loading_widget.dart';
import 'pokemon_list/widgets/type_filter_modal.dart';

/// Main Pokedex Screen that manages switching between list and detail views
/// This creates the true Pokedex experience where the content changes
/// within the same device rather than navigating to separate screens
class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final ScrollController _scrollController = ScrollController();
  late final PokedexCubit _pokedexCubit;
  late final PokemonListCubit _listCubit;
  late final PokemonDetailCubit _detailCubit;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _pokedexCubit = getIt<PokedexCubit>();
    _listCubit = getIt<PokemonListCubit>();
    _detailCubit = getIt<PokemonDetailCubit>();
    _scrollController.addListener(_onScroll);

    // Ensure we start in list view
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_pokedexCubit.isShowingList) {
        _pokedexCubit.showPokemonList();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pokedexCubit.close();
    _listCubit.close();
    _detailCubit.close();
    super.dispose();
  }

  /// Handles infinite scroll pagination for Pokemon list
  void _onScroll() {
    if (_isBottom && !_isLoadingMore && _pokedexCubit.isShowingList) {
      _isLoadingMore = true;
      _listCubit.loadMorePokemon().then((_) {
        if (mounted) {
          _isLoadingMore = false;
        }
      });
    }
  }

  /// Checks if scroll has reached bottom threshold for pagination
  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.85);
  }

  /// Extracts Pokemon ID from API URL and builds image URL
  String _getPokemonImageUrl(String url) {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    final id = segments[segments.length - 2];
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
  }

  /// Handles Pokemon card tap - shows details in the same Pokedex
  void _onPokemonTap(Pokemon pokemon) {
    final uri = Uri.parse(pokemon.url);
    final segments = uri.pathSegments;
    final pokemonId = segments[segments.length - 2];

    // Switch to details view and load Pokemon data
    _pokedexCubit.showPokemonDetails(pokemonId, pokemon);
    _detailCubit.loadPokemonDetails(pokemonId);
  }

  /// Handles back button tap - returns to Pokemon list
  void _onBackTap() {
    _pokedexCubit.showPokemonList();
  }

  /// Handles filter button tap - opens type filter modal
  void _onFilterTap() {
    final currentState = _listCubit.state;
    PokemonTypeBasic? currentSelectedType;

    if (currentState is PokemonListLoaded) {
      currentSelectedType = currentState.selectedType;
    }

    showDialog(
      context: context,
      builder: (context) => TypeFilterModal(
        selectedType: currentSelectedType,
        onTypeSelected: (type) {
          if (type != null) {
            _listCubit.loadPokemonByType(type);
          } else {
            _listCubit.clearFilter();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PokedexShell(
      child: BlocBuilder<PokedexCubit, PokedexState>(
        bloc: _pokedexCubit,
        builder: (context, pokedexState) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: pokedexState.when(
              showingList: () => KeyedSubtree(
                key: const ValueKey('pokemon_list'),
                child: _buildPokemonList(),
              ),
              showingDetails: (pokemonId, pokemon) => KeyedSubtree(
                key: ValueKey('pokemon_details_$pokemonId'),
                child: _buildPokemonDetails(pokemonId),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Builds the Pokemon list view
  Widget _buildPokemonList() {
    return BlocBuilder<PokemonListCubit, PokemonListState>(
      bloc: _listCubit,
      builder: (context, state) {
        return state.when(
          initial: () => PokemonListInitialWidget(
            onStartPressed: () => _listCubit.loadPokemonList(),
          ),
          loading: () => const PokemonListLoadingWidget(),
          loaded:
              (pokemonList, totalCount, hasMore, isLoadingMore, selectedType) =>
                  PokemonListLoadedWidget(
                    pokemonList: pokemonList,
                    totalCount: totalCount,
                    hasMore: hasMore,
                    isLoadingMore: isLoadingMore,
                    scrollController: _scrollController,
                    getPokemonImageUrl: _getPokemonImageUrl,
                    onPokemonTap: _onPokemonTap,
                    onFilterTap: _onFilterTap,
                    selectedType: selectedType,
                    onRefresh: () async {
                      await _listCubit.refreshPokemonList();
                    },
                  ),
          error: (message) => PokemonListErrorWidget(
            message: message,
            onRetryPressed: () => _listCubit.loadPokemonList(),
          ),
        );
      },
    );
  }

  /// Builds the Pokemon details view with back button
  Widget _buildPokemonDetails(String pokemonId) {
    return BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
      bloc: _detailCubit,
      builder: (context, state) {
        return Column(
          children: [
            // Header with back button
            _buildDetailsHeader(),

            // Main content based on state
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.highContrastDark,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.brightGreen, width: 3),
                ),
                child: _buildDetailsContent(state),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Builds the header for details view with back button
  Widget _buildDetailsHeader() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 4),
      child: Row(
        children: [
          GestureDetector(
            onTap: _onBackTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.brightRed.withValues(alpha: 0.2),
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

          const Spacer(),
        ],
      ),
    );
  }

  /// Builds content for details view based on current state
  Widget _buildDetailsContent(PokemonDetailState state) {
    if (state is PokemonDetailLoading) {
      return const PokemonDetailLoadingWidget();
    } else if (state is PokemonDetailLoaded) {
      return PokemonDetailLoadedWidget(pokemon: state.pokemon);
    } else if (state is PokemonDetailError) {
      return PokemonDetailErrorWidget(
        message: state.message,
        onRetry: () {
          final pokemonId = _pokedexCubit.currentPokemonId;
          if (pokemonId != null) {
            _detailCubit.loadPokemonDetails(pokemonId);
          }
        },
      );
    } else {
      return const PokemonDetailInitialWidget();
    }
  }
}
