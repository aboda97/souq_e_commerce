import 'package:souq_app/core/errors/failure.dart';
import 'package:souq_app/features/authentication_feature/data/models/user_model.dart';
import 'package:souq_app/features/authentication_feature/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String userEmail,
    String userPassword,
    String userName,
  );
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String userEmail,
    String userPassword,
  );

  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future<Either<Failure, UserEntity>> signInWithApple();
  Future addUserData({required UserEntity userEntity});
  Future saveUserData({required UserModel userModel});
  Future<UserEntity> getUserData({required String userId});
}
