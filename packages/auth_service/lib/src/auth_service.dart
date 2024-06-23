import 'package:firebase_auth/firebase_auth.dart';

part 'firebase_auth_service.dart';

/// {@template auth_service}
/// Authentication Service Contract
/// {@endtemplate}
abstract class AuthService {
  Future<String?> currentUser();

  /// Implements Sign In using Google SSO
  Future<String?> googleSignIn();

  /// Implements Sign In using Apple SSO
  Future<String?> appleSignIn();
}
