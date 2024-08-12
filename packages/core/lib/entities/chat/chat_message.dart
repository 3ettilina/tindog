import 'package:equatable/equatable.dart';

class InitialChatMessage extends Equatable {
  const InitialChatMessage({
    required this.readBy,
    required this.text,
    required this.timestamp,
  });

  final List<String> readBy;
  final String text;
  final DateTime timestamp;

  @override
  List<Object?> get props => [readBy, text, timestamp];
}

class UserMessageChat extends Equatable {
  UserMessageChat({
    required this.timestamp,
    required this.text,
    required this.isRead,
    required this.userId,
  });

  final DateTime timestamp;
  final String text;
  final bool isRead;
  final String userId;

  @override
  List<Object?> get props => [timestamp, text, isRead, userId];
}