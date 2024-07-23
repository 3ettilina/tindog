part of 'auth_service_contract.dart';

/// Authentication Service that uses Firebase Auth
class FirebaseAuthService implements AuthServiceContract {
  /// FirebaseAuthService constructor
  FirebaseAuthService({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _auth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  @override
  Stream<String?> get userId {
    return _auth.authStateChanges().map((firebaseUser) {
      return firebaseUser?.uid;
    });
  }

  @override
  Future<String?> get currentUserId async {
    return _auth.currentUser?.uid;
  }

  @override
  Future<String?> appleSignIn() async {
    try {
      final auth = await _auth.signInWithProvider(AppleAuthProvider());
      return auth.user?.email;
    } catch (e) {
      throw const LogInWithAppleException('Google Sign In Failure');
    }
  }

  @override
  Future<String?> googleSignIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final auth = await _auth.signInWithCredential(credential);
      return auth.user?.uid;
    } catch (e) {
      throw const LogInWithGoogleException('Google Sign In Failure');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await Future.wait([
        _auth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (e) {
      throw const LogOutException('Log Out Failure');
    }
  }
}
