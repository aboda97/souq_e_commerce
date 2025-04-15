import 'package:flutter/material.dart';
import 'package:souq_app/core/components/custom_text_form_field.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:souq_app/generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHomeAppBar(),
        CustomTextFormField(
          prefixIcon: Icons.search_outlined,
          onPressed: (){},
          suffixIcon: Icons.tune_outlined,
          hintText: S.of(context).searchForHome,
        )
      ],
    );
  }
}