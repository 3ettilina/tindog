import 'package:equatable/equatable.dart';

sealed class CreateDogProfileResponse extends Equatable {
  const CreateDogProfileResponse();
}

class CreateDogProfileSuccess extends CreateDogProfileResponse {
  const CreateDogProfileSuccess();

  @override
  List<Object?> get props => [];
}

class CreateDogProfileError extends CreateDogProfileResponse {
  const CreateDogProfileError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
