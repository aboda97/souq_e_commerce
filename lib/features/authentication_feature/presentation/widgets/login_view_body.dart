import 'package:flutter/material.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/components/custom_btn.dart';
import 'package:souq_app/core/components/custom_text_form_field.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CustomBtnApp(
            text: S.of(context).signIn,
            onPressed: () {},
            textColor: AppColors.whiteColor,
            borderRadius: kRadiusBtn,
            elevation: 0,
          ),
        ),
      ],
    );
  }
}
