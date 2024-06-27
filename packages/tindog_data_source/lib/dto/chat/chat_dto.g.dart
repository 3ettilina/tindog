// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatDto _$ChatDtoFromJson(Map<String, dynamic> json) => ChatDto(
      messages: (json['messages'] as List<dynamic>?)
              ?.map(
                  (e) => UserMessageChatDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <UserMessageChatDto>[],
      dogs: (json['dogs'] as List<dynamic>)
          .map((e) => DogChatDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      initialMessage: InitialMessageChatDto.fromJson(
          json['initialMessage'] as Map<String, dynamic>),
      lastMessage: UserMessageChatDto.fromJson(
          json['lastMessage'] as Map<String, dynamic>),
      userIds:
          (json['userIds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ChatDtoToJson(ChatDto instance) => <String, dynamic>{
      'messages': instance.messages.map((e) => e.toJson()).toList(),
      'dogs': instance.dogs.map((e) => e.toJson()).toList(),
      'initialMessage': instance.initialMessage.toJson(),
      'lastMessage': instance.lastMessage.toJson(),
      'userIds': instance.userIds,
    };
