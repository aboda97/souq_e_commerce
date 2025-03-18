import 'package:souq_app/core/errors/failure.dart';
import 'package:souq_app/features/authentication_feature/domain/entities/user_entity.dart';

abstract class RegisterStates {}

class RegisterInitial extends RegisterStates {}

class RegisterLoading extends RegisterStates {}

class RegisterSuccess extends RegisterStates {
  final UserEntity userEntity;

  RegisterSuccess({required this.userEntity});
}

class RegisterFailure extends RegisterStates {
  final Failure failure;

  RegisterFailure({required this.failure});
}
