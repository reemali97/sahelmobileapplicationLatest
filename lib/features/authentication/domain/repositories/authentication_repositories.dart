import '../../../../core/network/api_response_model.dart';

abstract class AuthenticationRepositories{
  Future<ApiResponse> getToken(String username, String password);
  Future<ApiResponse> getUserData(String username,String token);

}