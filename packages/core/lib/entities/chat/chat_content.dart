import 'package:core/entities/chat/chat_message.dart';
import 'package:core/entities/chat/dog_chat.dart';
import 'package:core/extensions/date_time_extensions.dart';
import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  const Chat({
    required this.id,
    required this.otherDog,
    required this.userIds,
    required this.updatedAt,
    required this.initialChatMessage,
    required this.latestMessage,
  });

  final String id;
  final DogChat otherDog;
  final List<String> userIds;
  final DateTime updatedAt;
  final InitialChatMessage initialChatMessage;
  final UserMessageChat? latestMessage;

  String get updatedAtTime => updatedAt.timeHm;

  // TODO(3ettilina): Add messages

  @override
  List<Object?> get props => [
        id,
        otherDog,
        userIds,
        updatedAt,
        initialChatMessage,
        latestMessage,
      ];
}
