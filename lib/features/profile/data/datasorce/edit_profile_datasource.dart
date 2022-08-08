import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sahelmobileapplication/core/core.export.dart';

abstract class EditProfileRemoteData {
  Future<ApiResponse> onEditProfile(String employeeName,String fatherName,String grandpaName,String familyName, String phoneNumber,String email);
  Future<ApiResponse> onEditProfileImage(File profileImage,String userName);

}
class EditProfileRemoteDataImpl implements EditProfileRemoteData{
  final NetworkInterface? networkImpl;
  EditProfileRemoteDataImpl({this.networkImpl});

  @override
  Future<ApiResponse> onEditProfile(
      String employeeName,
      String fatherName,
      String grandpaName,
      String familyName,
      String phoneNumber,
      String email) async {
    ApiResponse apiResponse;
    debugPrint('===============Remote================');
    debugPrint('employeeName $employeeName');
    debugPrint('fatherName $fatherName');
    debugPrint('grandpaName $grandpaName');
    debugPrint('grandpaName $familyName');
    debugPrint('grandpaName $phoneNumber');
    debugPrint('grandpaName $email');
    debugPrint('===============Remote================');
    apiResponse = await networkImpl!.put('/api/Employee',
      data: jsonEncode(<String, dynamic>{
        'employeeName': employeeName,
        'fatherName': fatherName,
        'grandpaName': grandpaName,
        'familyName': familyName,
        'phoneNumber': phoneNumber,
        'email': email,
      },
      ),
    );
    return apiResponse ;
  }

  @override
  Future<ApiResponse> onEditProfileImage(File profileImage,String userName) async{
    var bytes = profileImage.readAsBytesSync();
    ApiResponse apiResponse;
    debugPrint('===============Remote================');
    debugPrint('profileImage');
    debugPrint('===============Remote================');
    apiResponse = await networkImpl!.post('/api/Employee/UploaProfileImage',
      data: jsonEncode(<String, dynamic>{
        "profileImage":bytes,
        "userName":userName
      },
      ),
      headers: {
        "Content-Type": "multipart/form-data",
        "Accept": "application/json"
      },
    );
    return apiResponse;
  }


}