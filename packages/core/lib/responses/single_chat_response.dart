import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

sealed class SingleChatResponse extends Equatable {
  const SingleChatResponse();
}

class SingleChatSuccess extends SingleChatResponse {
  const SingleChatSuccess(this.chat);

  final Chat chat;

  @override
  List<Object?> get props => [chat];
}

class SingleChatError extends SingleChatResponse {
  const SingleChatError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
