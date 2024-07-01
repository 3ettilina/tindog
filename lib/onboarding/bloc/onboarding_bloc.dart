import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingDogImageStepState()) {
    on<SetDogImage>(_onSetDogImage);
    on<SetDogDetails>(_onSetDogDetails);
  }

  void _onSetDogImage(
    SetDogImage event,
    Emitter<OnboardingState> emit,
  ) {
    emit(
      OnboardingDogDetailsState(
        id: event.id,
        imagePath: event.imageUrl,
        breed: event.breed,
        size: event.size,
        description: event.description,
      ),
    );
  }

  void _onSetDogDetails(
    SetDogDetails event,
    Emitter<OnboardingState> emit,
  ) {
    emit(
      OnboardingDogCompletedState(
        id: event.id,
        imagePath: event.imagePath,
        name: event.name,
        breed: event.breed,
        gender: event.gender,
        age: event.age,
        isNeutered: event.isNeutered,
        interests: event.interests,
        description: event.description,
      ),
    );
  }
}
