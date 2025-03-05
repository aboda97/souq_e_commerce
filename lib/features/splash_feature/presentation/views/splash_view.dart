import 'package:flutter/material.dart';
import 'package:souq_app/features/splash_feature/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = 'SplashView';
  @override
  Widget build(BuildContext context) {
    return SplashViewBody();
  }
}
