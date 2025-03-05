import 'package:flutter/material.dart';
import 'package:souq_app/features/test_feature/presentation/widgets/test_body.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});
  static const String routeName = 'TestView';

  @override
  Widget build(BuildContext context) {
    return TestViewBody();
  }
}
