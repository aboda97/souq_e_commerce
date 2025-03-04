import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final SharedPreferences _prefs;

  LanguageCubit(this._prefs) : super(LanguageInitial());

  Future<void> toggleLanguage() async {
    final newLocale =
        state.locale.languageCode == 'en'
            ? const Locale('ar')
            : const Locale('en');
    await _prefs.setString('language_code',
    newLocale.languageCode);
    emit(LanguageChanged(newLocale));
  }

  Future<void> loadSavedLanguage() async {
    final languageCode = _prefs.getString('language_code') ?? 'en';
    emit(LanguageChanged(Locale(languageCode)));
  }
}
