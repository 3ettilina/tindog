import 'dart:io';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tindog_repository/tindog_repository.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({required TindogRepository repository})
      : _repository = repository,
        super(OnboardingInitialState()) {
    on<CheckGalleryAccess>(_onCheckGalleryAccess);
    on<RequestGalleryPermission>(_onRequestGalleryPermission);
    on<SelectDogImage>(_onSelectDogImage);
    add(CheckGalleryAccess());

    Permission.photos
        .onGrantedCallback(() => add(CheckGalleryAccess()))
        .onPermanentlyDeniedCallback(() => add(RequestGalleryPermission()));
  }

  final TindogRepository _repository;

  Future<void> _onCheckGalleryAccess(
    CheckGalleryAccess event,
    Emitter<OnboardingState> emit,
  ) async {
    if (await Permission.photos.request().isGranted) {
      emit(OnboardingGalleryAccessGrantedState());
    } else if (await Permission.photos.isPermanentlyDenied) {
      emit(OnboardingNeedsGalleryPermissionOnSettingsState());
    } else {
      emit(OnboardingNeedsGalleryPermissionState());
    }
  }

  Future<void> _onRequestGalleryPermission(
    RequestGalleryPermission event,
    Emitter<OnboardingState> emit,
  ) async {
    await openAppSettings();
  }

  Future<void> _onSelectDogImage(
    SelectDogImage event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(OnboardingImageAnalyzingState(image: event.image));
    final analyzeDog = await _repository.verifyDogImage(
      dogImage: event.image,
    );

    switch (analyzeDog) {
      case AnalyzeDogDetails():
        emit(OnboardingImageReadyState(image: event.image));
      case AnalyzeDogError():
        emit(OnboardingImageErrorState(
          image: event.image,
          message: analyzeDog.message,
        ));
      case AnalyzeDogErrorNoDogOnImage():
        emit(
          OnboardingImageIsNotADogState(
              image: event.image,
              message:
                  'Ups! Seems the image you uploaded is not from a dog. Please check :),'),
        );
    }
  }
}
