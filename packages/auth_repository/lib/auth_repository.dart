import 'package:auth_service/auth_service.dart';

class AuthRepository {
  AuthRepository({
    AuthService? authService,
  }) : _authService = authService ?? FirebaseAuthService();

  final AuthService _authService;

  Future<bool> signInWithGoogle() async {
    return _authService.googleSignIn();
  }
}
