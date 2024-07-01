part of 'onboarding_bloc.dart';

sealed class OnboardingEvent {
  const OnboardingEvent();
}

class SetDogImage extends OnboardingEvent {
  const SetDogImage({
    required this.id,
    required this.imageUrl,
    required this.breed,
    required this.size,
    required this.description,
  });

  final String id;
  final String imageUrl;
  final String breed;
  final String size;
  final String description;
}

class SetDogDetails extends OnboardingEvent {
  const SetDogDetails({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.breed,
    required this.gender,
    required this.size,
    required this.age,
    required this.isNeutered,
    required this.interests,
    required this.description,
  });

  final String id;
  final String imagePath;
  final String name;
  final String breed;
  final String gender;
  final String size;
  final int age;
  final bool isNeutered;
  final List<String> interests;
  final String description;
}
