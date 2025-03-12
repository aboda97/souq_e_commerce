import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_app/core/localization/language_cubit.dart';

class ToggleLanguage extends StatelessWidget {
  const ToggleLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<LanguageCubit>(context).toggleLanguage();
      },
      icon: Icon(Icons.language),
    );
  }
}
