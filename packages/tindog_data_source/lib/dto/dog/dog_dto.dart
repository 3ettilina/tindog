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
