import 'dart:html';

import 'package:core/entities/entities.dart';
import 'package:equatable/equatable.dart';

class Dog extends Equatable {
  const Dog({
    required this.id,
    required this.name,
    required this.breed,
    required this.gender,
    required this.age,
    required this.size,
    required this.photos,
    required this.isNeutered,
    required this.interests,
    required this.temperament,
  });

  final String id;
  final String name;
  final String breed;
  final DogGender gender;
  final int age;
  final DogSize size;
  final List<String> photos;
  final bool isNeutered;
  final List<DogInterest> interests;
  final List<DogTemperament> temperament;
  final Location location;

  @override
  List<Object?> get props => [
        id,
        name,
        breed,
        gender,
        age,
        size,
        photos,
        isNeutered,
        interests,
        temperament,
      ];
}
