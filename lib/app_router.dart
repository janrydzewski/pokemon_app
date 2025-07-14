import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_app/core/app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutePath.splash,
  routes: [
    GoRoute(
      name: AppRouteName.splash,
      path: AppRoutePath.splash,
      builder: (context, state) => Scaffold(
        body: SafeArea(child: Center(child: Text("Splash"))),
      ),
    ),
    GoRoute(
      name: AppRouteName.list,
      path: AppRoutePath.list,
      builder: (context, state) => const Scaffold(
        body: SafeArea(child: Center(child: Text("List"))),
      ),
    ),
    GoRoute(
      name: AppRouteName.detail,
      path: AppRoutePath.detail,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(child: Center(child: Text("Details"))),
        );
      },
    ),
  ],
);
