import 'dart:io';
import 'package:sahelmobileapplication/core/core.export.dart';

abstract class EditProfileDataRepositories {
  Future<ApiResponse> onEditProfile(String employeeName, String fatherName,
      String grandpaName, String familyName, String phoneNumber, String email);

  Future<ApiResponse> onEditProfileImage(File profileImage,String userName);
}
