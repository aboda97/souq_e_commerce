// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter Localization Demo`
  String get title {
    return Intl.message(
      'Flutter Localization Demo',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// ` Welcome to Flutter Localization Demo`
  String get body {
    return Intl.message(
      ' Welcome to Flutter Localization Demo',
      name: 'body',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Or`
  String get or {
    return Intl.message('Or', name: 'or', desc: '', args: []);
  }

  /// `Start Now`
  String get startNow {
    return Intl.message('Start Now', name: 'startNow', desc: '', args: []);
  }

  /// `Welcome to`
  String get onBoardingTitle1 {
    return Intl.message(
      'Welcome to',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and get the best deals and highest quality.`
  String get onBoardingDesc1 {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and get the best deals and highest quality.',
      name: 'onBoardingDesc1',
      desc: '',
      args: [],
    );
  }

  /// `Search and shop`
  String get onBoardingTitle2 {
    return Intl.message(
      'Search and shop',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the finest, carefully selected fruits. Check out the details, photos, and reviews to make sure you're choosing the perfect fruit.`
  String get onBoardingDesc2 {
    return Intl.message(
      'We offer you the finest, carefully selected fruits. Check out the details, photos, and reviews to make sure you\'re choosing the perfect fruit.',
      name: 'onBoardingDesc2',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Email`
  String get userEmail {
    return Intl.message('Email', name: 'userEmail', desc: '', args: []);
  }

  /// `This Field is Required`
  String get fieldRequired {
    return Intl.message(
      'This Field is Required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get userPassword {
    return Intl.message('Password', name: 'userPassword', desc: '', args: []);
  }

  /// `New Password`
  String get newUserPassword {
    return Intl.message(
      'New Password',
      name: 'newUserPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create a new password to log in`
  String get makeNewPassword {
    return Intl.message(
      'Create a new password to log in',
      name: 'makeNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `The password has been changed successfully.`
  String get passwordChanged {
    return Intl.message(
      'The password has been changed successfully.',
      name: 'passwordChanged',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't Have an Account`
  String get doNotHaveAccount {
    return Intl.message(
      'Don\'t Have an Account',
      name: 'doNotHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already Have an Account`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already Have an Account',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register Now`
  String get registerNow {
    return Intl.message(
      'Register Now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Sign in by Google`
  String get signInByGoogle {
    return Intl.message(
      'Sign in by Google',
      name: 'signInByGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in by Apple`
  String get signInByApple {
    return Intl.message(
      'Sign in by Apple',
      name: 'signInByApple',
      desc: '',
      args: [],
    );
  }

  /// `Sign in by Facebook`
  String get signInByFacebook {
    return Intl.message(
      'Sign in by Facebook',
      name: 'signInByFacebook',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to`
  String get appRulesCheckBox {
    return Intl.message(
      'By creating an account, you agree to',
      name: 'appRulesCheckBox',
      desc: '',
      args: [],
    );
  }

  /// `Our Terms and Conditions`
  String get appRulesNote {
    return Intl.message(
      'Our Terms and Conditions',
      name: 'appRulesNote',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'don\'tWorryForForgettingPassword' key
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
