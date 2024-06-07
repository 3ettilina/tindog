import 'package:equatable/equatable.dart';

enum DogTemperamentType {
  friendly(),
  playful(),
  shy(),
  aggressive(),
  calm(),
  curious(),
  affectionate(),
  dominant(),
  submissive(),
  intelligent(),
  anxious(),
  alert(),
  gentle(),
  energetic(),
  vocal();
}

class DogTemperament extends Equatable {
  const DogTemperament({
    required this.type,
    required this.description,
  });

  final DogTemperamentType type;
  final String description;

  @override
  List<Object?> get props => [type, description];
}
