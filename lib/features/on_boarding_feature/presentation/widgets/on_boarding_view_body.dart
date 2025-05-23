import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/components/custom_btn.dart';
import 'package:souq_app/core/helper_functions/excution_navigator.dart';
import 'package:souq_app/core/services/shared_preferences.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/features/authentication_feature/presentation/views/login_view.dart';
import 'package:souq_app/features/on_boarding_feature/presentation/widgets/on_boarding_page_view.dart';
import 'package:souq_app/generated/l10n.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;

  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color:
                currentPage == 1
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withValues(alpha: .5,),
          ),
        ),
        const SizedBox(height: 29),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .95,
            child: CustomBtnApp(
              text: S.of(context).startNow,
              onPressed: () {
                SharedPreferencesService.setBool(kIsOnBoardingViewSeen, true);
                executionPushReplacmentNamedNavigator(
                  context,
                  LoginView.routeName,
                  2,
                );
              },
              textColor: AppColors.whiteColor,
              borderRadius: kBorderRadius,
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
