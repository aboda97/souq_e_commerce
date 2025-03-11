import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/services/shared_preferences.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  Future<void> toggleLanguage() async {
    final newLocale =
        state.locale.languageCode == kArabicLang
            ? const Locale(kEnglishLang)
            : const Locale(kArabicLang);
    await SharedPreferencesService.setString(
      kAppLanguage,
      newLocale.languageCode,
    );

    emit(LanguageChanged(newLocale));
  }

  Future<void> loadSavedLanguage() async {
    final languageCode = SharedPreferencesService.getString(kAppLanguage);

    emit(
      LanguageChanged(
        Locale(languageCode.isNotEmpty ? languageCode : kArabicLang),
      ),
    );
  }
}
