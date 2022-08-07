import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/core.export.dart';
import '../../../../features.export.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {

  static PersonalInfoBloc get(context) => BlocProvider.of(context);

  PersonalInfoBloc() : super(PersonalInfoInitial()) {
    on<OnEditEvent>(_onEdit);
    on<OnSaveEvent>(_onSave);
    on<AddProfileImageEvent>(_addProfileImage);

  }

  bool? isEnable = false;
  File? profileImage;

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

  void _addProfileImage(AddProfileImageEvent event, Emitter<PersonalInfoState> emit) async{
    profileImage = await OpenGallery.getGalleryImage(image: profileImage)
        .then((value) {})
        .catchError((onError) {
      debugPrint('onError $onError');
      ///ShowToastSnackBar.showSnackBars(event.context!, message: '$onError');
      emit(ErrorGetImageState(onError: onError.toString()));
    });

    debugPrint('=================================================================');
    debugPrint(profileImage.toString());
    debugPrint('=================================================================');



    if(profileImage != null){
      emit(SuccessGetImageState(profileImage: profileImage));
    }


  }




}
