import 'package:flutter/material.dart';
import 'package:souq_app/features/authentication_feature/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginViewBody());
  }
}
