// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitialMessageChatDto _$InitialMessageChatDtoFromJson(
        Map<String, dynamic> json) =>
    InitialMessageChatDto(
      text: json['text'] as String,
      timestamp:
          const TimestampConverter().fromJson(json['timestamp'] as Timestamp),
      readBy:
          (json['readBy'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$InitialMessageChatDtoToJson(
        InitialMessageChatDto instance) =>
    <String, dynamic>{
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
      'text': instance.text,
      'readBy': instance.readBy,
    };

UserMessageChatDto _$UserMessageChatDtoFromJson(Map<String, dynamic> json) =>
    UserMessageChatDto(
      timestamp:
          const TimestampConverter().fromJson(json['timestamp'] as Timestamp),
      text: json['text'] as String,
      isRead: json['isRead'] as bool,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$UserMessageChatDtoToJson(UserMessageChatDto instance) =>
    <String, dynamic>{
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
      'text': instance.text,
      'isRead': instance.isRead,
      'userId': instance.userId,
    };
