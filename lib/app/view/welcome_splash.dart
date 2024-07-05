import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class WelcomeSplash extends StatelessWidget {
  const WelcomeSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome back!',
          style: context.textTheme.headlineMedium,
        ),
        const SizedBox(height: 12),
        Text(
          'Did you know that 100% of dogs finding a couple on Tindog succeed?',
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        Assets.animations.walkingDog.lottie(width: 150),
      ],
    );
  }
}
