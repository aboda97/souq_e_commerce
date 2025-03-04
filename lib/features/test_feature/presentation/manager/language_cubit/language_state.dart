import 'package:flutter/material.dart';

abstract class LanguageState {
  final Locale locale;
  LanguageState(this.locale);
}

class LanguageInitial extends LanguageState {
  LanguageInitial() : super(const Locale('en')); 
}

class LanguageChanged extends LanguageState {
  LanguageChanged(Locale locale) : super(locale);
}
