import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class EmptyDogs extends StatelessWidget {
  const EmptyDogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.animations.empty.lottie(height: 200, repeat: true),
              const SizedBox(height: 8),
              Text(
                textAlign: TextAlign.center,
                'No dogs where found at the moment 🥲.\nPlease come back later.',
                style: context.textTheme.titleMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
