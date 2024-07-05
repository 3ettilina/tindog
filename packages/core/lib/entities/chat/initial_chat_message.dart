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
