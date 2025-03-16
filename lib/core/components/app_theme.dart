import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/core/utils/app_styles.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'Cairo',
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyles.bold19.copyWith(color: Colors.black),
      centerTitle: true,
    ),
  );
}
