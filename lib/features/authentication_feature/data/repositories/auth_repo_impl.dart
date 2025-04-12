import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:souq_app/core/errors/auth_fire_base_exceptions.dart';
import 'package:souq_app/core/errors/custom_exception.dart';
import 'package:souq_app/core/errors/failure.dart';
import 'package:souq_app/core/services/fire_base_auth_service.dart';
import 'package:souq_app/core/services/fire_data_base_service.dart';
import 'package:souq_app/core/utils/back_end_points_paths.dart';
import 'package:souq_app/features/authentication_feature/data/models/user_model.dart';
import 'package:souq_app/features/authentication_feature/domain/entities/user_entity.dart';
import 'package:souq_app/features/authentication_feature/domain/repositories/auth_repo.dart';
import 'package:souq_app/generated/l10n.dart';

class AuthRepoImpl extends AuthRepo {
  final FireBaseAuthService fireBaseAuthService;
  final FireDataBaseService fireDataBaseService;

  AuthRepoImpl({
    required this.fireBaseAuthService,
    required this.fireDataBaseService,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String userEmail,
    String userPassword,
    String userName,
  ) async {
    User? userLogin;
    try {
      userLogin = await fireBaseAuthService.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      if (userLogin == null) {
        return left(ServerFailure(S.current.unexpectedError));
      }

      //var userEntity = UserModel.fromFireBaseUser(userLogin);
      var userEntity = UserEntity(
        userId: userLogin.uid,
        userName: userName,
        userEmail: userEmail,
      );
      await addUserData(userEntity: userEntity);
      return right(userEntity);
    } on AuthFireBasExceptions catch (e) {
      await deleteData(userLogin);
      return left(ServerFailure(e.message));
    } on CustomException catch (e) {
      await deleteData(userLogin);
      return left(ServerFailure(e.exceptionMsg));
    } catch (e) {
      await deleteData(userLogin);
      return left(ServerFailure(S.current.unexpectedError));
    }
  }

  Future<void> deleteData(User? userLogin) async {
    if (userLogin != userLogin) {
      await fireBaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String userEmail,
    String userPassword,
  ) async {
    User? userLogin;
    try {
     userLogin = await fireBaseAuthService.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
       if (userLogin == null) {
        return left(ServerFailure(S.current.unexpectedError));
      }
      var userEntity = await getUserData(userId: userLogin.uid);
     
      // return right(UserModel.fromFireBaseUser(userLogin));
      return right(userEntity);
    } on AuthFireBasExceptions catch (e) {
      await deleteData(userLogin);
      return left(ServerFailure(e.message));
    } on CustomException catch (e) {
      await deleteData(userLogin);
      return left(ServerFailure(e.exceptionMsg));
    } catch (e) {
      await deleteData(userLogin);
      return left(ServerFailure(S.current.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? userLogin;
    try {
      final userLogin = await fireBaseAuthService.signInWithGoogle();

      if (userLogin == null) {
        return left(ServerFailure(S.current.unexpectedError));
      }
      var userEntity = UserModel.fromFireBaseUser(userLogin);
      var isUserExist = await fireDataBaseService.checkIfUserExist(
        path: BackEndPointsPaths.isUserExist,
        docId: userEntity.userId,);  
      if (isUserExist) {
         await getUserData(userId: userLogin.uid);
      }else{
        await addUserData(userEntity: userEntity);
      }
      return right(userEntity);
    } on AuthFireBasExceptions catch (e) {
      await deleteData(userLogin);
      return left(ServerFailure(e.message));
    } on CustomException catch (e) {
      await deleteData(userLogin);
      return left(ServerFailure(e.exceptionMsg));
    } catch (e) {
      await deleteData(userLogin);
      return left(ServerFailure(S.current.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? userLogin;
    try {
      final userLogin = await fireBaseAuthService.signInWithFacebook();

      if (userLogin == null) {
        return left(ServerFailure(S.current.unexpectedError));
      }
      var userEntity = UserModel.fromFireBaseUser(userLogin);
      await addUserData(userEntity: userEntity);
      return right(userEntity);
    } on AuthFireBasExceptions catch (e) {
      await deleteData(userLogin);
      return left(ServerFailure(e.message));
    } on CustomException catch (e) {
      await deleteData(userLogin);
      return left(ServerFailure(e.exceptionMsg));
    } catch (e) {
      await deleteData(userLogin);
      return left(ServerFailure(S.current.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    try {
      final userLogin = await fireBaseAuthService.signInWithApple();

      if (userLogin == null) {
        return left(ServerFailure(S.current.unexpectedError));
      }

      return right(UserModel.fromFireBaseUser(userLogin));
    } on AuthFireBasExceptions catch (e) {
      return left(ServerFailure(e.message));
    } on CustomException catch (e) {
      return left(ServerFailure(e.exceptionMsg));
    } catch (e) {
      return left(ServerFailure(S.current.unexpectedError));
    }
  }

  @override
  Future addUserData({required UserEntity userEntity}) async {
    await fireDataBaseService.addData(
      jsonData: userEntity.toMap(),
      path: BackEndPointsPaths.addUsersData,
      docId: userEntity.userId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    var userData = await fireDataBaseService.getUserData(
      path: BackEndPointsPaths.getUsersData,
      docId: userId,
    );
    return UserModel.fromJson(userData);
  }
}
