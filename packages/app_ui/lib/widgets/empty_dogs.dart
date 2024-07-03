import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class EmptyDogs extends StatelessWidget {
  const EmptyDogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        children: [
          Center(
            child: Assets.animations.empty.lottie(width: 200, repeat: false),
          ),
          const SizedBox(height: 8),
          Text(
            textAlign: TextAlign.center,
            'No dogs where found at the moment 🥲. Please come back later.',
            style: context.textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
