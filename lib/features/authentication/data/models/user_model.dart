import 'package:sahelmobileapplication/features/authentication/authentication.export.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required int id, required String title, required String body})
      : super(id: id, title: title, body: body);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }


}
