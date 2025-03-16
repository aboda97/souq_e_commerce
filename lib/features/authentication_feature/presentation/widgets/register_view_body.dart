import 'package:flutter/material.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/components/custom_btn.dart';
import 'package:souq_app/core/components/custom_text_form_field.dart';
import 'package:souq_app/core/components/custom_text_span.dart';
import 'package:souq_app/core/components/excution_navigator.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/features/authentication_feature/presentation/views/login_view.dart';
import 'package:souq_app/generated/l10n.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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
          onSuffixTap: () {},
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
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  4,
                ), 
              ),
              value: true,
              onChanged: (bool? value) {},
            ),
            Expanded(
              child: CustomTxtSpan(
                onRegisterTap: () {},
                textOne: S.of(context).appRulesCheckBox,
                textTwo: S.of(context).appRulesNote,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: CustomBtnApp(
            text: S.of(context).registerNow,
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
                LoginView.routeName,
                0,
              );
            },
            textOne: S.of(context).alreadyHaveAccount,
            textTwo: S.of(context).signIn,
          ),
        ),
      ],
    );
  }
}
