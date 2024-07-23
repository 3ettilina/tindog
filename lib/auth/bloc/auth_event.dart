part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class _UserChanged extends AuthEvent {
  const _UserChanged(this.userId);

  final String? userId;
}

class UpdateUserDetails extends AuthEvent {
  const UpdateUserDetails({
    this.dog,
    required this.userId,
    required this.isNewUser,
  });

  final Dog? dog;
  final String userId;
  final bool isNewUser;
}

class LogIn extends AuthEvent {}

class LogOut extends AuthEvent {}
