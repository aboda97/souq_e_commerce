import 'package:flutter/material.dart';
import 'package:souq_app/features/authentication_feature/presentation/views/login_view.dart';
import 'package:souq_app/features/authentication_feature/presentation/views/register_view.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/home_bottom_navigation_bar.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/home_view_body.dart';
import 'package:souq_app/features/test_localization_feature/presentation/views/test.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeViewBody()),
      bottomNavigationBar: HomeBottomNavigationBar(
        pages: [HomeView(), TestView(), LoginView(), RegisterView()],
      ),
    );
  }
}
