// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogDto _$DogDtoFromJson(Map<String, dynamic> json) => DogDto(
      id: json['id'] as String,
      name: json['name'] as String,
      breed: json['breed'] as String,
      gender: json['gender'] as String,
      age: (json['age'] as num).toInt(),
      size: json['size'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      isNeutered: json['isNeutered'] as bool,
      interests: (json['interests'] as List<dynamic>)
          .map((e) => DogInterestDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      temperament: (json['temperament'] as List<dynamic>)
          .map((e) => DogTemperamentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DogDtoToJson(DogDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'breed': instance.breed,
      'gender': instance.gender,
      'age': instance.age,
      'size': instance.size,
      'photos': instance.photos,
      'isNeutered': instance.isNeutered,
      'interests': instance.interests,
      'temperament': instance.temperament,
    };
