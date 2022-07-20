import 'package:flutter/material.dart';

import '../../../../core/core.export.dart';
import '../../../features.export.dart';

class AuthenticationUseCases {
  ///final LoginRemoteDataImpl loginRemoteDataImpl = LoginRemoteDataImpl();
  final AuthenticationRepositories? authenticationRepositories;

  AuthenticationUseCases({this.authenticationRepositories});

   Future<ApiResponse> getToken(String username, String password) async {
    ApiResponse apiResponse;
     debugPrint('=============getToken=================');
     debugPrint(username);
     debugPrint(password);
     debugPrint('=============getToken=================');
     apiResponse =  await authenticationRepositories!.getToken(username, password);
     return apiResponse;
  }
  Future<ApiResponse> getUserData(String username,String token) async {
    ApiResponse apiResponse;
     debugPrint('=============getUserData=================');
     debugPrint(username);
     debugPrint('=============getUserData=================');
     apiResponse =  await authenticationRepositories!.getUserData(username,token);
     return apiResponse;
  }

}
