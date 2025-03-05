import 'package:flutter/material.dart';
import 'package:souq_app/features/on_boarding_feature/presentation/manager/on_boarding_manage.dart';
import 'package:souq_app/features/on_boarding_feature/presentation/widgets/build_on_boarding_view.dart';
import 'package:souq_app/features/on_boarding_feature/presentation/widgets/build_view_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final OnBoardingManage onBoardingManage = OnBoardingManage();

  @override
  void initState() {
    super.initState();
    onBoardingManage.pageController.addListener(() {
      setState(() {
        onBoardingManage.currentIndex =
            onBoardingManage.pageController.page?.round() ?? 0;
      });
    });
  }

  void dispose() {
    onBoardingManage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: onBoardingManage.pageController,
              itemCount: onBoardingManage.pages.length,
              itemBuilder: (context, index) {
                return buildOnBoardingView(onBoardingManage.pages[index]);
              },
            ),
          ),
          buildViewIndicator(),
          _buildNextButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return ElevatedButton(
      onPressed: () {
        onBoardingManage.nextPage(context);
      },
      child: Text(
        onBoardingManage.currentIndex < onBoardingManage.pages.length - 1
            ? "Next"
            : "Get Started",
      ),
    );
  }
}
