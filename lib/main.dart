import 'package:flutter/material.dart';
import 'package:pokemon_app/app_router.dart';
import 'package:pokemon_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokemon App',
      theme: lightTheme,
      routerConfig: appRouter,
    );
  }
}
