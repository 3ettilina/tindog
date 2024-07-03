part of 'discover_bloc.dart';

sealed class DiscoverEvent {
  const DiscoverEvent();
}

class FetchDogs extends DiscoverEvent {
  const FetchDogs({
    required this.myDog,
  });

  final Dog myDog;
}

class LikeDog extends DiscoverEvent {
  const LikeDog({
    required this.myDog,
    required this.dogToLike,
  });

  final Dog myDog;
  final Dog dogToLike;
}

class DislikeDog extends DiscoverEvent {
  const DislikeDog({
    required this.myDog,
    required this.dogToDislike,
  });

  final Dog myDog;
  final Dog dogToDislike;
}
