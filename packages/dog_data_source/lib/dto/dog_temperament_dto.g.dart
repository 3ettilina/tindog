// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_temperament_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogTemperamentDto _$DogTemperamentDtoFromJson(Map<String, dynamic> json) =>
    DogTemperamentDto(
      type: json['type'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$DogTemperamentDtoToJson(DogTemperamentDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'description': instance.description,
    };
