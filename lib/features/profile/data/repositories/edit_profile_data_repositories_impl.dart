import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sahelmobileapplication/core/core.export.dart';
import 'package:sahelmobileapplication/features/profile/domain/domain.export.dart';

import '../data.export.dart';

class EditProfileDataRepositoriesImpl extends EditProfileDataRepositories {
  final EditProfileRemoteData? editProfileRemoteData;
  EditProfileDataRepositoriesImpl({this.editProfileRemoteData});
  @override
  Future<ApiResponse> onEditProfile(
      String employeeName,
      String fatherName,
      String grandpaName,
      String familyName,
      String phoneNumber,
      String email) async {
    try{
      debugPrint('===============EditRepoImpl=============');
      debugPrint('employeeName $employeeName');
      debugPrint('fatherName $fatherName');
      debugPrint('grandpaName $grandpaName');
      debugPrint('grandpaName $familyName');
      debugPrint('grandpaName $phoneNumber');
      debugPrint('grandpaName $email');
      debugPrint('===============EditRepoImpl=============');
      ApiResponse apiResponse = await editProfileRemoteData!
          .onEditProfile(employeeName, fatherName, grandpaName, familyName, phoneNumber, email);
      debugPrint(apiResponse.data.toString());
      return apiResponse;
    }catch(onError){
      debugPrint(onError.toString());
      throw '';
    }
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> onEditProfileImage(File profileImage, String userName) async{
    try{
      debugPrint('===============EditRepoImpl=============');
      debugPrint('profileImage');
      debugPrint('userName $userName');
      debugPrint('===============EditRepoImpl=============');
      ApiResponse apiResponse = await editProfileRemoteData!.onEditProfileImage(profileImage, userName);
      return apiResponse;
    }catch(onError){
      debugPrint(onError.toString());
      throw '';
    }
  }


}