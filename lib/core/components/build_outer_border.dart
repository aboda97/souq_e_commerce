import 'package:flutter/material.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/utils/app_colors.dart';

OutlineInputBorder buildOuterBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(
      width: 1,
      color: AppColors.outLineBorderTxtFormField,
    ),
  );
}

OutlineInputBorder buildErrorOuterBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(kRadiusTxtFormField),
    borderSide: BorderSide(width: 1, color: Colors.red),
  );
}
