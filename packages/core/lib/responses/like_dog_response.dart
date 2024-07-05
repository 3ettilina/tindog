import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

sealed class LikeDogResponse extends Equatable {
  const LikeDogResponse();

  @override
  List<Object?> get props => [];
}

class DogsDidMatch extends LikeDogResponse {
  const DogsDidMatch({
    required this.myDog,
    required this.likedDog,
  });

  final Dog myDog;
  final Dog likedDog;
  
  @override
  List<Object?> get props => [myDog, likedDog];
}

class DogLiked extends LikeDogResponse {
  const DogLiked();
}

class ErrorLikingDog extends LikeDogResponse {
  const ErrorLikingDog();
}

class ChatBetweenDogsAlreadyExists extends LikeDogResponse {
  const ChatBetweenDogsAlreadyExists();
}