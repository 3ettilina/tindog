//'Dogs that enjoy going for a relaxed walk and sniff around.'
//'Dogs that have fun playing with other dogs or people.'
//'Dogs of the same breed might enjoy meeting others that are similar to them.'
//'Some dogs love water and might enjoy meeting other dogs for swimming sessions.'
//'Dogs that enjoy outdoor adventures could go on hikes with other dogs.'
//'Activities like flyball or frisbee can be great for high-energy dogs.'
//'Older dogs that prefer a calmer environment might enjoy meeting other senior dogs.'
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dog_temperament_dto.g.dart';

@JsonSerializable()
class DogInterestDto extends Equatable {
  const DogInterestDto({
    required this.type,
    required this.description,
  });

  factory DogInterestDto.fromJson(Map<String, dynamic> json) =>
      _$DogInterestDtoFromJson(json);

  Object toJson() => _$DogInterestDtoToJson(this);

  final String type;
  final String description;

  @override
  List<Object?> get props => [type, description];
}
