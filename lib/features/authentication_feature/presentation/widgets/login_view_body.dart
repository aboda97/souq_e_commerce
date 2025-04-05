// class LoginViewBody extends StatelessWidget {
//   const LoginViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//       children: [
//         CustomTextFormField(
//           hintText: S.of(context).userEmail,
//           keyboardType: TextInputType.emailAddress,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return S.of(context).fieldRequired;
//             }
//             return null;
//           },
//         ),
//         const SizedBox(height: 16),
//         CustomTextFormField(
//           suffixIcon: Icons.remove_red_eye_rounded,
//           onPressed: () {},
//           hintText: S.of(context).userPassword,
//           keyboardType: TextInputType.text,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return S.of(context).fieldRequired;
//             }
//             return null;
//           },
//         ),
//         const SizedBox(height: 16),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             TextButton(
//               onPressed: () {},
//               child: Text(S.of(context).forgetPassword),
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 32),
//           child: CustomBtnApp(
//             text: S.of(context).signIn,
//             onPressed: () {},
//             textColor: AppColors.whiteColor,
//             borderRadius: kBorderRadius,
//             elevation: 0,
//           ),
//         ),
//         Center(
//           child: CustomTxtSpan(
//             onRegisterTap: () {
//               executionPushReplacmentNamedNavigator(
//                 context,
//                 RegisterView.routeName,
//                 0,
//               );
//             },
//             textOne: S.of(context).doNotHaveAccount,
//             textTwo: S.of(context).registerNow,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 32.0),
//           child: Row(
//             children: [
//               Expanded(child: Divider(color: Colors.grey, thickness: 1)),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
//                 child: Text(S.of(context).or, style: TextStyles.bold16),
//               ),
//               Expanded(child: Divider(color: Colors.grey, thickness: 1)),
//             ],
//           ),
//         ),
//         CustomLoginSocial(
//           assetIconPath: AssetsPaths.googleIconPath,
//           title: S.of(context).signInByGoogle,
//           onPressed: () {},
//         ),
//         CustomLoginSocial(
//           assetIconPath: AssetsPaths.appleIconPath,
//           title: S.of(context).signInByApple,
//           onPressed: () {},
//         ),
//         CustomLoginSocial(
//           assetIconPath: AssetsPaths.facebookIconPath,
//           title: S.of(context).signInByFacebook,
//           onPressed: () {},
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/components/custom_btn.dart';
import 'package:souq_app/core/components/custom_login_social.dart';
import 'package:souq_app/core/components/custom_text_form_field.dart';
import 'package:souq_app/core/components/custom_text_span.dart';
import 'package:souq_app/core/helper_functions/build_snack_bar.dart';
import 'package:souq_app/core/helper_functions/excution_navigator.dart';
import 'package:souq_app/core/services/service_locator.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/core/utils/app_styles.dart';
import 'package:souq_app/core/utils/assets_paths.dart';
import 'package:souq_app/features/authentication_feature/presentation/manager/sign_in_cubit/login_cubit.dart';
import 'package:souq_app/features/authentication_feature/presentation/manager/sign_in_cubit/login_states.dart';
import 'package:souq_app/features/authentication_feature/presentation/views/register_view.dart';
import 'package:souq_app/features/test_localization_feature/presentation/views/test.dart';
import 'package:souq_app/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showSnackBar(
            context,
            S.of(context).snackBarSuccessAlert,
            AppColors.primaryColor,
          );
          executionPushReplacmentNamedNavigator(context, TestView.routeName, 0);
        } else if (state is LoginFailure) {
          showSnackBar(context, state.failure.errMsg, Colors.red);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            children: [
              CustomTextFormField(
                controller: emailController,
                hintText: S.of(context).userEmail,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).fieldRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: passwordController,
                obscureText:
                    !BlocProvider.of<LoginCubit>(context).isPasswordVisible,
                suffixIcon:
                    BlocProvider.of<LoginCubit>(context).isPasswordVisible
                        ? Icons.remove_red_eye_rounded
                        : Icons.visibility_off,
                onPressed: () {
                  BlocProvider.of<LoginCubit>(
                    context,
                  ).togglePasswordVisibility();
                },
                hintText: S.of(context).userPassword,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).fieldRequired;
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
                  isLoading: state is LoginLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      serviceLocator<LoginCubit>().loginByEmailAndPassword(
                        emailController.text,
                        passwordController.text,
                      );
                    }
                  },
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
                      padding: EdgeInsets.symmetric(
                        horizontal: kHorizintalPadding,
                      ),
                      child: Text(S.of(context).or, style: TextStyles.bold16),
                    ),
                    Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                  ],
                ),
              ),
              CustomLoginSocial(
                assetIconPath: AssetsPaths.googleIconPath,
                title: S.of(context).signInByGoogle,
                onPressed: () {
                  BlocProvider.of<LoginCubit>(context).signInWithGoogle();
                },
              ),
              CustomLoginSocial(
                assetIconPath: AssetsPaths.appleIconPath,
                title: S.of(context).signInByApple,
                onPressed: () {
                  BlocProvider.of<LoginCubit>(context).signInWithApple();
                },
              ),
              CustomLoginSocial(
                assetIconPath: AssetsPaths.facebookIconPath,
                title: S.of(context).signInByFacebook,
                onPressed: () {
                  BlocProvider.of<LoginCubit>(context).signInWithFacebook();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
