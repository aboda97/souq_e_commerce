import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/components/custom_clip_card.dart';
import 'package:souq_app/core/localization/language_cubit.dart';
import 'package:souq_app/core/localization/language_state.dart';
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
                value: state.locale.languageCode == kArabicLang,
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
          return Center(
            child: Column(
              children: [
                Text(S.of(context).body),
                SizedBox(height: 24.0),
                ClipPath(
                  clipper: CustomClipCard(isLeft: true), 
                  child: Container(
                    color: Colors.green,
                    width: 170,
                    height: 150,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

