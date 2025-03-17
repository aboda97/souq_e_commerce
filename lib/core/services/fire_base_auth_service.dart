import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:souq_app/core/errors/auth_fire_base_exceptions.dart';
import 'package:souq_app/core/errors/failure.dart';

class FireBaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw AuthFireBasExceptions.fromFirebaseAuth(e, context);
    } catch (e) {
      throw ServerFailure('Unexpected error: ${e.toString()}');
    }
  }
}
