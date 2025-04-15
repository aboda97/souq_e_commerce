import 'package:flutter/material.dart';
import 'package:souq_app/features/authentication_feature/presentation/views/login_view.dart';
import 'package:souq_app/features/authentication_feature/presentation/views/register_view.dart';
import 'package:souq_app/features/home_feature/presentation/views/home_view.dart';
import 'package:souq_app/features/on_boarding_feature/presentation/views/on_boarding_view.dart';
import 'package:souq_app/features/splash_feature/presentation/views/splash_view.dart';
import 'package:souq_app/features/test_localization_feature/presentation/views/test.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (_) => const RegisterView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case TestView.routeName:
      return MaterialPageRoute(builder: (_) => const TestView());

    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}
