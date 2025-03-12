import 'package:flutter/material.dart';
import 'package:souq_app/features/authentication_feature/presentation/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String routeName = 'RegisterView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RegisterViewBody());
  }
}
