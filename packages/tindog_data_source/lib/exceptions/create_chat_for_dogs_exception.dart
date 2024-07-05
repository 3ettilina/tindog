import 'package:tindog_data_source/exceptions/base_exception.dart';

class ChatAlreadyExistsException extends BaseException {
  ChatAlreadyExistsException({required super.message});
}

class UnableToCreateChatException extends BaseException {
  UnableToCreateChatException({required super.message});
}
