import 'package:flutter/material.dart';
import 'package:pokemon_app/core/utils/context_extensions.dart';
import 'package:pokemon_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      theme: lightTheme,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Text("Pokemon App", style: context.headlineSmall),
          ),
        ),
      ),
    );
  }
}
