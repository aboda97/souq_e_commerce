import 'package:souq_app/core/errors/failure.dart';
import 'package:souq_app/features/authentication_feature/domain/entities/user_entity.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final UserEntity userEntity;

  LoginSuccess({required this.userEntity});
}

class LoginFailure extends LoginStates {
  final Failure failure;

  LoginFailure({required this.failure});
}

class LoginPasswordVisibilityChanged extends LoginStates {}
