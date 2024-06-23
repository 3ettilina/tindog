import 'package:equatable/equatable.dart';

typedef Email = String;

class User extends Equatable {
  const User({required this.email});

  final Email email;

  @override
  List<Object?> get props => [email];
}
