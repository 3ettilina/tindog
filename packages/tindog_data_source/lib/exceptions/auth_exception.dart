import 'package:tindog_data_source/exceptions/base_exception.dart';

class UserNotAuthenticatedException extends BaseException {
  UserNotAuthenticatedException({required super.message});
}

class UserNotAuthorizedException extends BaseException {
  UserNotAuthorizedException({required super.message});
}
