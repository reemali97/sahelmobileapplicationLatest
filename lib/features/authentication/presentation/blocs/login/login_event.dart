

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  @override
  //TODO: implements props
  List<Object?> get props => [];
}

class GetTokenEvent extends LoginEvent{
  final BuildContext context;
  final String userName;
  final String passWord;
  GetTokenEvent( {
    required this.context,
    required this.userName,
    required this.passWord,
  });

}
class PasswordVisibilityEvent extends LoginEvent{

  PasswordVisibilityEvent();

}


