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
    required this.breed,
    required this.size,
    required this.description,
  });

  final String breed;
  final String size;
  final String description;

  @override
  List<Object?> get props => [breed, size, description];
}
