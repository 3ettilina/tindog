import 'package:auth_service/auth_service.dart';

export 'package:auth_repository/auth_repository.dart';

class AuthRepository {
  AuthRepository({
    AuthServiceContract? authService,
  }) : _authService = authService ?? FirebaseAuthService();

  final AuthServiceContract _authService;

  Stream<String?> get userId => _authService.userId;

  Future<String?> get currentUserId async {
    return _authService.currentUserId;
  }

  Future<String?> signInWithGoogle() async {
    return _authService.googleSignIn();
  }

  Future<String?> signInWithApple() async {
    return _authService.appleSignIn();
  }

  Future<void> signOut() async {
    return _authService.signOut();
  }
}
