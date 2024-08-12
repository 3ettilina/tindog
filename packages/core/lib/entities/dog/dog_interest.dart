import 'package:equatable/equatable.dart';

enum DogInterestType {
  walking(),
  playing(),
  breeding(),
  swimming(),
  hiking(),
  playingFetch(),
  seniorDogGathering();
}

class DogInterest extends Equatable {
  const DogInterest({
    required this.type,
    required this.description,
  });

  final DogInterestType type;
  final String description;

  @override
  List<Object?> get props => [type, description];
}
