import 'package:souq_app/core/errors/failure.dart';
import 'package:souq_app/features/authentication_feature/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String userEmail,
    required String userPassword,
  });
}
