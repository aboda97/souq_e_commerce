import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:souq_app/core/helper_functions/build_app_theme.dart';
import 'package:souq_app/core/helper_functions/on_generate_route_func.dart';
import 'package:souq_app/core/localization/language_cubit.dart';
import 'package:souq_app/core/localization/language_state.dart';
import 'package:souq_app/core/services/service_locator.dart';
import 'package:souq_app/core/services/shared_preferences.dart';
import 'package:souq_app/features/best_selling_feature/presentation/views/best_selling_view.dart';
import 'package:souq_app/features/home_feature/presentation/views/home_view.dart';
import 'package:souq_app/features/search_feature/presentation/views/search_view.dart';
import 'package:souq_app/features/splash_feature/presentation/views/splash_view.dart';
import 'package:souq_app/features/test_localization_feature/presentation/views/test.dart';
import 'package:souq_app/firebase_options.dart';
import 'package:souq_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreferencesService.init();
  await setupLocator();
  runApp(SouqApp());
}

class SouqApp extends StatelessWidget {
  const SouqApp({super.key});

  @override

  Widget build(BuildContext context) {
    print('Width Size: ${MediaQuery.of(context).size.width}');

    return BlocProvider(
      create: (context) => serviceLocator<LanguageCubit>()..loadSavedLanguage(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            theme: appTheme(),
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
            //initialRoute: HomeView.routeName,
           // initialRoute: BestSellingView.routeName,
           // initialRoute: SearchView.routeName,
           
          );
        },
      ),
    );
  }
}
