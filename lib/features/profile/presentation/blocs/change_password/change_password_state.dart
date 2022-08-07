
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}
class SuccessChangePassword extends ChangePasswordState {
  final String? success;

  SuccessChangePassword({this.success});
}

class OnVisibilityOldPassState extends ChangePasswordState{
  @override
  List<Object?> get props => [];
}

class OnVisibilityNewPassState extends ChangePasswordState{
  @override
  List<Object?> get props => [];
}

class OnVisibilityConfirmPassState extends ChangePasswordState{
  @override
  List<Object?> get props => [];
}

class ErrorChangePassword extends ChangePasswordState {
  final String? onError;

  ErrorChangePassword({this.onError});
}
