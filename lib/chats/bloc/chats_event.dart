part of 'chats_bloc.dart';

sealed class ChatsEvent {
  const ChatsEvent();
}

class FetchChats extends ChatsEvent {
  const FetchChats();
}

class ChatsFetched extends ChatsEvent {
  const ChatsFetched({required this.response});

  final FetchChatsResponse response;
}

class SelectChat extends ChatsEvent {
  const SelectChat({required this.selectedChat});

  final Chat selectedChat;
}
