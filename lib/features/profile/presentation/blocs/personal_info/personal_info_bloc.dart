import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features.export.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {

  static PersonalInfoBloc get(context) => BlocProvider.of(context);

  PersonalInfoBloc() : super(PersonalInfoInitial()) {
    on<OnEditEvent>(_onEdit);
    on<OnSaveEvent>(_onSave);

  }

  bool? isEnable = false;

  void _onEdit(OnEditEvent event, Emitter<PersonalInfoState> emit) {
    isEnable = !isEnable!;
    emit(OnEditState(isEnable: isEnable));
  }

  void _onSave(OnSaveEvent event, Emitter<PersonalInfoState> emit) {
    String? employeeName = event.employeeName;
    String? fatherName = event.fatherName;
    String? grandpaName = event.grandpaName;
    String? familyName = event.familyName;
    String? phoneNumber = event.phoneNumber;
    String? email =event.email;
    String? imageUrl =event.imageUrl;

    try{

      emit(SuccessSaveState(onSuccess: 'Edit successfully'));
    }
    catch(onError){
      debugPrint(onError.toString());
      emit(ErrorSaveState(onError: onError.toString()));
    }

  }
}
