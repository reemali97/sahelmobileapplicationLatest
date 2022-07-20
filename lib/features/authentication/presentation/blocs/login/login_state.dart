import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginState extends Equatable {
  @override
  //TODO: implements props
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class GetTokenState extends LoginState {
  final String? token;
  GetTokenState({this.token});

  GetTokenState copyWith({
    String? token,
  }) {
    return GetTokenState(
      token: token ?? this.token,
    );
}
   @override
   List<Object?> get props => [token];

}

class ErrorGetTokenState extends LoginState {
  String? error;
  ErrorGetTokenState({
     this.error,
  });

  ErrorGetTokenState copyWith({
     String? error,

  }) {
    return ErrorGetTokenState(
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [error];


}

class PasswordVisibilityState extends LoginState {
  bool? isVisible;
  IconData? modeIcon ;
  PasswordVisibilityState({
    this.isVisible,
    this.modeIcon,
  });

  PasswordVisibilityState copyWith({
    String? error,

  }) {
    return PasswordVisibilityState(
      isVisible: isVisible ?? this.isVisible,
      modeIcon: modeIcon ?? this.modeIcon,
    );
  }

  @override
  List<Object?> get props => [isVisible,isVisible];


}

class SuccessGetUserDataState extends LoginState {}


