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
      age: json['age'] as String,
      size: json['size'] as String,
      filePath: json['filePath'] as String,
      isNeutered: json['isNeutered'] as bool,
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
      seen:
          (json['seen'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
      interests:
          (json['interests'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$DogDtoToJson(DogDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'breed': instance.breed,
      'gender': instance.gender,
      'age': instance.age,
      'size': instance.size,
      'filePath': instance.filePath,
      'isNeutered': instance.isNeutered,
      'interests': instance.interests,
      'likes': instance.likes,
      'seen': instance.seen,
      'description': instance.description,
      'userId': instance.userId,
    };
