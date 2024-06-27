import 'package:tindog_data_source/exceptions/base_exception.dart';

class FetchDogsException extends BaseException {
  FetchDogsException({required super.message});
}

class MatchDogsException extends BaseException {
  MatchDogsException({required super.message});
}

class UnableToLikeDogException extends BaseException {
  UnableToLikeDogException({required super.message});
}

class UnableToUpdateDogException extends BaseException {
  UnableToUpdateDogException({required super.message});
}

class UnableToGetDogDetailsException extends BaseException {
  UnableToGetDogDetailsException({required super.message});
}
