import 'package:flutter/material.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/core/utils/app_styles.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'Cairo',
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyles.bold19,
      centerTitle: true,
    ),
  );
}
