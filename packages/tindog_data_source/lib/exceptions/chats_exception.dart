import 'package:tindog_data_source/exceptions/base_exception.dart';

class UnableToFetchChatsException extends BaseException {
  UnableToFetchChatsException({required super.message});
}

class UnableToSendMessage extends BaseException {
  UnableToSendMessage({required super.message});
}
