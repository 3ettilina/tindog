import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/onboarding/dog_details/bloc/add_dog_details_cubit.dart';
import 'package:tindog/onboarding/dog_details/view/dog_details_content.dart';

class AddDogDetailsView extends StatelessWidget {
  const AddDogDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDogDetailsCubit, AddDogDetailsState>(
      builder: (context, state) {
        return switch (state) {
          DogDetailsInitial() ||
          DogDetailsCompleted() ||
          DogDetailsSubmitting() =>
            Center(
              child: Assets.images.loadingPaws.image(width: 130),
            ),
          DogDetailsEditing() ||
          DogDetailsErrorSubmitting() =>
            const DogDetailsContent(),
        };
      },
    );
  }
}
