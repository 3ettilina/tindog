import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dog_chat_dto.g.dart';

@JsonSerializable()
class DogChatDto extends Equatable {
  DogChatDto({
    required this.dogId,
    required this.userId,
    required this.name,
  });

  factory DogChatDto.fromJson(Map<String, dynamic> json) =>
      _$DogChatDtoFromJson(json);

  Object toJson() => _$DogChatDtoToJson(this);

  final String dogId;
  final String userId;
  final String name;

  String get thumbnailUrl {
    final baseUrl =
        'https://storage.googleapis.com/tindog-4edd4.appspot.com/dogs%2Fthumbnails%2F';
    final thumbUrl = '$baseUrl${dogId}_200x200.jpeg';
    print('---- THUMBNAIL URL: $thumbUrl');
    return thumbUrl;
  }

  @override
  List<Object?> get props => [dogId, userId, name, thumbnailUrl];
}
