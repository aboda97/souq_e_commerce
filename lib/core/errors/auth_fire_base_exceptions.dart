import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq_app/generated/l10n.dart';

class AuthFireBasExceptions implements Exception {
  final String message;

  AuthFireBasExceptions(this.message);

  factory AuthFireBasExceptions.fromFirebaseAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return AuthFireBasExceptions(S.current.invalidEmail);
      case 'user-not-found':
        return AuthFireBasExceptions(S.current.userNotFound);
      case 'wrong-password':
        return AuthFireBasExceptions(S.current.wrongPassword);
      case 'email-already-in-use':
        return AuthFireBasExceptions(S.current.emailInUse);
      case 'weak-password':
        return AuthFireBasExceptions(S.current.weakPassword);
      case 'network-request-failed':
        return AuthFireBasExceptions(S.current.networkError);
      case 'too-many-requests':
        return AuthFireBasExceptions(S.current.tooManyRequests);
      default:
        return AuthFireBasExceptions(S.current.unknownError(e.message ?? ''));
    }
  }

  @override
  String toString() => "AuthException: $message";
}
