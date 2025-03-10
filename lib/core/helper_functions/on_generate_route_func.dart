import 'package:flutter/material.dart';
import 'package:souq_app/features/on_boarding_feature/presentation/views/on_boarding_view.dart';
import 'package:souq_app/features/splash_feature/presentation/views/splash_view.dart';
import 'package:souq_app/features/localization_feature/presentation/views/test.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case TestView.routeName:
      return MaterialPageRoute(builder: (_) => const TestView());
    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}
