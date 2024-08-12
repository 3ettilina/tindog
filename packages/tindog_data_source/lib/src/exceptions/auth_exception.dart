import 'package:tindog_data_source/src/exceptions/base_exception.dart';

class UserNotAuthenticatedException extends BaseException {
  UserNotAuthenticatedException({required super.message});
}

class UserNotAuthorizedException extends BaseException {
  UserNotAuthorizedException({required super.message});
}
