import 'dart:async';

import 'package:auth_service/src/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'firebase_auth_service.dart';

/// {@template auth_service}
/// Authentication Service Contract
/// {@endtemplate}
abstract class AuthServiceContract {
  /// Returns a Stream with the current User ID if any
  Stream<String?> get userId;

  /// Returns the User UUID
  Future<String?> get currentUserId;

  /// Implements Sign In using Google SSO
  Future<String?> googleSignIn();

  /// Implements Sign In using Apple SSO
  Future<String?> appleSignIn();

  /// Handles log out of the user
  Future<void> signOut();
}
