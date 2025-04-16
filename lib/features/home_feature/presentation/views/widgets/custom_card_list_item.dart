// import 'package:flutter/material.dart';
// import 'package:souq_app/constants.dart';
// import 'package:souq_app/core/utils/app_colors.dart';
// import 'package:souq_app/core/utils/app_styles.dart';
// import 'package:souq_app/core/utils/assets_paths.dart';
// import 'package:souq_app/generated/l10n.dart';

// class CustomCardListItem extends StatelessWidget {
//   const CustomCardListItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: AppColors.appCardGeryBgColor,
//         borderRadius: BorderRadius.circular(kRadiusTxtFormField),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.favorite_border_outlined, size: 32),
//             ),
//             Image.asset(AssetsPaths.appStrawberryFruitPath),
//             Text(S.of(context).Strawberry, style: TextStyles.bold16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   '20 ${S.of(context).salary}',
//                   style: TextStyles.bold16.copyWith(
//                     color: AppColors.secondaryColor,
//                   ),
//                 ),
//                 FloatingActionButton(
//                   shape: CircleBorder(),

//                   onPressed: () {},
//                   backgroundColor: AppColors.primaryColor,
//                   child: Icon(Icons.add,color: AppColors.whiteColor,size: 26,),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/core/utils/app_styles.dart';

class CustomCardListItem extends StatelessWidget {
  final String imagePath;
  final String fruitName;
  final String price;
  final VoidCallback onAddPressed;
  const CustomCardListItem({super.key, required this.imagePath, required this.fruitName, required this.price, required this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.appCardGeryBgColor,
            borderRadius: BorderRadius.circular(kRadiusTxtFormField),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.favorite_border_outlined, size: width * 0.12),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: width * 0.5,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                fruitName,
                style: TextStyles.bold16.copyWith(fontSize: width * 0.08),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                     price,
                      style: TextStyles.bold16.copyWith(
                        color: AppColors.secondaryColor,
                        fontSize: width * 0.08,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.25,
                    height: width * 0.25,
                    child: FloatingActionButton(
                      shape: const CircleBorder(),
                      onPressed: onAddPressed,
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.add,
                        color: AppColors.whiteColor,
                        size: width * 0.08,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
