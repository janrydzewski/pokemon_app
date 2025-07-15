import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/service_locator.dart';
import '../data/pokemon_models.dart';
import '../data/pokemon_type_models.dart';
import 'pokemon_list_cubit.dart';
import 'widgets/components/pokedex_shell.dart';
import 'widgets/state_widgets/pokemon_list_error_widget.dart';
import 'widgets/state_widgets/pokemon_list_initial_widget.dart';
import 'widgets/state_widgets/pokemon_list_loaded_widget.dart';
import 'widgets/state_widgets/pokemon_list_loading_widget.dart';
import 'widgets/type_filter_modal.dart';

/// Modern Pokemon List Screen
/// Uses clean architecture with separated state widgets for better maintainability
/// Implements Game Boy Pokedex design system with reusable components
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
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _cubit.close();
    super.dispose();
  }

  /// Handles infinite scroll pagination
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

  /// Handles Pokemon card tap - navigates to Pokemon details
  void _onPokemonTap(Pokemon pokemon) {
    final uri = Uri.parse(pokemon.url);
    final segments = uri.pathSegments;
    final pokemonId = segments[segments.length - 2];
    
    context.push('/detail/$pokemonId');
  }

  /// Handles filter button tap - opens type filter modal
  void _onFilterTap() {
    final currentState = _cubit.state;
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
            _cubit.loadPokemonByType(type);
          } else {
            _cubit.clearFilter();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PokedexShell(
      child: BlocBuilder<PokemonListCubit, PokemonListState>(
        bloc: _cubit,
        builder: (context, state) {
          return state.when(
            initial: () => PokemonListInitialWidget(
              onStartPressed: () => _cubit.loadPokemonList(),
            ),
            loading: () => const PokemonListLoadingWidget(),
            loaded:
                (
                  pokemonList,
                  totalCount,
                  hasMore,
                  isLoadingMore,
                  selectedType,
                ) => PokemonListLoadedWidget(
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
                    await _cubit.refreshPokemonList();
                  },
                ),
            error: (message) => PokemonListErrorWidget(
              message: message,
              onRetryPressed: () => _cubit.loadPokemonList(),
            ),
          );
        },
      ),
    );
  }
}
