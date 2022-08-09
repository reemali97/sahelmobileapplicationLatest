import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/core.export.dart';
import '../../../../features.export.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {

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

  Future<void> _onSave(OnSaveEvent event, Emitter<PersonalInfoState> emit) async {
    String? employeeName = event.employeeName;
    String? fatherName = event.fatherName;
    String? grandpaName = event.grandpaName;
    String? familyName = event.familyName;
    String? phoneNumber = event.phoneNumber;
    String? email =event.email;
    File? imageUrl =event.imageUrl;

    try {
      ApiResponse? apiResponse;
      ApiResponse? apiResponseImage;

      // await editProfileDataUseCases!
      //     .onEditProfileData(employeeName!, fatherName!, grandpaName!,
      //         familyName!, phoneNumber!, email!)
      //     .then((value) => {apiResponse = value});

      await editProfileDataUseCases!
          .onEditProfileImage(imageUrl!, userName)
          .then((value) => {apiResponseImage = value});
//apiResponse!.data == true &&
      if ( apiResponseImage!.data == true) {
        emit(SuccessSaveState(onSuccess: 'Edit successfully'));
      }
    } catch (onError) {
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
