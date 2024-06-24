import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitialState()) {
    on<CheckGalleryAccess>(_onCheckGalleryAccess);
    on<RequestGalleryPermission>(_onRequestGalleryPermission);
    on<SelectDogImage>(_onSelectDogImage);
    add(CheckGalleryAccess());

    Permission.photos
        .onGrantedCallback(() => add(CheckGalleryAccess()))
        .onPermanentlyDeniedCallback(() => add(RequestGalleryPermission()));
  }

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
    emit(OnboardingImageSelectedState(image: event.image));
  }
}
