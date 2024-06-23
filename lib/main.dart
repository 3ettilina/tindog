import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tindog/auth/auth_page.dart';

void main() {
  runApp(const ProviderScope(child: TinDogApp()));
}

class TinDogApp extends StatelessWidget {
  const TinDogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TinDog',
      theme: AppTheme.light,
      home: const SafeArea(
        child: AuthPage(),
      ),
    );
  }
}
