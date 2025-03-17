import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:souq_app/generated/l10n.dart';

class AuthFireBasExceptions implements Exception {
  final String message;

  AuthFireBasExceptions(this.message);

  factory AuthFireBasExceptions.fromFirebaseAuth(
    FirebaseAuthException e,
    BuildContext context,
  ) {
    switch (e.code) {
      case 'invalid-email':
        return AuthFireBasExceptions(S.of(context).invalidEmail);
      case 'user-not-found':
        return AuthFireBasExceptions(S.of(context).userNotFound);
      case 'wrong-password':
        return AuthFireBasExceptions(S.of(context).wrongPassword);
      case 'email-already-in-use':
        return AuthFireBasExceptions(S.of(context).emailInUse);
      case 'weak-password':
        return AuthFireBasExceptions(S.of(context).weakPassword);
      case 'network-request-failed':
        return AuthFireBasExceptions(S.of(context).networkError);
      case 'too-many-requests':
        return AuthFireBasExceptions(S.of(context).tooManyRequests);
      default:
        return AuthFireBasExceptions(
          S.of(context).unknownError(e.message ?? ''),
        );
    }
  }

  @override
  String toString() => "AuthException: $message";
}
