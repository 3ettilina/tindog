part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingAuthentication extends AuthState {}

class Authenticated extends AuthState {
  Authenticated({required this.id});

  final String id;

  @override
  List<Object?> get props => [id, ...super.props];
}

class Unauthenticated extends AuthState {}

class AuthenticationError extends AuthState {
  AuthenticationError(this.message);

  final String message;

  @override
  List<Object?> get props => [message, ...super.props];
}
