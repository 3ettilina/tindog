import 'package:auth_service/auth_service.dart';

export 'package:auth_repository/auth_repository.dart';

class AuthRepository {
  AuthRepository({
    AuthService? authService,
  }) : _authService = authService ?? FirebaseAuthService();

  final AuthService _authService;

  Future<String?> currentUser() async {
    return _authService.currentUser();
  }

  Future<String?> signInWithGoogle() async {
    return _authService.googleSignIn();
  }

  Future<String?> signInWithApple() async {
    return _authService.appleSignIn();
  }
}
