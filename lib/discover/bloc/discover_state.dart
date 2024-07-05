part of 'discover_bloc.dart';

sealed class DiscoverState extends Equatable {
  const DiscoverState();
}

class DiscoverFetchingDogsState extends DiscoverState {
  const DiscoverFetchingDogsState();

  @override
  List<Object?> get props => [];
}

class DiscoverReadyState extends DiscoverState {
  const DiscoverReadyState({required this.dogs, this.swiperController});

  final List<Dog> dogs;
  final AppCardSwiperController? swiperController;

  @override
  List<Object?> get props => [dogs, swiperController];
}

class DiscoverDogsDidMatchState extends DiscoverState {
  const DiscoverDogsDidMatchState({
    required this.myDog,
    required this.likedDog,
    required this.dogs, 
    this.swiperController,
    });

  final Dog myDog;
  final Dog likedDog;
  final List<Dog> dogs;
  final AppCardSwiperController? swiperController;

  @override
  List<Object?> get props => [myDog, likedDog, dogs, swiperController];
}

class DiscoverErrorFetchingDogsState extends DiscoverState {
  const DiscoverErrorFetchingDogsState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
