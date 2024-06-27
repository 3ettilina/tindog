import 'package:tindog_data_source/exceptions/base_exception.dart';

class CreateDogException extends BaseException {
  CreateDogException({required super.message});
}

class UploadDogImageException extends BaseException {
  UploadDogImageException({required super.message});
}

class UpdateDogImageUrlException extends BaseException {
  UpdateDogImageUrlException({required super.message});
}
