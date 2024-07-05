import 'package:equatable/equatable.dart';

class DogChat extends Equatable {
  const DogChat({
    required this.dogId,
    required this.name,
    required this.thumbnailUrl,
    required this.userId,
  });

  final String dogId;
  final String name;
  final String thumbnailUrl;
  final String userId;

  @override
  List<Object?> get props => [dogId, name, thumbnailUrl, userId];
}
