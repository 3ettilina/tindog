import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

sealed class AnalyzeDogResult extends Equatable {
  const AnalyzeDogResult();

  @override
  List<Object?> get props => [];
}

class AnalyzeDogErrorNoDogOnImage extends AnalyzeDogResult {
  const AnalyzeDogErrorNoDogOnImage({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class AnalyzeDogError extends AnalyzeDogResult {
  const AnalyzeDogError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class AnalyzeDogDetails extends AnalyzeDogResult {
  const AnalyzeDogDetails({
    required this.id,
    required this.imagePath,
    required this.breed,
    required this.size,
    required this.description,
  });

  final String id;
  final String imagePath;
  final String breed;
  final DogSize size;
  final String description;

  @override
  List<Object?> get props => [id, imagePath, breed, size, description];
}
