import 'package:flutter/material.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/components/custom_btn.dart';
import 'package:souq_app/core/components/custom_login_social.dart';
import 'package:souq_app/core/components/custom_text_form_field.dart';
import 'package:souq_app/core/components/custom_text_span.dart';
import 'package:souq_app/core/components/excution_navigator.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/core/utils/app_styles.dart';
import 'package:souq_app/core/utils/assets_paths.dart';
import 'package:souq_app/features/authentication_feature/presentation/views/register_view.dart';
import 'package:souq_app/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      children: [
        CustomTextFormField(
          hintText: S.of(context).userEmail,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'هذا الحقل مطلوب';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          suffixIcon: Icons.remove_red_eye_rounded,
          onSuffixTap: (){},
          hintText: S.of(context).userPassword,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'هذا الحقل مطلوب';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(S.of(context).forgetPassword),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: CustomBtnApp(
            text: S.of(context).signIn,
            onPressed: () {},
            textColor: AppColors.whiteColor,
            borderRadius: kBorderRadius,
            elevation: 0,
          ),
        ),
        Center(
          child: CustomTxtSpan(
            onRegisterTap: () {
              executionPushReplacmentNamedNavigator(
                context,
                RegisterView.routeName,
                0,
              );
            },
            textOne: S.of(context).doNotHaveAccount,
            textTwo: S.of(context).registerNow,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Row(
            children: [
              Expanded(child: Divider(color: Colors.grey, thickness: 1)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
                child: Text(S.of(context).or, style: TextStyles.bold16),
              ),
              Expanded(child: Divider(color: Colors.grey, thickness: 1)),
            ],
          ),
        ),
        CustomLoginSocial(
          assetIconPath: AssetsPaths.googleIconPath,
          title: S.of(context).signInByGoogle,
          onPressed: () {},
        ),
        CustomLoginSocial(
          assetIconPath: AssetsPaths.appleIconPath,
          title: S.of(context).signInByApple,
          onPressed: () {},
        ),
        CustomLoginSocial(
          assetIconPath: AssetsPaths.facebookIconPath,
          title: S.of(context).signInByFacebook,
          onPressed: () {},
        ),
      ],
    );
  }
}
