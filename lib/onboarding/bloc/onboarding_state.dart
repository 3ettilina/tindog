part of 'onboarding_bloc.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object?> get props => [];
}

class OnboardingDogImageStepState extends OnboardingState {
  const OnboardingDogImageStepState();
}

class OnboardingDogDetailsState extends OnboardingState {
  const OnboardingDogDetailsState({
    required this.id,
    required this.imagePath,
    required this.breed,
    required this.size,
    required this.description,
  });

  final String id;
  final String imagePath;
  final String breed;
  final String size;
  final String description;

  @override
  List<Object?> get props => [id, imagePath, breed, size, description];
}

class OnboardingDogCompletedState extends OnboardingState {
  const OnboardingDogCompletedState({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.breed,
    required this.gender,
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
  final int age;
  final bool isNeutered;
  final List<String> interests;
  final String description;

  @override
  List<Object?> get props => [
        id,
        imagePath,
        name,
        breed,
        gender,
        age,
        isNeutered,
        interests,
        description,
      ];
}
