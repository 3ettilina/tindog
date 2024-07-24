/// Represents a general authentication Exception
class AuthException implements Exception {
  /// Constructor of [AuthException]
  const AuthException(this.message);

  /// Message thrown within the exception
  final String message;
}

/// Represents an exception when trying to login with Google
class LogInWithGoogleException extends AuthException {
  /// Constructor of [LogInWithAppleException]
  const LogInWithGoogleException(super.message);
}

/// Represents an [Exception] when Login with Apple
class LogInWithAppleException extends AuthException {
  /// Constructor of [LogInWithAppleException]
  const LogInWithAppleException(super.message);
}

/// Represent an [Exception] when login out
class LogOutException extends AuthException {
  /// Constructor of [LogOutException]
  const LogOutException(super.message);
}
