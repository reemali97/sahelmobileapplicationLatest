import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../features/features.export.dart';
import '../../core.export.dart';

class Auth {
  Auth._();
  static UserModel? currentUser;

  static Future<UserModel?> getUserFromPref() async {
    String jsonUser;
    try {
      jsonUser = CacheHelper.getData(key: 'User_Cache') ;
    } catch (e) {
      debugPrint('****** ${e.toString()}');
      return null;
    }
    Map<String, dynamic> userMap = json.decode(jsonUser);
    return UserModel.fromJson(userMap);
  }



  static Future updateUserInPref({UserModel? user}) async {
    Map userMap;
    userMap = user!.toJson();
    String userJson = json.encode(userMap);
    currentUser = user;
    await CacheHelper.saveData(key: 'User_Cache', value: userJson);
  }



  static Future removeUserFromPref() async {
    await CacheHelper.removeData(key: 'User_Cache');
  }

}
