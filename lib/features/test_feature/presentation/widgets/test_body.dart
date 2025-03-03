import 'package:flutter/material.dart';
import 'package:souq_app/generated/l10n.dart';

class TestViewBody extends StatelessWidget {
  const TestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).title), centerTitle: true),
    );
  }
}
