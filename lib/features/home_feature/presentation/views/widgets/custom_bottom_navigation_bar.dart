import 'package:flutter/material.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/core/utils/assets_paths.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/de_avtive_items.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       height: 70,
       decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
       ),
       child:DeActiveItem(imagePath: AssetsPaths.appNavBarDeActiveProfilePngPath)
    );
  }
}