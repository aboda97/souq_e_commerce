import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_app/core/components/custom_app_bar.dart';
import 'package:souq_app/core/components/toggle_language.dart';
import 'package:souq_app/core/services/service_locator.dart';
import 'package:souq_app/features/authentication_feature/presentation/manager/sign_in_cubit/login_cubit.dart';
import 'package:souq_app/features/authentication_feature/presentation/widgets/login_view_body.dart';
import 'package:souq_app/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'LoginView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<LoginCubit>(),
      child: Scaffold(
        appBar: customAppBar(
          title: S.of(context).signIn,
          actions: [ToggleLanguage()],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: LoginViewBody(),
      ),
    );
  }
}
