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
    required this.imagePath,
    required this.isNeutered,
    required this.interests,
    required this.description,
    required this.userId,
    this.seen = const <String>[],
    this.likes = const <String>[],
  });

  final String id;
  final String name;
  final String breed;
  final DogGender gender;
  final Age age;
  final DogSize size;
  final String imagePath;
  final bool isNeutered;
  final List<String> interests;
  final List<String> seen;
  final List<String> likes;
  final String description;
  final String userId;

  @override
  List<Object?> get props => [
        id,
        name,
        breed,
        gender,
        age,
        size,
        imagePath,
        isNeutered,
        interests,
        description,
        userId,
        seen,
        likes,
      ];
}
