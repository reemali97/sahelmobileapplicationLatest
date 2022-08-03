import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahelmobileapplication/core/core.export.dart';
import 'change_password_state.dart';

class ChangePasswordBloc extends Cubit<ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitial());

  static ChangePasswordBloc get(context) => BlocProvider.of(context);

  Future<void> onChangePassword(BuildContext context) async {
    try {
      emit(SuccessChangePassword(success: 'success'));
    } catch (onError) {
      ProgressCircleDialog.dismiss(context);
      emit(ErrorChangePassword(onError: onError.toString()));

    }
  }
}
