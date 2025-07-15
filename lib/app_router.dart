import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/core/app_routes.dart';
import 'package:pokemon_app/features/pokemon/presentation/pokemon_detail/pokemon_detail_screen.dart';
import 'package:pokemon_app/features/pokemon/presentation/pokemon_list/pokemon_list_screen.dart';
import 'package:pokemon_app/features/splash/presentation/splash_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutePath.splash,
  routes: [
    GoRoute(
      name: AppRouteName.splash,
      path: AppRoutePath.splash,
      pageBuilder: (ctx, state) =>
          buildFadePage(context: ctx, state: state, child: const SplashPage()),
    ),
    GoRoute(
      name: AppRouteName.list,
      path: AppRoutePath.list,
      pageBuilder: (ctx, state) =>
          buildFadePage(context: ctx, state: state, child: PokemonListScreen()),
    ),
    GoRoute(
      name: AppRouteName.detail,
      path: AppRoutePath.detail,
      pageBuilder: (ctx, state) {
        final pokemonId = state.pathParameters['id'] ?? '1';
        return buildFadePage(
          context: ctx,
          state: state,
          child: PokemonDetailScreen(pokemonId: pokemonId),
        );
      },
    ),
  ],
);

// Custom transition for fade effect
CustomTransitionPage<T> buildFadePage<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
    transitionDuration: const Duration(milliseconds: 400),
  );
}
