import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/onboarding/bloc/onboarding_bloc.dart';
import 'package:tindog/onboarding/view/onboarding_dog_image.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => OnboardingBloc(),
          child: const OnboardingDogImage(),
        ),
      ),
    );
  }
}
