import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_app/core/localization/language_cubit.dart';
import 'package:souq_app/core/services/bloc_observer.dart';
import 'package:souq_app/core/services/fire_base_auth_service.dart';
import 'package:souq_app/core/services/fire_data_base_service.dart';
import 'package:souq_app/core/services/flutter_fire_store_service.dart';
import 'package:souq_app/features/authentication_feature/data/repositories/auth_repo_impl.dart';
import 'package:souq_app/features/authentication_feature/domain/repositories/auth_repo.dart';
import 'package:souq_app/features/authentication_feature/presentation/manager/sign_in_cubit/login_cubit.dart';
import 'package:souq_app/features/authentication_feature/presentation/manager/sign_up_cubit/register_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  //-------> Initialize SharedPreferences before registering it  <--------------//
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  //-----------------> SERVICES  <-----------------//
  serviceLocator.registerLazySingleton<FireBaseAuthService>(
    () => FireBaseAuthService(),
  );
  serviceLocator.registerLazySingleton<FireDataBaseService>(
    () => FlutterFireStoreService(),
  );

  //-----------------> CUBITS  <-----------------//
  serviceLocator.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
  serviceLocator.registerLazySingleton<RegisterCubit>(
    () => RegisterCubit(serviceLocator<AuthRepo>()),
  );
  serviceLocator.registerLazySingleton<LoginCubit>(
    () => LoginCubit(serviceLocator<AuthRepo>()),
  );

  //-----------------> REPOSITORIES  <-----------------//
  serviceLocator.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      fireBaseAuthService: serviceLocator<FireBaseAuthService>(),
      fireDataBaseService: serviceLocator<FireDataBaseService>(),
    ),
  );

  //-----------------> BLOC OBSERVER  <-----------------//
  serviceLocator.registerLazySingleton<AppBlocObserver>(
    () => AppBlocObserver(),
  );
}
