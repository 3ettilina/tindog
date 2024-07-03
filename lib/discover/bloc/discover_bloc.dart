import 'dart:async';

import 'package:app_ui/cards/card_swiper/app_card_swiper_controller.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog_repository/tindog_repository.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc({required TindogRepository repository})
      : _repository = repository,
        super(const DiscoverFetchingDogsState()) {
    on<FetchDogs>(_onFetchDogs);
    on<LikeDog>(_onLikeDog);
    on<DislikeDog>(_onDislikeDog);
  }

  final TindogRepository _repository;

  Future<void> _onFetchDogs(
    FetchDogs event,
    Emitter<DiscoverState> emit,
  ) async {
    _repository.fetchDogs(myDog: event.myDog).listen((response) {
      switch (response) {
        case FetchDogsSuccess():
          emit(DiscoverReadyState(dogs: response.dogs));
        case FetchDogsError():
          emit(DiscoverErrorFetchingDogsState(response.message));
      }
    });
  }

  Future<void> _onLikeDog(
    LikeDog event,
    Emitter<DiscoverState> emit,
  ) =>
      _repository.likeDog(
        myDog: event.myDog,
        dogToLike: event.dogToLike,
      );

  Future<void> _onDislikeDog(
    DislikeDog event,
    Emitter<DiscoverState> emit,
  ) =>
      _repository.dislikeDog(
        myDog: event.myDog,
        dogToDislike: event.dogToDislike,
      );
}
