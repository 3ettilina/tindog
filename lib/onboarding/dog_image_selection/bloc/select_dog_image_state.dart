part of 'select_dog_image_bloc.dart';

sealed class SelectDogImageState extends Equatable {
  const SelectDogImageState();

  bool get isContinueAllowed => this is SelectDogImageReadyState;
}

class SelectDogImageInitialState extends SelectDogImageState {
  const SelectDogImageInitialState();

  @override
  List<Object?> get props => [];
}

class SelectDogImageNeedsGalleryPermissionsState extends SelectDogImageState {
  const SelectDogImageNeedsGalleryPermissionsState();

  @override
  List<Object?> get props => [];
}

class SelectDogImageNeedsGalleryPermissionsOnSettingsState
    extends SelectDogImageState {
  const SelectDogImageNeedsGalleryPermissionsOnSettingsState();

  @override
  List<Object?> get props => [];
}

class SelectDogImagePermissionGrantedState extends SelectDogImageState {
  const SelectDogImagePermissionGrantedState();

  @override
  List<Object?> get props => [];
}

class SelectDogImageSelectingState extends SelectDogImageState {
  const SelectDogImageSelectingState();

  @override
  List<Object?> get props => [];
}

class SelectDogImageAnalyzingState extends SelectDogImageState {
  const SelectDogImageAnalyzingState({required this.image});

  final File image;

  @override
  List<Object?> get props => [];
}

class SelectDogImageReadyState extends SelectDogImageState {
  const SelectDogImageReadyState({
    required this.id,
    required this.image,
    required this.imagePath,
    required this.breed,
    required this.size,
    required this.description,
  });

  final String id;
  final File image;
  final String imagePath;
  final String breed;
  final DogSize size;
  final String description;

  @override
  List<Object?> get props => [
        id,
        image,
        imagePath,
        breed,
        size,
        description,
      ];
}

class SelectDogImageErrorNotADogState extends SelectDogImageState {
  const SelectDogImageErrorNotADogState({required this.image});

  final File image;

  @override
  List<Object?> get props => [image];
}

class SelectDogImageErrorState extends SelectDogImageState {
  const SelectDogImageErrorState({required this.image, required this.message});

  final File image;
  final String message;

  @override
  List<Object?> get props => [image, message];
}
