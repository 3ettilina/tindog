import 'dart:async';
import 'dart:io';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tindog_repository/tindog_repository.dart';

part 'select_dog_image_event.dart';
part 'select_dog_image_state.dart';

class SelectDogImageBloc
    extends Bloc<SelectDogImageEvent, SelectDogImageState> {
  SelectDogImageBloc({
    required TindogRepository repository,
  })  : _repository = repository,
        super(const SelectDogImageInitialState()) {
    on<CheckGalleryPermission>(_onCheckGalleryAccess);
    on<RequestGalleryPermission>(_onRequestGalleryPermission);
    on<SelectDogImage>(_onSelectDogImage);

    add(const CheckGalleryPermission());

    /**
        Permission.photos
        .onGrantedCallback(() => add(const CheckGalleryPermission()))
        .onPermanentlyDeniedCallback(
        () => add(const RequestGalleryPermission()));
     **/
  }

  final TindogRepository _repository;

  Future<void> _onCheckGalleryAccess(
    CheckGalleryPermission event,
    Emitter<SelectDogImageState> emit,
  ) async {
    Permission.photos
        .onGrantedCallback(
            () => emit(const SelectDogImagePermissionGrantedState()))
        .onDeniedCallback(
            () => emit(const SelectDogImageNeedsGalleryPermissionsState()))
        .onPermanentlyDeniedCallback(
            () => const SelectDogImageNeedsGalleryPermissionsOnSettingsState());
    Permission.photos.request();
  }

  Future<void> _onRequestGalleryPermission(
    RequestGalleryPermission event,
    Emitter<SelectDogImageState> emit,
  ) async {
    await openAppSettings();
  }

  Future<void> _onSelectDogImage(
    SelectDogImage event,
    Emitter<SelectDogImageState> emit,
  ) async {
    emit(SelectDogImageAnalyzingState(image: event.image));
    final analyzeDog = await _repository.verifyDogImage(
      dogImage: event.image,
    );

    switch (analyzeDog) {
      case final AnalyzeDogDetails details:
        emit(
          SelectDogImageReadyState(
            id: details.id,
            image: event.image,
            imagePath: details.imagePath,
            breed: details.breed,
            size: details.size,
            description: details.description,
          ),
        );
      case AnalyzeDogError():
        emit(
          SelectDogImageErrorState(
            image: event.image,
            message: analyzeDog.message,
          ),
        );
      case AnalyzeDogErrorNoDogOnImage():
        emit(
          SelectDogImageErrorNotADogState(image: event.image),
        );
    }
  }
}
