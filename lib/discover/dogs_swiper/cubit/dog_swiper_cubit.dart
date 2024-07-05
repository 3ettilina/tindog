import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog_repository/tindog_repository.dart';

part 'dog_swiper_state.dart';

class DogSwiperCubit extends Cubit<DogSwiperState> {
  DogSwiperCubit({required TindogRepository tindogRepository})
      : _repository = tindogRepository,
        super(DogSwiperInitial());

  final TindogRepository _repository;

  Future<void> likeDog({required Dog myDog, required Dog dogToLike}) async {
    final response = await _repository.likeDog(
      myDog: myDog,
      dogToLike: dogToLike,
    );
    switch (response) {
      case DogsDidMatch():
        emit(DidMatch(myDog: myDog, likedDog: dogToLike));
      case DogLiked():
        emit(DogLikedSuccessfully());
      case ErrorLikingDog():
        emit(LikeDogError());
      case ChatBetweenDogsAlreadyExists():
        emit(ChatAlreadyExists());
    }
  }

  Future<void> dislikeDog({
    required Dog myDog,
    required Dog dogToDislike,
  }) async {
    final disliked = await _repository.dislikeDog(
      myDog: myDog,
      dogToDislike: dogToDislike,
    );
    if (disliked) {
      emit(DogDislikedSuccessfully());
    } else {
      emit(DislikeDogError());
    }
  }
}
