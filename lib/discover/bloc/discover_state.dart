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

class DiscoverErrorFetchingDogsState extends DiscoverState {
  const DiscoverErrorFetchingDogsState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
