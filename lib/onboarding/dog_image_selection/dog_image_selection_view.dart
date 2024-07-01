import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog/onboarding/dog_image_selection/bloc/select_dog_image_bloc.dart';

class DogImageSelectionView extends StatelessWidget {
  const DogImageSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.images.dogGirlWelcome.image(
          width: MediaQuery.sizeOf(context).width,
          fit: BoxFit.fitWidth,
          alignment: Alignment.center,
        ),
        SingleChildScrollView(
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
                const SizedBox(height: 50),
                const _ImagePicker(),
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
    return BlocBuilder<SelectDogImageBloc, SelectDogImageState>(
      builder: (context, state) {
        final bloc = context.read<SelectDogImageBloc>();
        if (state is SelectDogImageNeedsGalleryPermissionsOnSettingsState) {
          return FilledButton(
            onPressed: () => bloc.add(const RequestGalleryPermission()),
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
            const _Icon(),
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
    return BlocBuilder<SelectDogImageBloc, SelectDogImageState>(
      builder: (context, state) {
        return switch (state) {
          SelectDogImageInitialState() ||
          SelectDogImagePermissionGrantedState() =>
            Text(
              textAlign: TextAlign.center,
              'First, choose an image from your gallery:',
              style: context.textTheme.bodyMedium,
            ),
          SelectDogImageAnalyzingState() => const AppInfoCard.loading(
              text: 'Hold on, we\'re processing the image...',
            ),
          SelectDogImageReadyState() => const AppInfoCard.success(
              text:
                  'Oh my! What a cute dog you have!😊\nWe\'re taking you to the next step...',
            ),
          SelectDogImageErrorNotADogState() => const AppInfoCard.warning(
              text:
                  'Looks like that\'s not a dog 👀. Please upload a dog image to continue.',
            ),
          SelectDogImageErrorState() => const AppInfoCard.warning(
              text:
                  'Hmm... We might have messed out 🙈. Please try again or check your Internet connectivity.',
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectDogImageBloc, SelectDogImageState>(
      builder: (context, state) {
        return switch (state) {
          SelectDogImageInitialState() ||
          SelectDogImagePermissionGrantedState() =>
            Assets.images.arrowDownDouble.image(height: 80),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
