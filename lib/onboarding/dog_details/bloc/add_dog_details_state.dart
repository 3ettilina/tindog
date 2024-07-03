part of 'add_dog_details_cubit.dart';

sealed class AddDogDetailsState extends Equatable {
  const AddDogDetailsState({
    this.id,
    this.imagePath,
    this.breed,
    this.size,
    this.description,
    this.gender,
    this.name,
    this.age = const Age(unit: AgeUnit.years),
    this.isNeutered = true,
    this.interests = const [],
    this.userId,
  });

  final String? id;
  final String? imagePath;
  final String? name;
  final DogGender? gender;
  final DogSize? size;
  final String? breed;
  final Age? age;
  final bool? isNeutered;
  final List<String>? interests;
  final String? description;
  final String? userId;

  bool get isValid =>
      name.isNotNullOrEmpty &&
      gender != null &&
      breed.isNotNullOrEmpty &&
      age != null &&
      description.isNotNullOrEmpty &&
      interests != null &&
      interests!.isNotEmpty;

  @override
  List<Object?> get props => [
        id,
        imagePath,
        name,
        gender,
        breed,
        age,
        isNeutered,
        interests,
        description,
        userId,
      ];
}

class DogDetailsInitial extends AddDogDetailsState {
  const DogDetailsInitial();

  @override
  List<Object?> get props => [];
}

class DogDetailsEditing extends AddDogDetailsState {
  const DogDetailsEditing({
    required super.id,
    required super.imagePath,
    required super.breed,
    required super.size,
    required super.description,
    super.name,
    super.gender,
    super.age,
    super.isNeutered,
    super.interests,
  });

  DogDetailsEditing copyWith({
    String? name,
    DogGender? gender,
    DogSize? size,
    String? breed,
    Age? age,
    bool? isNeutered,
    List<String>? interests,
    String? description,
  }) {
    return DogDetailsEditing(
      id: id,
      imagePath: imagePath,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      size: size ?? this.size,
      breed: breed ?? this.breed,
      age: age ?? this.age,
      isNeutered: isNeutered ?? this.isNeutered,
      interests: interests ?? this.interests,
      description: description ?? this.description,
    );
  }
}

class DogDetailsSubmitting extends AddDogDetailsState {
  const DogDetailsSubmitting({
    required super.id,
    required super.imagePath,
    required super.breed,
    required super.size,
    required super.description,
    required super.userId,
    super.gender,
    super.name,
    super.age = const Age(unit: AgeUnit.years),
    super.isNeutered = true,
    super.interests = const [],
  });
}

class DogDetailsCompleted extends AddDogDetailsState {
  const DogDetailsCompleted({required this.dog});

  final Dog dog;

  @override
  List<Object?> get props => [dog];
}

class DogDetailsErrorSubmitting extends AddDogDetailsState {
  const DogDetailsErrorSubmitting({
    required super.id,
    required super.imagePath,
    required super.breed,
    required super.size,
    required super.description,
    required super.gender,
    required super.name,
    required super.age,
    required super.isNeutered,
    required super.interests,
    required super.userId,
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [
        ...super.props,
        message,
      ];
}
