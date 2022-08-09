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
    on<GetGalleryImageEvent>(_getProfileImageFromGallery);
    on<GetCameraImageEvent>(_getProfileImageFromCamera);

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

  void _getProfileImageFromGallery(GetGalleryImageEvent event, Emitter<PersonalInfoState> emit) async{
    profileImage = await OpenGallery.getGalleryImage(image: profileImage)
        .catchError((onError) {
      debugPrint('onError $onError');
      ShowToastSnackBar.displayToast(message: '$onError');
      emit(ErrorGetImageState(onError: onError.toString()));
    });
    if(profileImage != null){
      emit(SuccessGetImageState(profileImage: profileImage));
    }


  }

  void _getProfileImageFromCamera(GetCameraImageEvent event, Emitter<PersonalInfoState> emit) async{
    profileImage = await OpenGallery.openCamera(image: profileImage)
        .catchError((onError) {
      debugPrint('onError $onError');
      ShowToastSnackBar.displayToast(message: '$onError');
      emit(ErrorGetImageState(onError: onError.toString()));
    });
    if(profileImage != null){
      emit(SuccessGetImageState(profileImage: profileImage));
    }


  }




}
