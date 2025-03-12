import 'package:flutter/material.dart';
import 'package:souq_app/features/on_boarding_feature/presentation/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String routeName = 'OnBoardingView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: const OnBoardingViewBody()),
    );
  }
}
