import 'package:flutter/material.dart';
import 'package:souq_app/core/localization/language_cubit.dart';
import 'package:souq_app/core/services/service_locator.dart';

class ToggleLanguage extends StatelessWidget {
  const ToggleLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        //  BlocProvider.of<LanguageCubit>(context).toggleLanguage();
        serviceLocator<LanguageCubit>().toggleLanguage();
      },
      icon: Icon(Icons.language),
    );
  }
}
