import 'package:flutter/material.dart';
import 'package:souq_app/core/components/custom_text_form_field.dart';
import 'package:souq_app/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: S.of(context).userEmail,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
    );
  }
}
