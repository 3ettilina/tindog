import 'dart:async';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog_repository/tindog_repository.dart';

part 'chat_details_event.dart';
part 'chat_details_state.dart';

class ChatDetailsBloc extends Bloc<ChatDetailsEvent, ChatDetailsState> {
  ChatDetailsBloc({
    required TindogRepository repo,
  })  : _repository = repo,
        super(const ChatDetailsInitialState()) {
    on<FetchChat>(_onFetchChat);
    on<ChatFetched>(_onChatFetched);
  }

  final TindogRepository _repository;

  StreamSubscription<SingleChatResponse>? _chatSubscription;

  void _onFetchChat(
    FetchChat event,
    Emitter<ChatDetailsState> emit,
  ) {
    emit(ChatDetailsLoadingState(chatId: event.chatId));
    _chatSubscription?.cancel();
    _chatSubscription = _repository.chat.listen(
        (response) => add(ChatFetched(response: response)),
        onError: (e) => add(const ChatFetched(
            response:
                SingleChatError('Something went wrong while fetching chats'))));
  }

  void _onChatFetched(
    ChatFetched event,
    Emitter<ChatDetailsState> emit,
  ) {
    final response = event.response;
    switch (response) {
      case SingleChatSuccess():
        emit(ChatDetailsReadyState(chat: response.chat));
      case SingleChatError():
        emit(ChatDetailsErrorState(response.message));
    }
  }
}
