import 'package:dartz/dartz.dart';
import 'package:souq_app/core/errors/custom_exception.dart';
import 'package:souq_app/core/errors/failure.dart';
import 'package:souq_app/core/services/fire_base_auth_service.dart';
import 'package:souq_app/features/authentication_feature/data/models/user_model.dart';
import 'package:souq_app/features/authentication_feature/domain/entities/user_entity.dart';
import 'package:souq_app/features/authentication_feature/domain/repositories/auth_repo.dart';
import 'package:souq_app/generated/l10n.dart';

class AuthRepoImpl extends AuthRepo {
  final FireBaseAuthService fireBaseAuthService;

  AuthRepoImpl({required this.fireBaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String userEmail,
    String userPassword,
    String userName,
  ) async {
    try {
      var userLogin = await fireBaseAuthService.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      return right(UserModel.fromFireBaseUser(userLogin));
    } on CustomException catch (e) {
      return left(ServerFailure(e.exceptionMsg));
    } catch (e) {
      return left(
        ServerFailure(S.current.unexpectedError),
      );
    }
  }
}
