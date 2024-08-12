import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

sealed class FetchChatsResponse extends Equatable {
  const FetchChatsResponse();
}

class FetchChatsSuccess extends FetchChatsResponse {
  const FetchChatsSuccess(this.chats);

  final List<Chat> chats;

  @override
  List<Object?> get props => [chats];
}

class FetchChatsError extends FetchChatsResponse {
  const FetchChatsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
