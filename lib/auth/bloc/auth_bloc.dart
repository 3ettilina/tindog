import 'package:auth_repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository(),
        super(CheckingAuthentication()) {
    on<CheckAuth>(_checkingAuth);
    on<LogIn>(_logIn);
    on<LogOut>(_logOut);
    add(CheckAuth());
  }

  final AuthRepository _authRepository;

  Future<void> _checkingAuth(
    CheckAuth event,
    Emitter<AuthState> emit,
  ) async {
    final userId = await _authRepository.currentUser();

    if (userId != null) {
      emit(Authenticated(id: userId));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _logIn(
    LogIn event,
    Emitter<AuthState> emit,
  ) async {
    final userId = await _authRepository.signInWithGoogle();
    if (userId != null) {
      emit(Authenticated(id: userId));
    } else {
      emit(AuthenticationError('Something went wrong while authenticating'));
    }
  }

  Future<void> _logOut(
    LogOut event,
    Emitter<AuthState> emit,
  ) async {
    emit(Unauthenticated());
  }
}
