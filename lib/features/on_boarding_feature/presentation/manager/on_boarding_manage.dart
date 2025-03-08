import 'package:flutter/material.dart';
import 'package:souq_app/core/utils/assets_paths.dart';
import 'package:souq_app/features/on_boarding_feature/data/models/on_boarding_model.dart';
import 'package:souq_app/features/test_feature/presentation/views/test.dart';

class OnBoardingManage extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;

  List<OnBoardingModel> onboardingPages = [
    OnBoardingModel(
      title: "مرحبًا بك في FruitHUB",
      description: "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة.",
      imagePath: AssetsPaths.bgOnBoardingImgOnePath,
      bgPath:  AssetsPaths.bgOnBoardingImgOnePath
    ),
    OnBoardingModel(
      title: "ابحث وتسوق",
      description: "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية.",
      imagePath: AssetsPaths.onBoardingImgTwoPath,
      bgPath:  AssetsPaths.bgOnBoardingImgTwoPath
    ),
  ];
void updatePageIndex(int index, Function setStateCallback) {
    currentPage = index;
    setStateCallback(); // Calls setState in the UI
  }

  void nextPage(Function setStateCallback) {
    if (currentPage < onboardingPages.length - 1) {
      pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void previousPage(Function setStateCallback) {
    if (currentPage > 0) {
      pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void goToHome(BuildContext context) {
    // Navigate to Home Screen
    Navigator.pushReplacementNamed(context, "/home");
  }
}