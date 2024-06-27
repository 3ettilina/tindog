part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class CheckGalleryAccess extends OnboardingEvent {}

class RequestGalleryPermission extends OnboardingEvent {}

class SelectDogImage extends OnboardingEvent {
  SelectDogImage({required this.image});

  final File image;
}
