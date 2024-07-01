import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tindog/onboarding/dog_details/bloc/dog_details_cubit.dart';
import 'package:tindog/onboarding/dog_image_selection/bloc/select_dog_image_bloc.dart';
import 'package:tindog/onboarding/dog_image_selection/dog_image_selection_view.dart';

class DogImageSelectionPage extends StatelessWidget {
  const DogImageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DogImageSelectedListener(
      child: CompleteProfileListener(
        child: SafeArea(
          child: Scaffold(
            body: DogImageSelectionView(),
          ),
        ),
      ),
    );
  }
}

class DogImageSelectedListener extends StatelessWidget {
  const DogImageSelectedListener({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SelectDogImageBloc, SelectDogImageState>(
      listenWhen: (prev, curr) => curr is SelectDogImageReadyState,
      listener: (context, state) {
        // Safely getting the data of the state
        if (state is SelectDogImageReadyState) {
          final detailsCubit = context.read<DogDetailsCubit>();
          detailsCubit.setup(
            id: state.id,
            imageUrl: state.imagePath,
            breed: state.breed,
            size: state.size,
            description: state.description,
          );
          Future.delayed(const Duration(milliseconds: 1500), () {
            context.pushNamed('dogDetails');
          });
        }
      },
      child: child,
    );
  }
}

class CompleteProfileListener extends StatelessWidget {
  const CompleteProfileListener({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DogDetailsCubit, DogDetailsState>(
      listener: (context, state) {
        final st = state;
        if (st is DogDetailsCompleted) {
          Future.delayed(const Duration(milliseconds: 1500), () {
            context.pushNamed('discover');
          });
        }
      },
      child: child,
    );
  }
}
