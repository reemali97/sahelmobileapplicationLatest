import 'package:flutter/cupertino.dart';
import 'package:sahelmobileapplication/core/network/api_response_model.dart';
import 'package:sahelmobileapplication/features/authentication/authentication.export.dart';

class AuthenticationRepositoriesImpl implements AuthenticationRepositories{
  final AuthenticationRemoteData? authenticationRemoteData;

  AuthenticationRepositoriesImpl({
    this.authenticationRemoteData,
  });
  @override
  Future<ApiResponse> getToken(String username, String password,) async{
     try{
      debugPrint('===============authRepoImpl=============');
      debugPrint('userName $username');
      debugPrint('password $password');
      debugPrint('===============authRepoImpl=============');

      ApiResponse apiResponse = await authenticationRemoteData!.getToken(username, password,);
      debugPrint(apiResponse.data.toString());
      return apiResponse;

    }catch(onError){
      debugPrint(onError.toString());
      throw '';
    }

  }

  @override
  Future<ApiResponse> getUserData(String username,String token) async{
    ApiResponse apiResponse;
    debugPrint('===============authRepoGetUserDataImpl=============');
    debugPrint('userName $username');
    debugPrint('===============authRepoGetUserDataImpl=============');
    apiResponse = await authenticationRemoteData!.getUserData(username,token);
    return apiResponse;
  }



}