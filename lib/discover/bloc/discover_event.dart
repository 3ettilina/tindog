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

class DogsFetched extends DiscoverEvent {
  const DogsFetched({
    required this.response,
  });

  final FetchDogsResponse response;
}
