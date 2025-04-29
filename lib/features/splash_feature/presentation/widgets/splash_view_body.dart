import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/helper_functions/excution_navigator.dart';
import 'package:souq_app/core/helper_functions/localization_lan_checker.dart';
import 'package:souq_app/core/services/fire_base_auth_service.dart';
import 'package:souq_app/core/services/service_locator.dart';
import 'package:souq_app/core/services/shared_preferences.dart';
import 'package:souq_app/core/utils/assets_paths.dart';
import 'package:souq_app/features/authentication_feature/presentation/views/login_view.dart';
import 'package:souq_app/features/home_feature/presentation/views/home_view.dart';
import 'package:souq_app/features/on_boarding_feature/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    bool isOnBoardingViewSeen = SharedPreferencesService.getBool(
      kIsOnBoardingViewSeen,
    );
    if (isOnBoardingViewSeen) {
      var isUserSignedIn = serviceLocator<FireBaseAuthService>().isUserSignedIn();
      if (isUserSignedIn) {
        executionPushReplacmentNamedNavigator(context, HomeView.routeName, 2);
      } else {
        executionPushReplacmentNamedNavigator(context, LoginView.routeName, 2);
      }
    } else {
      executionPushReplacmentNamedNavigator(
        context,
        OnBoardingView.routeName,
        2,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment:
                languageIsArabic()
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
            children: [SvgPicture.asset(AssetsPaths.splashPlantPath)],
          ),
          SvgPicture.asset(AssetsPaths.splashLogoPath),
          SvgPicture.asset(AssetsPaths.splashBubblePath, fit: BoxFit.fill),
        ],
      ),
    );
  }
}
