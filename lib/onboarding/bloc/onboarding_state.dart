part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnboardingInitialState extends OnboardingState {}

class OnboardingNeedsGalleryPermissionState extends OnboardingState {}

class OnboardingNeedsGalleryPermissionOnSettingsState extends OnboardingState {}

class OnboardingGalleryAccessGrantedState extends OnboardingState {}

class OnboardingImageSelectedState extends OnboardingState {
  OnboardingImageSelectedState({required this.image});

  final Uint8List image;

  @override
  List<Object?> get props => [image];
}
