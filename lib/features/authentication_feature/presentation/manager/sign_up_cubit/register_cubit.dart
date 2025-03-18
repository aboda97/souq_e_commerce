import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_app/features/authentication_feature/domain/repositories/auth_repo.dart';
import 'package:souq_app/features/authentication_feature/presentation/manager/sign_up_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  final AuthRepo authRepo;

  Future<void> registerByEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(RegisterLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );

    result.fold(
      (failure) => emit (RegisterFailure(failure: failure)),
      (userEntity) => emit(RegisterSuccess(userEntity: userEntity)) ,
    );
  }
}
