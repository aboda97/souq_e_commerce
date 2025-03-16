import 'package:flutter/material.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/components/custom_btn.dart';
import 'package:souq_app/core/components/custom_text_form_field.dart';
import 'package:souq_app/core/components/custom_text_span.dart';
import 'package:souq_app/core/utils/app_colors.dart';
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
            borderRadius: kRadiusBtn,
            elevation: 0,
          ),
        ),
        CustomTxtSpan(
          onRegisterTap: () {},
          textOne: S.of(context).doNotHaveAccount,
          textTwo: S.of(context).doNotHaveAccount,
        ),
      ],
    );
  }
}
