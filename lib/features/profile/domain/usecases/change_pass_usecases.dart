import 'package:flutter/material.dart';
import '../../../../core/core.export.dart';
import '../domain.export.dart';

class ChangePassUseCases {
  ///final LoginRemoteDataImpl loginRemoteDataImpl = LoginRemoteDataImpl();
  final ChangePasswordRepositories? changePasswordRepositories;

  ChangePassUseCases({this.changePasswordRepositories});

  Future<ApiResponse> onChangePassword(String username, String newPassword,String currentPassword) async {
    ApiResponse apiResponse;
    debugPrint('=============ChangePassUseCases=================');
    debugPrint(username);
    debugPrint(newPassword);
    debugPrint(currentPassword);
    debugPrint('=============ChangePassUseCases=================');
    apiResponse = await changePasswordRepositories!.onChangePassword(username, newPassword,currentPassword);
    return apiResponse;
  }


}
