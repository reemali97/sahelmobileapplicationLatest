import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../../core/core.export.dart';

abstract class ChangePasswordRemoteData {
  Future<ApiResponse> onChangePassword(String username, String newPassword, String currentPassword);

}
class ChangePasswordRemoteDataImpl implements ChangePasswordRemoteData{
  final NetworkInterface? networkImpl;
  ChangePasswordRemoteDataImpl({this.networkImpl});

  @override
  Future<ApiResponse> onChangePassword(String username, String newPassword, String currentPassword) async{
    ApiResponse apiResponse;
    debugPrint('===============Remote================');
    debugPrint('userName $username');
    debugPrint('password $newPassword');
    debugPrint('password $currentPassword');
    debugPrint('===============Remote================');
    apiResponse = await networkImpl!.post('/api/account/ChangeUserPassword',
      data: jsonEncode(<String, dynamic>{
        'UserName': username,
        'newPassword': newPassword,
        'currentPassword': currentPassword,
      },
      ),
    );
    return apiResponse ;



  }


}
