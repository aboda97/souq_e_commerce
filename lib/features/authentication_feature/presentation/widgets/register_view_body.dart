import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/components/custom_btn.dart';
import 'package:souq_app/core/components/custom_snack_bar.dart';
import 'package:souq_app/core/components/custom_text_form_field.dart';
import 'package:souq_app/core/components/custom_text_span.dart';
import 'package:souq_app/core/components/excution_navigator.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/features/authentication_feature/presentation/manager/sign_up_cubit/register_cubit.dart';
import 'package:souq_app/features/authentication_feature/presentation/manager/sign_up_cubit/register_state.dart';
import 'package:souq_app/features/authentication_feature/presentation/views/login_view.dart';
import 'package:souq_app/features/authentication_feature/presentation/widgets/build_agreement_check_box.dart';
import 'package:souq_app/features/test_localization_feature/presentation/views/test.dart';
import 'package:souq_app/generated/l10n.dart';

class RegisterViewBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          CustomTextFormField(
            controller: nameController,
            hintText: S.of(context).fullName,
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
            suffixIcon: Icons.remove_red_eye_rounded,
            onSuffixTap: () {},
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
          buildAgreementCheckbox(context),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: BlocConsumer<RegisterCubit, RegisterStates>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                 showSnackBar(context, S.of(context).snackBarSuccessAlert, AppColors.primaryColor);
                  executionPushReplacmentNamedNavigator(context, TestView.routeName, 0);
                } else if (state is RegisterFailure) {
                  showSnackBar(context, state.failure.errMsg, Colors.red);
                }
              },
              builder: (context, state) {
                return CustomBtnApp(
                  text: S.of(context).registerNow,
                  isLoading: state is RegisterLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<RegisterCubit>(
                        context,
                      ).registerByEmailAndPassword(
                        emailController.text,
                        passwordController.text,
                        nameController.text,
                      );
                    }
                  },
                  textColor: AppColors.whiteColor,
                  borderRadius: kBorderRadius,
                  elevation: 0,
                );
              },
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
      ),
    );
  }
}
