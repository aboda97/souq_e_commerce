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
    return AspectRatio(
      aspectRatio: 342 / 158,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(AssetsPaths.appBgFruitNewPath),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: SvgPicture.asset(AssetsPaths.appGreenBgPath),
          ),
          Positioned(
            right: 30,
            top: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).eidOffer,
                  style: TextStyles.regular13.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  S.of(context).discount,
                  style: TextStyles.bold19.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .25,
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
