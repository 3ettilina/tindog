import 'package:core/core.dart';
import 'package:tindog_data_source/tindog_data_source.dart';

extension DogDtoX on DogDto {
  Dog get dog => Dog(
        id: id,
        name: name,
        breed: breed,
        gender: DogGender.fromString(gender),
        age: Age(value: age, unit: AgeUnit.fromString(ageUnit)),
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
        age: age.value, 
        ageUnit: age.unit.name,
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
