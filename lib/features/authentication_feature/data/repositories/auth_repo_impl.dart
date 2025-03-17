import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:souq_app/core/errors/custom_exception.dart';
import 'package:souq_app/core/errors/failure.dart';
import 'package:souq_app/core/services/fire_base_auth_service.dart';
import 'package:souq_app/features/authentication_feature/data/models/user_model.dart';
import 'package:souq_app/features/authentication_feature/domain/entities/user_entity.dart';
import 'package:souq_app/features/authentication_feature/domain/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FireBaseAuthService fireBaseAuthService;

  AuthRepoImpl({required this.fireBaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String userEmail,
    String userPassword,
    BuildContext context,
    String userName,
  ) async {
    try {
      var userLogin = await fireBaseAuthService.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
        context: context,
      );

      return right(UserModel.fromFireBaseUser(userLogin));
    } on CustomException catch (e) {
      return left(ServerFailure(e.exceptionMsg));
    } catch (e) {
      return left(ServerFailure('Unexpected error occurred, please try again later.'));
    }
  }
}
