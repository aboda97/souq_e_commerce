import 'package:dartz/dartz.dart';
import 'package:souq_app/core/errors/failure.dart';
import 'package:souq_app/features/authentication_feature/domain/entities/user_entity.dart';
import 'package:souq_app/features/authentication_feature/domain/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String userEmail,
    required String userPassword,
  }) {
    throw UnimplementedError();
  }
}
