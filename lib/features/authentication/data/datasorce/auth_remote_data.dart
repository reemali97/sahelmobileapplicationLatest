import 'dart:convert';
import 'package:flutter/cupertino.dart';

import '../../../../core/core.export.dart';



abstract class AuthenticationRemoteData {

  Future<ApiResponse> getToken(String email , String password);
  Future<ApiResponse> getUserData(String userName,String token);

}

class AuthenticationRemoteDataImpl implements AuthenticationRemoteData{
  final NetworkInterface? networkImpl;
  AuthenticationRemoteDataImpl({this.networkImpl});
  @override
  Future<ApiResponse> getToken(String username, String password,) async{
     ApiResponse apiResponse;
      debugPrint('===============Remote================');
      debugPrint('userName $username');
      debugPrint('password $password');
      debugPrint('===============Remote================');
      apiResponse = await networkImpl!.post('/api/Account/loginmob',
        data: jsonEncode(<String, dynamic>{
            'userName': username,
            'password': password,
          },
        ),
      );
      return apiResponse ;
  }
  @override
  Future<ApiResponse> getUserData(String userName,String token) async{
    ApiResponse apiResponse;
    debugPrint('===============Remote|UserName================');
    debugPrint('userName $userName');
    debugPrint('===============RemoteUserName================');
    apiResponse = await networkImpl!.post('/api/Account/getUser',
      data: jsonEncode(<String, dynamic>{
        'userName': userName,
      },
      ),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        });
    return apiResponse ;
  }




}