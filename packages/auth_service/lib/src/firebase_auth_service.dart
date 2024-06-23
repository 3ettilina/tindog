part of 'auth_service.dart';

/// Authentication Service of Firebase
class FirebaseAuthService implements AuthService {
  /// FirebaseAuthService constructor
  FirebaseAuthService() : _auth = FirebaseAuth.instance;

  final FirebaseAuth _auth;

  @override
  Future<bool> appleSignIn() {
    throw UnimplementedError();
  }

  @override
  Future<bool> googleSignIn() async {
    try {
      await _auth.signInWithProvider(GoogleAuthProvider());
      return true;
    } catch (e) {
      return false;
    }
  }
}
