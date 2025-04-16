import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq_app/core/components/custom_btn.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/core/utils/app_styles.dart';
import 'package:souq_app/core/utils/assets_paths.dart';
import 'package:souq_app/generated/l10n.dart';

class CustomCardOfferItem extends StatelessWidget {
  const CustomCardOfferItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Image.asset(AssetsPaths.appBgFruitNewPath),
          SvgPicture.asset(AssetsPaths.appGreenBgPath),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
            width: MediaQuery.of(context).size.width/2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).eidOffer,
                  style: TextStyles.regular13.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  S.of(context).discount,
                  style: TextStyles.bold19.copyWith(color: AppColors.whiteColor),
                ),
                SizedBox(height: 8,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.3,
                  child: CustomBtnApp(
                    text: S.of(context).shopNow,
                    onPressed: () {},
                    textColor: AppColors.primaryColor,
                    borderRadius: 4,
                    elevation: 0,
                    backgroundColor: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
