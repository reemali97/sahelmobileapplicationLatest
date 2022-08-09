import '../../../data/models/error_change_pass_model.dart';

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
  final ErrorChangePassModel? errorChangePassModel;

  ErrorChangePasswordState({
    this.onError,
    this.errorChangePassModel,
  });

  ErrorChangePasswordState copyWith({
    String? onError,
    ErrorChangePassModel? errorChangePassModel,

  }) {
    return ErrorChangePasswordState(
      onError: onError ?? this.onError,
      errorChangePassModel: errorChangePassModel ?? this.errorChangePassModel,

    );
  }

  @override
  List<Object?> get props => [onError,errorChangePassModel];
}

class OldPasswordVisibilityState extends ChangePasswordState {}

class NewPasswordVisibilityState extends ChangePasswordState {}

class ConfirmPasswordVisibilityState extends ChangePasswordState {}

class SetInitStatusState extends ChangePasswordState {}
