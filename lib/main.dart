import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:souq_app/core/helper_functions/on_generate_route_func.dart';
import 'package:souq_app/core/localization/language_cubit.dart';
import 'package:souq_app/core/localization/language_state.dart';
import 'package:souq_app/core/services/service_locator.dart';
import 'package:souq_app/core/services/shared_preferences.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/features/splash_feature/presentation/views/splash_view.dart';
import 'package:souq_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  await setupLocator(); // Ensure dependencies are set up before running the app
  runApp(SouqApp());
}

class SouqApp extends StatelessWidget {
  const SouqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<LanguageCubit>()..loadSavedLanguage(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'Cairo',
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryColor,
              ),
            ),
            locale: state.locale, //Locale('en'),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
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
