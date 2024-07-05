import 'package:core/entities/chat/dog_chat.dart';
import 'package:core/entities/chat/initial_chat_message.dart';
import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  const Chat({
    required this.otherDog,
    required this.dogs,
    required this.userIds,
    required this.updatedAt,
    required this.initialChatMessage,
  });

  final DogChat otherDog;
  final List<DogChat> dogs;
  final List<String> userIds;
  final DateTime updatedAt;
  final InitialChatMessage initialChatMessage;

  // TODO(3ettilina): Add messages

  @override
  List<Object?> get props => [
        otherDog,
        dogs,
        userIds,
        updatedAt,
        initialChatMessage,
      ];
}
