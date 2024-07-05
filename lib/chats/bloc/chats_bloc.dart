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
  }

  final TindogRepository _repository;

  Future<void> _onFetchChats(ChatsEvent event, Emitter<ChatsState> emit) async {
    final chats = await _repository.fetchChats();
    // We can handle a response model/sealed class here
    emit(ChatsReady(chats: chats));
  }
}
