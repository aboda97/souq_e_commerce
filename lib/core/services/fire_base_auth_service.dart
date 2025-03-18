import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq_app/core/errors/auth_fire_base_exceptions.dart';
import 'package:souq_app/core/errors/failure.dart';

class FireBaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw AuthFireBasExceptions.fromFirebaseAuth(e);
    } catch (e) {
      throw ServerFailure('Unexpected error: ${e.toString()}');
    }
  }
}
