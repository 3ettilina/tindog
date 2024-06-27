import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/onboarding/bloc/onboarding_bloc.dart';
import 'package:tindog/onboarding/dog_image_selection/dog_image_selection_view.dart';
import 'package:tindog_repository/tindog_repository.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => OnboardingBloc(
            repository: context.read<TindogRepository>(),
          ),
          child: const DogImageSelectionView(),
        ),
      ),
    );
  }
}
