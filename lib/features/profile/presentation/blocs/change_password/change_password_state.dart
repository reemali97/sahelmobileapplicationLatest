abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class SuccessChangePassword extends ChangePasswordState {
  final String? success;
  SuccessChangePassword({
    this.success,
  });
}

class ErrorChangePassword extends ChangePasswordState {
  final String? onError;

  ErrorChangePassword({
    this.onError,
  });


}
