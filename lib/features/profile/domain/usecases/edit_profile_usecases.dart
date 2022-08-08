import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sahelmobileapplication/core/core.export.dart';
import '../domain.export.dart';

class EditProfileDataUseCases {
  ///final LoginRemoteDataImpl loginRemoteDataImpl = LoginRemoteDataImpl();
  final EditProfileDataRepositories? editProfileDataRepositories;

  EditProfileDataUseCases({this.editProfileDataRepositories});

  Future<ApiResponse> onEditProfileData(
      String? employeeName,
      String? fatherName,
      String? grandpaName,
      String? familyName,
      String? phoneNumber,
      String? email) async {
    ApiResponse apiResponse;
    debugPrint('=============EditProfileDataUseCases=================');
    debugPrint(employeeName);
    debugPrint(fatherName);
    debugPrint(grandpaName);
    debugPrint(familyName);
    debugPrint(phoneNumber);
    debugPrint(email);
    debugPrint('=============EditProfileDataUseCases=================');
    apiResponse = await editProfileDataRepositories!.onEditProfile(
        employeeName!,
        fatherName!,
        grandpaName!,
        familyName!,
        phoneNumber!,
        email!);
    return apiResponse;
  }

  Future<ApiResponse> onEditProfileImage(File? profileImage,String? userName) async {
    ApiResponse apiResponse;
    debugPrint('=============EditProfileDataUseCases=================');
    debugPrint("profileImage");
    debugPrint('=============EditProfileDataUseCases=================');
    apiResponse =
        await editProfileDataRepositories!.onEditProfileImage(profileImage!,userName!);
    return apiResponse;
  }
}