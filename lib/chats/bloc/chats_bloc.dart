import 'dart:async';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog_repository/tindog_repository.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc({required TindogRepository repo})
      : _repository = repo,
        super(const ChatsLoading()) {
    on<FetchChats>(_onFetchChats);
    on<ChatsFetched>(_onChatsFetched);
    on<SelectChat>(_onChatSelected);
  }

  final TindogRepository _repository;

  StreamSubscription<FetchChatsResponse>? _chatsSubscription;

  Future<void> _onFetchChats(ChatsEvent event, Emitter<ChatsState> emit) async {
    await _repository.fetchChats();

    _chatsSubscription?.cancel();
    _chatsSubscription = _repository.chats.listen(
        (response) => add(ChatsFetched(response: response)),
        onError: (e) => add(const ChatsFetched(
            response:
                FetchChatsError('Something went wrong while fetching chats'))));
  }

  void _onChatsFetched(
    ChatsFetched event,
    Emitter<ChatsState> emit,
  ) {
    final response = event.response;
    switch (response) {
      case FetchChatsSuccess():
        emit(ChatsReady(chats: response.chats));
      case FetchChatsError():
        emit(ChatsError(response.message));
    }
  }

  void _onChatSelected(
    SelectChat event,
    Emitter<ChatsState> emit,
  ) {
    emit(ChatSelected(event.selectedChat));
  }

  @override
  Future<void> close() {
    _chatsSubscription?.cancel();
    return super.close();
  }
}
