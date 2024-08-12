part of 'chat_details_bloc.dart';

sealed class ChatDetailsEvent {
  const ChatDetailsEvent();
}

class FetchChat extends ChatDetailsEvent {
  const FetchChat({required this.chatId});

  final String chatId;
}

class ChatFetched extends ChatDetailsEvent {
  const ChatFetched({required this.response});

  final SingleChatResponse response;
}

class SendMessage extends ChatDetailsEvent {
  const SendMessage(this.message);

  final UserMessageChat message;
}
