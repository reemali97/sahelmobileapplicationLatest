import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class PersonalInfoState extends Equatable {
  @override
  //TODO: implements props
  List<Object?> get props => [];
}

class PersonalInfoInitial extends PersonalInfoState {}

class OnEditState extends PersonalInfoState {
  final bool? isEnable;

  OnEditState({this.isEnable});

  ///[copyWith] function
  /// It is just function from the same data type of class to call it in constructor
  /// when we call this class.
  ///
  /// We use this function to return the state multi time in new value
  /// or to rebuild UI.
  ///
  ///
  /// In this function we check between the old & New value of state
  /// and return it.
  ///
  /// The primary benefit of using [copyWith] is that you don't change the original object,
  /// but instead return a new object with the same properties as the original,
  /// but with the values you specify.
  ///
  ///
  ///
  OnEditState copyWith({
    bool? isEnable,
  }) {
    return OnEditState(
      isEnable: isEnable ?? this.isEnable,
    );
  }

  @override
  List<Object?> get props => [isEnable];
}

class SuccessSaveState extends PersonalInfoState {
  final String? onSuccess;

  SuccessSaveState({this.onSuccess});



}

class ErrorSaveState extends PersonalInfoState {
  final String? onError;
  ErrorSaveState({this.onError});
}

class SuccessGetImageState extends PersonalInfoState{
  final File? profileImage;
  SuccessGetImageState({this.profileImage});

  SuccessGetImageState copyWith({
    File? profileImage,
  }) {
    return SuccessGetImageState(
      profileImage: profileImage ?? this.profileImage,
    );
  }

  @override
  List<Object?> get props => [profileImage];


}

class ErrorGetImageState extends PersonalInfoState{
  final String? onError;
  ErrorGetImageState({this.onError});
}

