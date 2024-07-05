part of 'dog_swiper_cubit.dart';

sealed class DogSwiperState extends Equatable {
  const DogSwiperState();

  @override
  List<Object> get props => [];
}

class DogSwiperInitial extends DogSwiperState {}

class DogLikedSuccessfully extends DogSwiperState {}

class DogDislikedSuccessfully extends DogSwiperState {}

class DidMatch extends DogSwiperState {
  const DidMatch({
    required this.myDog,
    required this.likedDog,
  });

  final Dog myDog;
  final Dog likedDog;

  @override
  List<Object> get props => [myDog, likedDog];
}

class LikeDogError extends DogSwiperState {}

class DislikeDogError extends DogSwiperState {}

class ChatAlreadyExists extends DogSwiperState {}