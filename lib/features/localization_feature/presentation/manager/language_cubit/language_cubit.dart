import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final SharedPreferences _sharedPrefs;

  LanguageCubit(this._sharedPrefs) : super(LanguageInitial());
  Future<void> toggleLanguage() async {
    final newLocale =
        state.locale.languageCode == 'ar'
            ? const Locale('en')
            : const Locale('ar');
    await _sharedPrefs.setString('language_code', newLocale.languageCode);
    emit(LanguageChanged(newLocale));
  }

  Future<void> loadSavedLanguage() async {
    final languageCode = _sharedPrefs.getString('language_code') ?? 'ar';
    emit(LanguageChanged(Locale(languageCode)));
  }
}
