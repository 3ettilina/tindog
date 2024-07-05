import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dog_dto.g.dart';

@JsonSerializable()
class DogDto extends Equatable {
  const DogDto({
    required this.id,
    required this.name,
    required this.breed,
    required this.gender,
    required this.age,
    required this.size,
    required this.filePath,
    required this.isNeutered,
    this.likes = const <String>[],
    this.seen = const <String>[],
    required this.interests,
    required this.description,
    required this.userId,
  });

  factory DogDto.fromJson(Map<String, dynamic> json) => _$DogDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DogDtoToJson(this);

  factory DogDto.fromFirebaseCallable(Map<Object?, Object?> firebaseJson) {
    final id = firebaseJson['id'] as String;
    final name = firebaseJson['name'] as String;
    final breed = firebaseJson['breed'] as String;
    final gender = firebaseJson['gender'] as String;
    final age = firebaseJson['age'] as String;
    final size = firebaseJson['size'] as String;
    final filePath = firebaseJson['filePath'] as String;
    final isNeutered = firebaseJson['isNeutered'] as bool;
    final interestsDynamic = firebaseJson['interests'] as List<Object?>;
    final description = firebaseJson['description'] as String;
    final userId = firebaseJson['userId'] as String;

    final interests = interestsDynamic.map((e) => e?.toString() ?? '').toList();

    return DogDto(
      id: id,
      name: name,
      breed: breed,
      gender: gender,
      age: age,
      size: size,
      filePath: filePath,
      isNeutered: isNeutered,
      interests: interests,
      description: description,
      userId: userId,
    );
  }

  @JsonKey(includeToJson: false)
  final String id;
  final String name;
  final String breed;
  final String gender;
  final String age;
  final String size;
  final String filePath;
  final bool isNeutered;
  final List<String> interests;
  final List<String> likes;
  final List<String> seen;
  final String description;
  final String userId;

  @override
  List<Object?> get props => [
        id,
        name,
        breed,
        gender,
        age,
        size,
        filePath,
        likes,
        seen,
        isNeutered,
        interests,
        description,
        userId,
      ];
}
