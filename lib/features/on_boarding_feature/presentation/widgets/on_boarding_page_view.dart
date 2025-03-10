import 'package:flutter/material.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/core/utils/app_styles.dart';
import 'package:souq_app/core/utils/assets_paths.dart';
import 'package:souq_app/features/on_boarding_feature/presentation/widgets/page_view_items.dart';

import '../../../../generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  final PageController pageController;

  const OnBoardingPageView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageviewItem(
          isVisible: true,
          image: AssetsPaths.onBoardingImgOnePath,
          backgroundImage: AssetsPaths.bgOnBoardingImgOnePath,
          subtitle: S.of(context).onBoardingDesc1,

          //'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                //'مرحبًا بك في',
                S.of(context).onBoardingTitle1,
                style: TextStyles.bold23,
              ),
              Text(
                '  HUB',
                style: TextStyles.bold23.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                'Fruit',
                style: TextStyles.bold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        PageviewItem(
          isVisible: false,
          image: AssetsPaths.onBoardingImgTwoPath,
          backgroundImage: AssetsPaths.bgOnBoardingImgTwoPath,
          subtitle:
              // 'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
              S.of(context).onBoardingDesc2,
          title: Text(
            //'ابحث وتسوق',
            S.of(context).onBoardingTitle2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF0C0D0D),
              fontSize: 23,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
      ],
    );
  }
}
