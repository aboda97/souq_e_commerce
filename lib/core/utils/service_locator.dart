import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq_app/features/localization_feature/presentation/manager/language_cubit/language_cubit.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Initialize SharedPreferences before registering it
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Register LanguageCubit with SharedPreferences injected
  locator.registerLazySingleton<LanguageCubit>(
    () => LanguageCubit(locator<SharedPreferences>()),
  );
}
