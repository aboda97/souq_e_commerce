import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_app/core/localization/language_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  // Initialize SharedPreferences before registering it
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  // Register LanguageCubit with SharedPreferences injected
  serviceLocator.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
}
