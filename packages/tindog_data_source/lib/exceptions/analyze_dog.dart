import 'package:tindog_data_source/exceptions/base_exception.dart';

class UnableToAnalyzeDog extends BaseException {
  UnableToAnalyzeDog({required super.message});
}

class ImageUploadedIsNotADogException extends BaseException {
  ImageUploadedIsNotADogException({required super.message});
}
