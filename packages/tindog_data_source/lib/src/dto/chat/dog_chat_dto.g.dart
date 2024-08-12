// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogChatDto _$DogChatDtoFromJson(Map<String, dynamic> json) => DogChatDto(
      dogId: json['dogId'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$DogChatDtoToJson(DogChatDto instance) =>
    <String, dynamic>{
      'dogId': instance.dogId,
      'userId': instance.userId,
      'name': instance.name,
      'thumbnailUrl': instance.thumbnailUrl,
    };
