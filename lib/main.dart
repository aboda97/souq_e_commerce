import 'package:flutter/material.dart';
import 'package:souq_app/features/splash_feature/presentation/views/splash_view.dart';

void main() {
  runApp(const SouqApp());
}

class SouqApp extends StatelessWidget {
  const SouqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashView());
  }
}
