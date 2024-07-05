part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class CheckAuth extends AuthEvent {}

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
