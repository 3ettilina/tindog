import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/onboarding/bloc/onboarding_bloc.dart';

class OnboardingDogImage extends StatelessWidget {
  const OnboardingDogImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Assets.images.onboardingWelcome.image(
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.fitWidth,
          ),
        ),
        Expanded(
          flex: 4,
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
                const SizedBox(height: 30),
                Text(
                  'First, choose an image from your gallery:',
                  style: context.textTheme.bodyLarge,
                ),
                Assets.images.arrowDownDouble.image(width: 60),
                const _ImagePicker(),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () {},
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
                ),
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
        return switch (state) {
          OnboardingNeedsGalleryPermissionOnSettingsState() => FilledButton(
              onPressed: () => bloc.add(RequestGalleryPermission()),
              child: Text(
                'Open settings to allow camera access',
                style: context.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.theme.canvasColor,
                ),
              ),
            ),
          OnboardingGalleryAccessGrantedState() ||
          OnboardingImageSelectedState() =>
            const AppImagePicker(),
          OnboardingInitialState() ||
          OnboardingNeedsGalleryPermissionState() =>
            const CircularProgressIndicator(),
        };
      },
    );
  }
}
