import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_app/features/test_feature/presentation/manager/language_cubit/language_cubit.dart';
import 'package:souq_app/features/test_feature/presentation/manager/language_cubit/language_state.dart';
import 'package:souq_app/generated/l10n.dart';

class TestViewBody extends StatelessWidget {
  const TestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.read<LanguageCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
        centerTitle: true,
        actions: [
          BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return Switch(
                value: state.locale.languageCode == 'ar',
                onChanged: (value) {
                  languageCubit.toggleLanguage();
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return Text(S.of(context).body);
        },
      ),
    );
  }
}
