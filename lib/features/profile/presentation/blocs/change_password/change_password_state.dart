abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class SuccessChangePasswordState extends ChangePasswordState {
  final String? success;
  SuccessChangePasswordState({
    this.success,
  });
}

class ErrorChangePasswordState extends ChangePasswordState {
  final String? onError;

  ErrorChangePasswordState({
    this.onError,
  });


}

class OldPasswordVisibilityState extends ChangePasswordState {}

class NewPasswordVisibilityState extends ChangePasswordState {}

class ConfirmPasswordVisibilityState extends ChangePasswordState {}

class SetInitStatusState extends ChangePasswordState {}





