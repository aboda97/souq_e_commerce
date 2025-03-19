import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_app/core/errors/failure.dart';
import 'package:souq_app/features/authentication_feature/domain/repositories/auth_repo.dart';
import 'package:souq_app/features/authentication_feature/presentation/manager/sign_in_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(LoginPasswordVisibilityChanged());
  }

  Future<void> loginByEmailAndPassword(String email, String password) async {
    try {
      emit(LoginLoading());

      final result = await authRepo.signInWithEmailAndPassword(email, password);

      result.fold(
        (failure) => emit(LoginFailure(failure: failure)),
        (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
      );
    } catch (e) {
      emit(LoginFailure(failure: ServerFailure(e.toString())));
    }
  }
}
