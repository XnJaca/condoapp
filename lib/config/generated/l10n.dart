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

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Was sucessfully registered.`
  String get message_sucess {
    return Intl.message(
      'Was sucessfully registered.',
      name: 'message_sucess',
      desc: '',
      args: [],
    );
  }

  /// `An internal problem occurredo.`
  String get message_error {
    return Intl.message(
      'An internal problem occurredo.',
      name: 'message_error',
      desc: '',
      args: [],
    );
  }

  /// `Mail is required`
  String get message_email {
    return Intl.message(
      'Mail is required',
      name: 'message_email',
      desc: '',
      args: [],
    );
  }

  /// `The entered value does not look like an email.`
  String get message_email2 {
    return Intl.message(
      'The entered value does not look like an email.',
      name: 'message_email2',
      desc: '',
      args: [],
    );
  }

  /// `Phone is required.`
  String get message_phone {
    return Intl.message(
      'Phone is required.',
      name: 'message_phone',
      desc: '',
      args: [],
    );
  }

  /// `Identification required`
  String get message_identification {
    return Intl.message(
      'Identification required',
      name: 'message_identification',
      desc: '',
      args: [],
    );
  }

  /// `Data does not match with the registered.`
  String get message_error_recovery {
    return Intl.message(
      'Data does not match with the registered.',
      name: 'message_error_recovery',
      desc: '',
      args: [],
    );
  }

  /// `Verification successful, you will soon receive an email with a temporary password.`
  String get message_verify_recovery {
    return Intl.message(
      'Verification successful, you will soon receive an email with a temporary password.',
      name: 'message_verify_recovery',
      desc: '',
      args: [],
    );
  }

  /// `Password is required.`
  String get message_password {
    return Intl.message(
      'Password is required.',
      name: 'message_password',
      desc: '',
      args: [],
    );
  }

  /// `Name is required.`
  String get message_name {
    return Intl.message(
      'Name is required.',
      name: 'message_name',
      desc: '',
      args: [],
    );
  }

  /// `First last name is required.`
  String get message_first_last_name {
    return Intl.message(
      'First last name is required.',
      name: 'message_first_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Second last name is required.`
  String get message_second_last_name {
    return Intl.message(
      'Second last name is required.',
      name: 'message_second_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Date is required.`
  String get message_date {
    return Intl.message(
      'Date is required.',
      name: 'message_date',
      desc: '',
      args: [],
    );
  }

  /// `Data are missing.`
  String get message_required_data {
    return Intl.message(
      'Data are missing.',
      name: 'message_required_data',
      desc: '',
      args: [],
    );
  }

  /// `The passwords with different.`
  String get message_password_register {
    return Intl.message(
      'The passwords with different.',
      name: 'message_password_register',
      desc: '',
      args: [],
    );
  }

  /// `Previously registered mail.`
  String get message_email_register {
    return Intl.message(
      'Previously registered mail.',
      name: 'message_email_register',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth required.`
  String get message_date_birth {
    return Intl.message(
      'Date of birth required.',
      name: 'message_date_birth',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect user name and/or password`
  String get message_login_failure {
    return Intl.message(
      'Incorrect user name and/or password',
      name: 'message_login_failure',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get lbl_login {
    return Intl.message(
      'Login',
      name: 'lbl_login',
      desc: '',
      args: [],
    );
  }

  /// `Email:`
  String get lbl_email {
    return Intl.message(
      'Email:',
      name: 'lbl_email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get lbl_password {
    return Intl.message(
      'Password',
      name: 'lbl_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get lbl_confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'lbl_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Recover password`
  String get lbl_record_password {
    return Intl.message(
      'Recover password',
      name: 'lbl_record_password',
      desc: '',
      args: [],
    );
  }

  /// `Identification`
  String get lbl_identification {
    return Intl.message(
      'Identification',
      name: 'lbl_identification',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get lbl_phone {
    return Intl.message(
      'Phone',
      name: 'lbl_phone',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get lbl_name {
    return Intl.message(
      'Name',
      name: 'lbl_name',
      desc: '',
      args: [],
    );
  }

  /// `First Last Name`
  String get lbl_first_last_name {
    return Intl.message(
      'First Last Name',
      name: 'lbl_first_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Second Last Name`
  String get lbl_second_last_name {
    return Intl.message(
      'Second Last Name',
      name: 'lbl_second_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get lbl_date_birth {
    return Intl.message(
      'Date of Birth',
      name: 'lbl_date_birth',
      desc: '',
      args: [],
    );
  }

  /// `Step`
  String get lbl_step {
    return Intl.message(
      'Step',
      name: 'lbl_step',
      desc: '',
      args: [],
    );
  }

  /// `of`
  String get lbl_of {
    return Intl.message(
      'of',
      name: 'lbl_of',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get lbl_finish {
    return Intl.message(
      'Register',
      name: 'lbl_finish',
      desc: '',
      args: [],
    );
  }

  /// `Type of identification:`
  String get lbl_type_identification {
    return Intl.message(
      'Type of identification:',
      name: 'lbl_type_identification',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get btn_login {
    return Intl.message(
      'Login',
      name: 'btn_login',
      desc: '',
      args: [],
    );
  }

  /// `Wait`
  String get btn_login2 {
    return Intl.message(
      'Wait',
      name: 'btn_login2',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get btn_recuperar {
    return Intl.message(
      'Forgot your password?',
      name: 'btn_recuperar',
      desc: '',
      args: [],
    );
  }

  /// `You don't have an account yet?`
  String get btn_register {
    return Intl.message(
      'You don\'t have an account yet?',
      name: 'btn_register',
      desc: '',
      args: [],
    );
  }

  /// `  Sign in`
  String get btn_register1 {
    return Intl.message(
      '  Sign in',
      name: 'btn_register1',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get btn_verify {
    return Intl.message(
      'Verify',
      name: 'btn_verify',
      desc: '',
      args: [],
    );
  }

  /// `Next  `
  String get btn_next {
    return Intl.message(
      'Next  ',
      name: 'btn_next',
      desc: '',
      args: [],
    );
  }

  /// `  Back`
  String get btn_back {
    return Intl.message(
      '  Back',
      name: 'btn_back',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get btn_save {
    return Intl.message(
      'Save',
      name: 'btn_save',
      desc: '',
      args: [],
    );
  }

  /// `Saving...`
  String get btn_saving {
    return Intl.message(
      'Saving...',
      name: 'btn_saving',
      desc: '',
      args: [],
    );
  }

  /// `Cédula`
  String get option_type_identification {
    return Intl.message(
      'Cédula',
      name: 'option_type_identification',
      desc: '',
      args: [],
    );
  }

  /// `Passport`
  String get option_type_passport {
    return Intl.message(
      'Passport',
      name: 'option_type_passport',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get title_account {
    return Intl.message(
      'Account',
      name: 'title_account',
      desc: '',
      args: [],
    );
  }

  /// `  Register User`
  String get title_register {
    return Intl.message(
      '  Register User',
      name: 'title_register',
      desc: '',
      args: [],
    );
  }

  /// `Información General`
  String get tittle_register_general {
    return Intl.message(
      'Información General',
      name: 'tittle_register_general',
      desc: '',
      args: [],
    );
  }

  /// `User Information`
  String get tittle_register_user {
    return Intl.message(
      'User Information',
      name: 'tittle_register_user',
      desc: '',
      args: [],
    );
  }

  /// `Task`
  String get menu_task {
    return Intl.message(
      'Task',
      name: 'menu_task',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get menu_report {
    return Intl.message(
      'Reports',
      name: 'menu_report',
      desc: '',
      args: [],
    );
  }

  /// `Releases`
  String get menu_pizarra {
    return Intl.message(
      'Releases',
      name: 'menu_pizarra',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get menu_home {
    return Intl.message(
      'Home',
      name: 'menu_home',
      desc: '',
      args: [],
    );
  }

  /// `Detail Farm`
  String get title_detail_farm {
    return Intl.message(
      'Detail Farm',
      name: 'title_detail_farm',
      desc: '',
      args: [],
    );
  }

  /// `Habitants`
  String get lbl_habitant {
    return Intl.message(
      'Habitants',
      name: 'lbl_habitant',
      desc: '',
      args: [],
    );
  }

  /// `Not`
  String get lbl_not {
    return Intl.message(
      'Not',
      name: 'lbl_not',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get lbl_yes {
    return Intl.message(
      'Yes',
      name: 'lbl_yes',
      desc: '',
      args: [],
    );
  }

  /// `Rented`
  String get lbl_rented {
    return Intl.message(
      'Rented',
      name: 'lbl_rented',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get title_message {
    return Intl.message(
      'Messages',
      name: 'title_message',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get tab_message_send {
    return Intl.message(
      'Send',
      name: 'tab_message_send',
      desc: '',
      args: [],
    );
  }

  /// `Received`
  String get tab_message_received {
    return Intl.message(
      'Received',
      name: 'tab_message_received',
      desc: '',
      args: [],
    );
  }

  /// `No messages`
  String get not_message {
    return Intl.message(
      'No messages',
      name: 'not_message',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'CR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
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
