import 'package:core/core.dart';
import 'package:tindog_data_source/tindog_data_source.dart';

extension ChatDtoX on ChatDto {
  Chat toChat({required String userId}) {
    final otherDogDto = dogs.firstWhere((dog) => dog.userId != userId);
    return Chat(
      otherDog: otherDogDto.dogChat,
      userIds: userIds,
      updatedAt: updatedAt,
      initialChatMessage: initialMessage.chatMessage,
      latestMessage: lastMessage?.chatMessage,
    );
  }
}

extension DogChatDtoX on DogChatDto {
  DogChat get dogChat {
    return DogChat(
      dogId: dogId,
      name: name,
      thumbnailUrl: thumbnailUrl,
      userId: userId,
    );
  }
}

extension InitialMessageChatDtoX on InitialMessageChatDto {
  InitialChatMessage get chatMessage {
    return InitialChatMessage(
      readBy: readBy,
      text: text,
      timestamp: timestamp,
    );
  }
}

extension UserMessageChatDtoX on UserMessageChatDto {
  UserMessageChat get chatMessage {
    return UserMessageChat(
      timestamp: timestamp,
      text: text,
      isRead: isRead,
      userId: userId,
    );
  }
}
