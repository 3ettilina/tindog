part of 'chats_bloc.dart';

sealed class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object?> get props => [];
}

class ChatsLoading extends ChatsState {
  const ChatsLoading();
}

class ChatsReady extends ChatsState {
  const ChatsReady({
    required this.chats,
  });

  final List<Chat> chats;

  @override
  List<Object?> get props => [chats];
}

class ChatsError extends ChatsState {
  const ChatsError();
}
