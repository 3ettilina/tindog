part of 'auth_service.dart';

/// Authentication Service of Firebase
class FirebaseAuthService implements AuthService {
  /// FirebaseAuthService constructor
  FirebaseAuthService() : _auth = FirebaseAuth.instance;

  final FirebaseAuth _auth;

  @override
  Future<String?> appleSignIn() async {
    try {
      final auth = await _auth.signInWithProvider(AppleAuthProvider());
      return auth.user?.email;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> googleSignIn() async {
    try {
      final auth = await _auth.signInWithProvider(GoogleAuthProvider());
      return auth.user?.uid;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> currentUser() async {
    return _auth.currentUser?.uid;
  }
}
