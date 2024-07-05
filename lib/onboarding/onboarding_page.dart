import 'package:flutter/material.dart';
import 'package:tindog/onboarding/dog_image_selection/dog_image_selection_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: DogImageSelectionPage(),
      ),
    );
  }
}
