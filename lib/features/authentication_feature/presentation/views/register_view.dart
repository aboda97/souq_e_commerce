import 'package:flutter/material.dart';
import 'package:souq_app/core/components/custom_app_bar.dart';
import 'package:souq_app/core/components/excution_navigator.dart';
import 'package:souq_app/core/components/toggle_language.dart';
import 'package:souq_app/features/authentication_feature/presentation/views/login_view.dart';
import 'package:souq_app/features/authentication_feature/presentation/widgets/register_view_body.dart';
import 'package:souq_app/generated/l10n.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = 'RegisterView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: S.of(context).signUp,
        actions: [ToggleLanguage()],
        leading: IconButton(
          onPressed: () {
            executionPushReplacmentNamedNavigator(context, LoginView.routeName, 0);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: RegisterViewBody());
  }
}
