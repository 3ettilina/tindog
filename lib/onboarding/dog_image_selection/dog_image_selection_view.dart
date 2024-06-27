import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/onboarding/bloc/onboarding_bloc.dart';

class DogImageSelectionView extends StatelessWidget {
  const DogImageSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Assets.images.onboardingWelcome.image(
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  'Yay! You\'re in ✨',
                  style: context.textTheme.headlineLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  textAlign: TextAlign.center,
                  'Let\'s create a profile for your doggy...',
                  style: context.textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                const _ImagePicker(),
                const Spacer(),
                const _ContinueButton(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ImagePicker extends StatelessWidget {
  const _ImagePicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final bloc = context.read<OnboardingBloc>();
        if (state is OnboardingNeedsGalleryPermissionOnSettingsState) {
          return FilledButton(
            onPressed: () => bloc.add(RequestGalleryPermission()),
            child: Text(
              'Open settings to allow gallery access.',
              style: context.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.theme.canvasColor,
              ),
            ),
          );
        }
        return Column(
          children: [
            const _InfoText(),
            Assets.images.arrowDownDouble.image(width: 60),
            AppImagePicker(
              onImageSelected: (image) => bloc.add(
                SelectDogImage(image: image),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _InfoText extends StatelessWidget {
  const _InfoText();

  @override
  Widget build(BuildContext context) {
    // TODO(3ettilina): Fix rebuilds not working properly. Text never changes.
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return switch (state) {
          OnboardingInitialState() ||
          OnboardingGalleryAccessGrantedState() =>
            Text(
              textAlign: TextAlign.center,
              'First, choose an image from your gallery:',
              style: context.textTheme.bodyLarge,
            ),
          OnboardingImageSelectedState() ||
          OnboardingImageAnalyzingState() =>
            Text(
              textAlign: TextAlign.center,
              'Hold on, we\'re processing the image...',
              style: context.textTheme.bodyLarge,
            ),
          OnboardingImageReadyState() => Text(
              textAlign: TextAlign.center,
              'Alright! What a cute dog you have! Let\'s continue to the next step 😊',
              style: context.textTheme.bodyLarge,
            ),
          OnboardingImageIsNotADogState() => Card(
              color: Colors.redAccent,
              child: Text(
                textAlign: TextAlign.center,
                'Looks like that\'s not a dog 👀. Please upload a dog image to continue.',
                style: context.textTheme.bodyLarge,
              ),
            ),
          OnboardingImageErrorState() => Card(
              color: Colors.orange,
              child: Text(
                textAlign: TextAlign.center,
                'Hmm... We might have messed out 🙈. Please try again or check your Internet connectivity.',
                style: context.textTheme.bodyLarge,
              ),
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton();

  @override
  Widget build(BuildContext context) {
    final isContinueAllowed = context.select<OnboardingBloc, bool>(
      (bloc) => bloc.state.isContinueAllowed,
    );
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: isContinueAllowed ? () {} : null,
            child: Text(
              'Continue',
              style: context.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: context.theme.canvasColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
