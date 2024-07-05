import 'package:core/core.dart';
import 'package:tindog_data_source/dto/dog/dog_dto.dart';

extension DogDtoX on DogDto {
  Dog get dog => Dog(
        id: id,
        name: name,
        breed: breed,
        gender: DogGender.fromString(gender),
        age: Age.fromString(age),
        size: DogSize.fromName(size),
        imagePath: filePath,
        isNeutered: isNeutered,
        interests: interests,
        description: description,
        userId: userId,
        seen: seen,
        likes: likes,
      );
}

extension DogX on Dog {
  DogDto get dto => DogDto(
        id: id,
        name: name,
        breed: breed,
        gender: gender.name,
        age: age.toString(),
        size: size.name,
        isNeutered: isNeutered,
        interests: interests,
        description: description,
        userId: userId,
        filePath: imagePath,
        seen: seen,
        likes: likes,
      );
}
