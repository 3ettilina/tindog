import 'dart:io';

import 'package:auth_repository/auth_repository.dart';
import 'package:core/core.dart';
import 'package:tindog_data_source/exceptions/analyze_dog.dart';
import 'package:tindog_data_source/exceptions/create_dog_exception.dart';
import 'package:tindog_data_source/tindog_data_source.dart';

class TindogRepository {
  TindogRepository({
    TindogDataSource? dataSource,
    AuthRepository? authRepository,
  })  : _dataSource = dataSource ?? FirebaseTindogDataSource(),
        _authRepository = authRepository ?? AuthRepository();

  final TindogDataSource _dataSource;
  final AuthRepository _authRepository;

  Future<AnalyzeDogResult> verifyDogImage({
    required File dogImage,
  }) async {
    try {
      final userId = await _authRepository.currentUser();
      if (userId == null) {
        return AnalyzeDogError(
          message: 'You\'re not authenticated. Please try again.',
        );
      }
      final analyzeDogResult = await _dataSource.analyzeDog(image: dogImage);
      final output = AnalyzeDogDetails(
        breed: analyzeDogResult.breed,
        size: analyzeDogResult.size,
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
}
