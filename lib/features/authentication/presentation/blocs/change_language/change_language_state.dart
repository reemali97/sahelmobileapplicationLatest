import 'package:flutter/material.dart';

abstract class ChangeLanguageState {}

class ChangeLanguageInitial extends ChangeLanguageState {}

class SuccessChangeLanguageState extends ChangeLanguageState {
  final String? onSuccess;
  final Locale? locale;
  SuccessChangeLanguageState({this.locale, this.onSuccess});


}

class ErrorChangeLanguageState extends ChangeLanguageState {
  final String? onError;
  ErrorChangeLanguageState({this.onError});
}
