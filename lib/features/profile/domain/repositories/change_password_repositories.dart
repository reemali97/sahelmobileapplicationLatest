import '../../../../core/network/api_response_model.dart';

abstract class ChangePasswordRepositories{
  Future<ApiResponse> onChangePassword(String username, String newPassword,String currentPassword);

}