part of 'chat_details_bloc.dart';

sealed class ChatDetailsState extends Equatable {
  const ChatDetailsState();

  @override
  List<Object?> get props => [];
}

class ChatDetailsInitialState extends ChatDetailsState {
  const ChatDetailsInitialState();
}

class ChatDetailsLoadingState extends ChatDetailsState {
  const ChatDetailsLoadingState({required this.chatId});

  final String chatId;

  @override
  List<Object?> get props => [chatId];
}

class ChatDetailsReadyState extends ChatDetailsState {
  const ChatDetailsReadyState({
    required this.chat,
  });

  final Chat chat;

  @override
  List<Object?> get props => [chat];
}

class ChatDetailsSendingMessageState extends ChatDetailsState {
  const ChatDetailsSendingMessageState({
    required this.message,
    required this.chats,
  });

  final UserMessageChat message;
  final List<Chat> chats;

  @override
  List<Object?> get props => [message, chats];
}

class ChatDetailsErrorState extends ChatDetailsState {
  const ChatDetailsErrorState(this.errorMessage);

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
