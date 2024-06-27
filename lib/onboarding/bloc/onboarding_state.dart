part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState extends Equatable {
  bool get isContinueAllowed => this is OnboardingImageReadyState;

  @override
  List<Object?> get props => [];
}

class OnboardingInitialState extends OnboardingState {}

class OnboardingNeedsGalleryPermissionState extends OnboardingState {}

class OnboardingNeedsGalleryPermissionOnSettingsState extends OnboardingState {}

class OnboardingGalleryAccessGrantedState extends OnboardingState {}

class OnboardingImageSelectedState extends OnboardingState {
  OnboardingImageSelectedState({required this.image});

  final File image;

  @override
  List<Object?> get props => [image, ...super.props];
}

class OnboardingImageAnalyzingState extends OnboardingState {
  OnboardingImageAnalyzingState({required this.image});

  final File image;

  @override
  List<Object?> get props => [image, ...super.props];
}

class OnboardingImageReadyState extends OnboardingState {
  OnboardingImageReadyState({required this.image});

  final File image;

  @override
  List<Object?> get props => [image, ...super.props];
}

class OnboardingImageIsNotADogState extends OnboardingState {
  OnboardingImageIsNotADogState({
    required this.image,
    required this.message,
  });

  final File image;
  final String message;

  @override
  List<Object?> get props => [image, message, ...super.props];
}

class OnboardingImageErrorState extends OnboardingState {
  OnboardingImageErrorState({
    required this.image,
    required this.message,
  });

  final File image;
  final String message;

  @override
  List<Object?> get props => [image, message, ...super.props];
}
