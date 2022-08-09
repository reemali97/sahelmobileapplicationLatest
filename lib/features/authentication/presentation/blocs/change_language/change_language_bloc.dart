import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/core.export.dart';
import 'change_language_state.dart';

class ChangeLanguageBloc extends Cubit<ChangeLanguageState> {
  ChangeLanguageBloc() : super(ChangeLanguageInitial());
  static ChangeLanguageBloc get(context) => BlocProvider.of(context);

  Locale? _locale;

  Locale get locale => _locale!;

  void setLocale({String? langCode}) {
    if(langCode!.isNotEmpty){
      CacheHelper.removeData(key: 'languages',);
      _locale = Locale.fromSubtags(languageCode: langCode);
      CacheHelper.saveData(key: 'languages', value: langCode);
      emit(SuccessChangeLanguageState(onSuccess: 'Success change language',locale: locale));
    }
    else{
      emit(ErrorChangeLanguageState(onError: 'Unable change language'));
    }

  }

}
