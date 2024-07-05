import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/onboarding/dog_details/bloc/add_dog_details_cubit.dart';
import 'package:tindog/onboarding/dog_details/view/dog_details_form.dart';
import 'package:tindog/onboarding/dog_details/view/submit_button.dart';

class DogDetailsContent extends StatelessWidget {
  const DogDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDogDetailsCubit, AddDogDetailsState>(
      buildWhen: (_, curr) =>
          curr is DogDetailsEditing || curr is DogDetailsErrorSubmitting,
      builder: (context, state) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    Text(
                      'Let\'s add some more details 🐾',
                      style: context.textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 30),
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        state.imagePath!,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const DogDetailsForm(),
                    const SizedBox(height: 50),
                    if (state is DogDetailsErrorSubmitting)
                      AppInfoCard.warning(text: state.message),
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: SubmitButton(),
            ),
          ],
        );
      },
    );
  }
}
