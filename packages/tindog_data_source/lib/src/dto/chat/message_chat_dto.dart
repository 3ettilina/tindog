import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tindog_data_source/src/dto/timestamp_converter.dart';

part 'message_chat_dto.g.dart';

@JsonSerializable()
@TimestampConverter()
class InitialMessageChatDto extends Equatable {
  InitialMessageChatDto({
    required this.text,
    required this.timestamp,
    required this.readBy,
  });

  factory InitialMessageChatDto.fromJson(Map<String, dynamic> json) =>
      _$InitialMessageChatDtoFromJson(json);

  Map<String, dynamic> toJson() => _$InitialMessageChatDtoToJson(this);

  final DateTime timestamp;
  final String text;
  final List<String> readBy;

  @override
  List<Object?> get props => [timestamp, text, readBy];
}

@JsonSerializable()
@TimestampConverter()
class UserMessageChatDto extends Equatable {
  UserMessageChatDto({
    required this.timestamp,
    required this.text,
    required this.isRead,
    required this.userId,
  });

  factory UserMessageChatDto.fromJson(Map<String, dynamic> json) =>
      _$UserMessageChatDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserMessageChatDtoToJson(this);

  final DateTime timestamp;
  final String text;
  final bool isRead;
  final String userId;

  @override
  List<Object?> get props => [timestamp, text, isRead, userId];
}