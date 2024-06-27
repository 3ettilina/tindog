import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dog_chat_dto.g.dart';

@JsonSerializable()
class DogChatDto extends Equatable {
  DogChatDto({
    required this.dogId,
    required this.userId,
    required this.name,
    required this.thumbnailUrl,
  });

  factory DogChatDto.fromJson(Map<String, dynamic> json) =>
      _$DogChatDtoFromJson(json);

  Object toJson() => _$DogChatDtoToJson(this);

  final String dogId;
  final String userId;
  final String name;
  final String thumbnailUrl;

  @override
  List<Object?> get props => [dogId, userId, name, thumbnailUrl];
}
