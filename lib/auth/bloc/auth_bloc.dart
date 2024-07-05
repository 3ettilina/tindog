import 'dart:async';

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
        super(const CheckingAuthentication()) {
    on<CheckAuth>(_checkingAuth);
    on<LogIn>(_logIn);
    on<LogOut>(_logOut);
    on<UpdateUserDetails>(_onUserUpdate);
    add(CheckAuth());
  }

  final AuthRepository _authRepository;
  final TindogRepository _tindogRepository;

  StreamSubscription<Dog?>? _myDog;

  Future<void> _checkingAuth(
    CheckAuth event,
    Emitter<AuthState> emit,
  ) async {
    final userId = await _authRepository.currentUserId();
    if (userId != null) {
      await _tindogRepository.checkUserHasDog(userId: userId);

      _myDog?.cancel();
      _myDog = _tindogRepository.myDog.listen(
        (dog) => add(
          UpdateUserDetails(
            dog: dog,
            userId: userId,
            isNewUser: dog == null,
          ),
        ),
        onError: (e) => add(LogOut()),
      );
    } else {
      emit(const Unauthenticated());
    }
  }

  void _onUserUpdate(
    UpdateUserDetails event,
    Emitter<AuthState> emit,
  ) {
    emit(
      Authenticated(
        id: event.userId,
        isNewUser: event.isNewUser,
        dog: event.dog,
      ),
    );
  }

  Future<void> _logIn(
    LogIn event,
    Emitter<AuthState> emit,
  ) async {
    final userId = await _authRepository.signInWithGoogle();
    if (userId != null) {
      await _tindogRepository.checkUserHasDog(userId: userId);
      _myDog?.cancel();
      _myDog = _tindogRepository.myDog.listen(
        (dog) => add(
          UpdateUserDetails(
            dog: dog,
            userId: userId,
            isNewUser: dog == null,
          ),
        ),
        onError: (e) {
          // Fallback for when there's no Dog on the Stream
          add(UpdateUserDetails(userId: userId, isNewUser: true));
        }
      );
    } else {
      emit(const AuthenticationError('Something went wrong while authenticating'));
    }
  }

  Future<void> _logOut(
    LogOut event,
    Emitter<AuthState> emit,
  ) async {
    await _authRepository.signOut();
    emit(const Unauthenticated());
  }
}
