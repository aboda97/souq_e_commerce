import 'package:flutter/material.dart';
import 'package:souq_app/core/utils/assets_paths.dart';
import 'package:souq_app/features/on_boarding_feature/data/models/on_boarding_model.dart';
import 'package:souq_app/features/test_feature/presentation/views/test.dart';

class OnBoardingManage {
  final PageController pageController = PageController();
  int currentIndex = 0;

  // List of onboarding pages
  final List<OnBoardingModel> pages = [
    OnBoardingModel(
      title: "Welcome to Our App",
      description: "Discover amazing features with us.",
      imagePath: AssetsPaths.onBoardingImgOnePath,
      bgPath: AssetsPaths.bgOnBoardingImgOnePath,
    ),
    OnBoardingModel(
      title: "Fast & Secure",
      description: "Enjoy seamless and secure experiences.",
      imagePath: AssetsPaths.onBoardingImgTwoPath,
      bgPath: AssetsPaths.bgOnBoardingImgTwoPath,
    ),
  ];

  void nextPage(BuildContext context) {
    if (currentIndex < pages.length - 1) {
      currentIndex++;
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, TestView.routeName);
    }
  }

  void dispose() {
    pageController.dispose();
  }
}
