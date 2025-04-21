import 'package:flutter/material.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String routeName = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(child: HomeViewBody(),
    ),
    
    );
  }
}
