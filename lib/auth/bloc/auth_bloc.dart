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
    on<_UserChanged>(_userChanged);
    on<LogIn>(_logIn);
    on<LogOut>(_logOut);
    on<UpdateUserDetails>(_onUserUpdate);

    _userSubscription = _authRepository.userId.listen((userId) {
      add(_UserChanged(userId));
    });
  }

  final AuthRepository _authRepository;
  final TindogRepository _tindogRepository;

  late final StreamSubscription<String?> _userSubscription;
  late final StreamSubscription<Dog?> _myDogSubscription;

  Future<void> _userChanged(
    _UserChanged event,
    Emitter<AuthState> emit,
  ) async {
    final userId = event.userId;
    if (userId != null) {
      await _tindogRepository.checkUserHasDog(userId: userId);

      _myDogSubscription.cancel();
      _myDogSubscription = _tindogRepository.myDog.listen(
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
      _myDogSubscription.cancel();
      _myDogSubscription = _tindogRepository.myDog.listen(
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
        },
      );
    } else {
      emit(const AuthenticationError(
        'Something went wrong while authenticating',
      ));
    }
  }

  Future<void> _logOut(
    LogOut event,
    Emitter<AuthState> emit,
  ) async {
    final currentState = state as Authenticated;
    try {
      await _authRepository.signOut();
      emit(const Unauthenticated());
    } catch (_) {
      emit(
        UnauthenticatedError(
          id: currentState.id,
          isNewUser: currentState.isNewUser,
          dog: currentState.dog,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _myDogSubscription.cancel();
    _userSubscription.cancel();
    return super.close();
  }
}
