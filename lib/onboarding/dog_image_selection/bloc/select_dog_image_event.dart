part of 'select_dog_image_bloc.dart';

sealed class SelectDogImageEvent extends Equatable {
  const SelectDogImageEvent();
}

class CheckGalleryPermission extends SelectDogImageEvent {
  const CheckGalleryPermission();

  @override
  List<Object?> get props => [];
}

class RequestGalleryPermission extends SelectDogImageEvent {
  const RequestGalleryPermission();

  @override
  List<Object?> get props => [];
}

class SelectDogImage extends SelectDogImageEvent {
  const SelectDogImage({required this.image});

  final File image;

  @override
  List<Object?> get props => [image];
}
