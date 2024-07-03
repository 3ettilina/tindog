import 'package:auth_repository/auth_repository.dart';
import 'package:core/entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tindog_repository/tindog_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository authRepository,
    required TindogRepository tindogRepository,
  })  : _authRepository = authRepository,
        _tindogRepository = tindogRepository,
        super(CheckingAuthentication()) {
    on<CheckAuth>(_checkingAuth);
    on<LogIn>(_logIn);
    on<LogOut>(_logOut);
    add(CheckAuth());
  }

  final AuthRepository _authRepository;
  final TindogRepository _tindogRepository;

  Future<void> _checkingAuth(
    CheckAuth event,
    Emitter<AuthState> emit,
  ) async {
    final userId = await _authRepository.currentUserId();
    if (userId != null) {
      final userDog = await _tindogRepository.checkUserHasDog(userId: userId);
      final isNewUser = userDog == null;
      emit(Authenticated(id: userId, isNewUser: isNewUser, dog: userDog));
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
      final userDog = await _tindogRepository.checkUserHasDog(userId: userId);
      final isNewUser = userDog != null;
      emit(Authenticated(id: userId, isNewUser: isNewUser, dog: userDog));
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
