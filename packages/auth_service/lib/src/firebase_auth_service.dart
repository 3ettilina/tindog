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
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final auth = await _auth.signInWithCredential(credential);
      return auth.user?.uid;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> currentUserId() async {
    return _auth.currentUser?.uid;
  }
}
