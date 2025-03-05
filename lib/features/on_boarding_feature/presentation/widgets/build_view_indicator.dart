import 'package:flutter/material.dart';
import 'package:souq_app/features/on_boarding_feature/presentation/manager/on_boarding_manage.dart';

Widget buildViewIndicator() {
  final OnBoardingManage onBoardingManage = OnBoardingManage();
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(onBoardingManage.pages.length, (index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: onBoardingManage.currentIndex == index ? 12 : 8,
        height: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              onBoardingManage.currentIndex == index
                  ? Colors.blue
                  : Colors.grey,
        ),
      );
    }),
  );
}
