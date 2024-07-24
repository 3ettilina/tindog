import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog_repository/tindog_repository.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc({required TindogRepository repository})
      : _repository = repository,
        swiperController = AppCardSwiperController(),
        super(const DiscoverFetchingDogsState()) {
    on<FetchDogs>(_onFetchDogs);
    on<DogsFetched>(_onDogsFetched);
  }

  final TindogRepository _repository;

  StreamSubscription<FetchDogsResponse>? _dogsSubscription;
  AppCardSwiperController swiperController;

  Future<void> _onFetchDogs(
    FetchDogs event,
    Emitter<DiscoverState> emit,
  ) async {
    //emit(const DiscoverFetchingDogsState());
    await _repository.fetchDogs();

    _dogsSubscription?.cancel();
    _dogsSubscription = _repository.dogs.listen(
      (response) => add(DogsFetched(response: response)),
      onError: (e) => emit(
        const DiscoverErrorFetchingDogsState(
          'Something went wrong while fetching dogs',
        ),
      ),
    );
  }

  void _onDogsFetched(
    DogsFetched event,
    Emitter<DiscoverState> emit,
  ) {
    final response = event.response;
    switch (response) {
      case FetchDogsSuccess():
        emit(DiscoverReadyState(dogs: response.dogs));
      case FetchDogsError():
        emit(DiscoverErrorFetchingDogsState(response.message));
    }
  }

  @override
  Future<void> close() {
    _dogsSubscription?.cancel();
    swiperController.dispose();
    return super.close();
  }
}
