//'Enjoys the company of people and other animals.'
//'Enjoys playing games and engaging in activities.'
//'Hesitant or nervous around new people or situations.'
//'Shows aggressive behavior towards people or other animals.'
//'Relaxed and laid-back demeanor.'
//'Shows a strong interest in exploring and discovering new things.'
//'Enjoys cuddling and being close to people.'
//'Tends to assert control over other dogs.'
//'Generally yields to other dogs and avoids confrontation.'
//'Learns quickly and enjoys mental stimulation.'
//'Prone to anxiety or nervous behaviors.'
//'Attentive and quick to notice changes in their environment.'
//'Soft and kind in behavior, especially around children or smaller animals.'
//'Highly active and requires a lot of exercise.'
//'Frequently barks or makes other noises.'

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dog_temperament_dto.g.dart';

@JsonSerializable()
class DogTemperamentDto extends Equatable {
  const DogTemperamentDto({
    required this.type,
    required this.description,
  });

  factory DogTemperamentDto.fromJson(Map<String, dynamic> json) =>
      _$DogTemperamentDtoFromJson(json);

  Object toJson() => _$DogTemperamentDtoToJson(this);

  final String type;
  final String description;

  @override
  List<Object?> get props => [type, description];
}
