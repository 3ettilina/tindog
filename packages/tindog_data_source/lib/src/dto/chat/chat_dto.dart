import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tindog_data_source/src/dto/dto.dart';
import 'package:tindog_data_source/src/dto/timestamp_converter.dart';

part 'chat_dto.g.dart';

@JsonSerializable(explicitToJson: true)
@TimestampConverter()
class ChatDto extends Equatable {
  const ChatDto({
    required this.id,
    required this.dogs,
    required this.initialMessage,
    required this.lastMessage,
    required this.userIds,
    required this.updatedAt,
    this.messages = const <UserMessageChatDto>[],
  });

  factory ChatDto.fromJson(Map<String, dynamic> json) =>
      _$ChatDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChatDtoToJson(this);

  final String id;
  final List<UserMessageChatDto> messages;
  final List<DogChatDto> dogs;
  final InitialMessageChatDto initialMessage;
  final UserMessageChatDto? lastMessage;
  final List<String> userIds;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        messages,
        dogs,
        initialMessage,
        lastMessage,
        userIds,
        updatedAt,
      ];
}
