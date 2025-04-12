import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:souq_app/core/errors/auth_fire_base_exceptions.dart';
import 'package:souq_app/core/errors/failure.dart';

class FireBaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
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

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw AuthFireBasExceptions.fromFirebaseAuth(e);
    } catch (e) {
      throw ServerFailure('Unexpected error: ${e.toString()}');
    }
  }

  // Future<User?> signInWithFacebook() async {
  //   try {
  //     final LoginResult loginResult = await FacebookAuth.instance.login();
  //     if (loginResult.status != LoginStatus.success ||
  //         loginResult.accessToken == null) {
  //       return null;
  //     }

  //     final OAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  //     final UserCredential userCredential = await _firebaseAuth
  //         .signInWithCredential(facebookAuthCredential);

  //     return userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     throw AuthFireBasExceptions.fromFirebaseAuth(e);
  //   } catch (e) {
  //     throw ServerFailure('Unexpected error: ${e.toString()}');
  //   }
  // }

Future<User?> signInWithFacebook() async {
  try {
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile'],
    );

    if (loginResult.status != LoginStatus.success ||
        loginResult.accessToken == null) {
      return null;
    }

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    final UserCredential userCredential = await _firebaseAuth
        .signInWithCredential(facebookAuthCredential);

    return userCredential.user;
  } on FirebaseAuthException catch (e) {
    throw AuthFireBasExceptions.fromFirebaseAuth(e);
  } catch (e) {
    throw ServerFailure('Unexpected error: ${e.toString()}');
  }
}

  Future<User?> signInWithApple() async {
    try {
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final OAuthCredential credential = OAuthProvider(
        "apple.com",
      ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce);

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw AuthFireBasExceptions.fromFirebaseAuth(e);
    } catch (e) {
      throw ServerFailure('Unexpected error: ${e.toString()}');
    }
  }

  /// Generates a cryptographically secure random nonce.
  String _generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
  Future deleteUser() async {
    try {
      await _firebaseAuth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw AuthFireBasExceptions.fromFirebaseAuth(e);
    } catch (e) {
      throw ServerFailure('Unexpected error: ${e.toString()}');
    }
  }
}
