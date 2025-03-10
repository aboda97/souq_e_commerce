import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:souq_app/core/helper_functions/on_generate_route_func.dart';
import 'package:souq_app/core/services/shared_preferences.dart';
import 'package:souq_app/core/utils/service_locator.dart';
import 'package:souq_app/features/splash_feature/presentation/views/splash_view.dart';
import 'package:souq_app/features/localization_feature/presentation/manager/language_cubit/language_cubit.dart';
import 'package:souq_app/features/localization_feature/presentation/manager/language_cubit/language_state.dart';
import 'package:souq_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  await setupLocator(); // Ensure dependencies are set up before running the app
  final languageCubit = locator<LanguageCubit>();
  languageCubit.loadSavedLanguage(); // Load saved language preference

  runApp(SouqApp(languageCubit: languageCubit));
}

class SouqApp extends StatelessWidget {
  final LanguageCubit languageCubit;

  const SouqApp({super.key, required this.languageCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: languageCubit,
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(fontFamily: 'Cairo'),
            locale: state.locale,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Souq App',
            onGenerateRoute: onGenerateRoute,
            initialRoute: SplashView.routeName,
          );
        },
      ),
    );
  }
}
