import 'package:flutter/material.dart';
import 'package:sahelmobileapplication/core/network/api_response_model.dart';

import '../../domain/domain.export.dart';
import '../datasorce/change_password_datasource.dart';

class ChangePasswordRepositoriesImpl extends ChangePasswordRepositories {
  final ChangePasswordRemoteData? changePasswordRemoteData;
  ChangePasswordRepositoriesImpl({this.changePasswordRemoteData});
  @override
  Future<ApiResponse> onChangePassword(String username, String newPassword, String currentPassword) async{
    try{
      debugPrint('===============authRepoImpl=============');
      debugPrint('userName $username');
      debugPrint('password $newPassword');
      debugPrint('password $currentPassword');
      debugPrint('===============authRepoImpl=============');
      ApiResponse apiResponse = await changePasswordRemoteData!
          .onChangePassword(username, newPassword, currentPassword);
      debugPrint(apiResponse.data.toString());
      return apiResponse;
    }catch(onError){
      debugPrint(onError.toString());
      throw '';
    }








    throw UnimplementedError();
  }
}



