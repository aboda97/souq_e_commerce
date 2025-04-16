import 'package:flutter/material.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/core/utils/app_styles.dart';
import 'package:souq_app/core/utils/assets_paths.dart';
import 'package:souq_app/generated/l10n.dart';

class CustomCardListItem extends StatelessWidget {
  const CustomCardListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.appCardGeryBgColor,
        borderRadius: BorderRadius.circular(kRadiusTxtFormField),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined, size: 32),
            ),
            Image.asset(AssetsPaths.appStrawberryFruitPath),
            Text(S.of(context).Strawberry, style: TextStyles.bold16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '20 ${S.of(context).salary}',
                  style: TextStyles.bold16.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                FloatingActionButton(
                  shape: CircleBorder(),
                  
                  onPressed: () {},
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(Icons.add,color: AppColors.whiteColor,size: 26,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
