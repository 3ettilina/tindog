import 'package:firebase_auth/firebase_auth.dart';

part 'firebase_auth_service.dart';

/// {@template auth_service}
/// Authentication Service Contract
/// {@endtemplate}
abstract class AuthService {
  /// Implements Sign In using Google SSO
  Future<bool> googleSignIn();

  /// Implements Sign In using Apple SSO
  Future<bool> appleSignIn();
}
