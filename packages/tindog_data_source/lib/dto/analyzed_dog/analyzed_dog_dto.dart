import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AnalyzedDogDto extends Equatable {
  const AnalyzedDogDto({
    required this.id,
    required this.breed,
    required this.size,
    required this.description,
    required this.filePath,
  });

  factory AnalyzedDogDto.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String;
    final breed = json['breed'] as String;
    final size = json['size'] as String;
    final description = json['description'] as String;
    final filePath = json['filePath'] as String;
    return AnalyzedDogDto(
      id: id,
      breed: breed,
      size: size,
      description: description,
      filePath: filePath,
    );
  }

  final String id;
  final String breed;
  final String size;
  final String description;
  final String filePath;

  @override
  List<Object?> get props => [id, breed, size, description, filePath];
}
