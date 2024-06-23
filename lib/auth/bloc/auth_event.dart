part of 'auth_bloc.dart';

sealed class AuthEvent {}

class CheckAuth extends AuthEvent {}

class LogIn extends AuthEvent {}

class LogOut extends AuthEvent {}
