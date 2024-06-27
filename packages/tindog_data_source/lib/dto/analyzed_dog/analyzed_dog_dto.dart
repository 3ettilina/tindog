import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AnalyzedDogDto extends Equatable {
  const AnalyzedDogDto({
    required this.breed,
    required this.size,
    required this.description,
    required this.filePath,
  });

  factory AnalyzedDogDto.fromJson(Map<String, dynamic> json) {
    final breed = json['breed'] as String;
    final size = json['size'] as String;
    final description = json['description'] as String;
    final filePath = json['filePath'] as String;
    return AnalyzedDogDto(
      breed: breed,
      size: size,
      description: description,
      filePath: filePath,
    );
  }

  final String breed;
  final String size;
  final String description;
  final String filePath;

  @override
  List<Object?> get props => [breed, size, description, filePath];
}
