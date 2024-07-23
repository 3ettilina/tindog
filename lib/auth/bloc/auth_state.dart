part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  Dog? get userDog => switch (this) {
        final Authenticated auth => auth.dog,
        _ => null,
      };

  @override
  List<Object?> get props => [];
}

class CheckingAuthentication extends AuthState {
  const CheckingAuthentication();
}

class Authenticated extends AuthState {
  const Authenticated({
    required this.id,
    required this.isNewUser,
    this.dog,
  });

  final String id;
  final bool isNewUser;
  final Dog? dog;

  @override
  List<Object?> get props => [
        id,
        isNewUser,
        dog,
      ];
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}

class AuthenticationError extends AuthState {
  const AuthenticationError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class UnauthenticatedError extends AuthState {
  const UnauthenticatedError({
    required this.id,
    required this.isNewUser,
    this.dog,
  });

  final String id;
  final bool isNewUser;
  final Dog? dog;

  @override
  List<Object?> get props => [
        id,
        isNewUser,
        dog,
      ];
}
