import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/services/shared_preferences.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  // final SharedPreferences _sharedPrefs;

  LanguageCubit() : super(LanguageInitial());
  Future<void> toggleLanguage() async {
    final newLocale =
        state.locale.languageCode == 'ar'
            ? const Locale('en')
            : const Locale('ar');
    //  await _sharedPrefs.setString('language_code', newLocale.languageCode);
    await SharedPreferencesService.setString(
      kAppLanguage,
      newLocale.languageCode,
    );
    emit(LanguageChanged(newLocale));
  }

  Future<void> loadSavedLanguage() async {
    // final languageCode = _sharedPrefs.getString('language_code') ?? 'ar';
    final languageCode =
        SharedPreferencesService.getString(kAppLanguage) ?? 'ar';
    emit(LanguageChanged(Locale(languageCode)));
  }
}
