import 'dart:async';
import 'dart:io';

import 'package:auth_repository/auth_repository.dart';
import 'package:core/core.dart';
import 'package:tindog_data_source/dto/dog/dog_dto.dart';
import 'package:tindog_data_source/exceptions/analyze_dog.dart';
import 'package:tindog_data_source/exceptions/create_dog_exception.dart';
import 'package:tindog_data_source/tindog_data_source.dart';
import 'package:tindog_repository/extensions/dog_extension.dart';

class TindogRepository {
  TindogRepository({
    TindogDataSource? dataSource,
    AuthRepository? authRepository,
  })  : _dataSource = dataSource ?? FirebaseTindogDataSource(),
        _authRepository = authRepository ?? AuthRepository();

  final TindogDataSource _dataSource;
  final AuthRepository _authRepository;

  Future<Dog?> checkUserHasDog({required String userId}) async {
    final dogDto = await _dataSource.checkUserHasDog(userId: userId);
    final dog = dogDto?.dog;
    return dog;
  }

  Future<AnalyzeDogResult> verifyDogImage({
    required File dogImage,
  }) async {
    try {
      final analyzeDogResult = await _dataSource.analyzeDog(image: dogImage);
      final output = AnalyzeDogDetails(
        id: analyzeDogResult.id,
        imagePath: analyzeDogResult.filePath,
        breed: analyzeDogResult.breed,
        size: DogSize.fromName(analyzeDogResult.size),
        description: analyzeDogResult.description,
      );
      return output;
    } on ImageUploadedIsNotADogException catch (_) {
      return AnalyzeDogErrorNoDogOnImage(
        message:
            '''The image provided does not come from a dog. Please select another one.''',
      );
    } on CreateDogException catch (_) {
      return AnalyzeDogError(
          message: 'Something went wrong while creating the Dog');
    } catch (e) {
      return AnalyzeDogError(
          message: 'Something went wrong while creating the Dog');
    }
  }

  Future<CreateDogProfileResponse> submitDogProfile({
    required Dog dog,
  }) async {
    try {
      final user = await _authRepository.currentUserId();
      final dto = DogDto(
        id: dog.id,
        name: dog.name,
        breed: dog.breed,
        gender: dog.gender.toString(),
        age: '${dog.age.value} ${dog.age.unit}',
        size: dog.size.toString(),
        filePath: dog.imagePath,
        isNeutered: dog.isNeutered,
        interests: dog.interests,
        description: dog.description,
        userId: user!,
      );
      await _dataSource.createDog(dog: dto);
      return CreateDogProfileSuccess();
    } on CreateDogException catch (_) {
      return CreateDogProfileError(
        'Something went wrong while creating the profile :(',
      );
    }
  }

  Stream<FetchDogsResponse> fetchDogs({
    required Dog myDog,
  }) {
    try {
      final dogsTransformer =
          StreamTransformer<List<DogDto>, FetchDogsSuccess>.fromHandlers(
              handleData: (dogDtoList, sink) {
        final outputDogs = List<Dog>.empty(growable: true);
        for (final dogDto in dogDtoList) {
          outputDogs.add(dogDto.dog);
        }
        final response = FetchDogsSuccess(outputDogs);
        sink.add(response);
      });
      return _dataSource
          .fetchDogs(dogId: myDog.id, seenDogs: myDog.seen)
          .transform((dogsTransformer));
    } catch (e) {
      return Stream.value(
          FetchDogsError('Something went wrong while fetching dogs'));
    }
  }

  Future<bool> dislikeDog({
    required Dog myDog,
    required Dog dogToDislike,
  }) async {
    try {
      await _dataSource.dislikeDog(
        myDog: myDog.dto,
        dogToDislike: dogToDislike.dto,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> likeDog({
    required Dog myDog,
    required Dog dogToLike,
  }) async {
    try {
      final hasMatch = await _dataSource.likeDog(
        myDog: myDog.dto,
        dogToLike: dogToLike.dto,
      );
      return hasMatch;
    } catch (e) {
      return false;
    }
  }
}
