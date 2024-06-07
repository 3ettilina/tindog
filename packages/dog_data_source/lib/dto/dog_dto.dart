import 'package:dog_data_source/dto/dto.dart';
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
    required this.photos,
    required this.isNeutered,
    required this.interests,
    required this.temperament,
  });

  factory DogDto.fromJson(Map<String, dynamic> json) => _$DogDtoFromJson(this);

  Object toJson() => _$DogDtoToJson(this);

  final String id;
  final String name;
  final String breed;
  final String gender;
  final int age;
  final String size;
  final List<String> photos;
  final bool isNeutered;
  final List<DogInterestDto> interests;
  final List<DogTemperamentDto> temperament;

  @override
  List<Object?> get props => [
        id,
        name,
        breed,
        gender,
        age,
        size,
        photos,
        isNeutered,
        interests,
        temperament,
      ];
}
