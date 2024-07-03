part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  Dog? get userDog => switch (this) {
        final Authenticated auth => auth.dog,
        _ => null,
      };

  @override
  List<Object?> get props => [];
}

class CheckingAuthentication extends AuthState {}

class Authenticated extends AuthState {
  Authenticated({
    required this.id,
    required this.isNewUser,
    this.dog,
  });

  final String id;
  final bool isNewUser;
  final Dog? dog;

  @override
  List<Object?> get props => [id, isNewUser, ...super.props];
}

class Unauthenticated extends AuthState {}

class AuthenticationError extends AuthState {
  AuthenticationError(this.message);

  final String message;

  @override
  List<Object?> get props => [message, ...super.props];
}
