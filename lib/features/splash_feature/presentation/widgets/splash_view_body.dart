import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq_app/core/components/excution_navigator.dart';
import 'package:souq_app/core/utils/assets_paths.dart';
import 'package:souq_app/features/on_boarding_feature/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executionPushReplacmentNamedNavigator(context, OnBoardingView.routeName, 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [SvgPicture.asset(AssetsPaths.splashPlantPath)],
          ),
          SvgPicture.asset(AssetsPaths.splashLogoPath),
          SvgPicture.asset(AssetsPaths.splashBubblePath, fit: BoxFit.fill),
        ],
      ),
    );
  }
}
