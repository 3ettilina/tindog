part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  Dog? get userDog => switch (this) {
        final Authenticated auth => auth.dog,
        _ => null,
      };
}

class CheckingAuthentication extends AuthState {
  const CheckingAuthentication();
  
  @override
  List<Object?> get props => [];
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
  List<Object?> get props => [id, isNewUser, dog,];
}

class Unauthenticated extends AuthState {
  const Unauthenticated();

  @override
  List<Object?> get props => [];
}

class AuthenticationError extends AuthState {
  const AuthenticationError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
