import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahelmobileapplication/features/features.export.dart';
import '../../../../../core/core.export.dart';


class ChangePasswordBloc extends Cubit<ChangePasswordState> {
  final ChangePassUseCases? changePassUseCases;
  ChangePasswordBloc({this.changePassUseCases}) : super(ChangePasswordInitial());

  static ChangePasswordBloc get(context) => BlocProvider.of(context);

  Future<void> onChangePassword(
      {BuildContext? context,
      String? userName,
      String? newPassword,
      String? currentPassword}) async {
      String? _userName =userName;
      String? _newPassword=newPassword;
      String? _currentPassword=currentPassword;
      ApiResponse? apiResponse ;
      ErrorChangePassModel errorChangePassModel;
      try {
       await changePassUseCases!.onChangePassword(_userName!,_newPassword!,_currentPassword!).then((value) => {
         apiResponse = value
       });

       if(apiResponse!.data == true){
       emit(SuccessChangePasswordState(success: 'success'));
       return ;
       }
       else{
         errorChangePassModel = ErrorChangePassModel.fromJson(apiResponse!.data!);
         ShowToastSnackBar.showSnackBars(context!, message: '${errorChangePassModel.detail}');
         emit(ErrorChangePasswordState(errorChangePassModel:errorChangePassModel));
       }
    } catch (onError) {
      errorChangePassModel = ErrorChangePassModel.fromJson(apiResponse!.data);
      ShowToastSnackBar.showSnackBars(context!, message: '${errorChangePassModel.detail}');
      emit(ErrorChangePasswordState(onError: onError.toString()));

    }
  }

  bool isOldVisible = true;
  IconData? oldIcon = Icons.visibility_off;
  void onVisibilityOldPassword() {
    isOldVisible = !isOldVisible;
    oldIcon = isOldVisible ? Icons.visibility_off: Icons.visibility ;
    emit(OldPasswordVisibilityState());
  }

  bool isNewVisible = true;
  IconData? newIcon = Icons.visibility_off;
  void onVisibilityNewPassword() {
    isNewVisible = !isNewVisible;
    newIcon = isNewVisible ? Icons.visibility_off: Icons.visibility ;
    emit(NewPasswordVisibilityState());
  }

  bool isConfirmVisible = true;
  IconData? confirmIcon = Icons.visibility_off;
  void onVisibilityConfirmPassword() {
    isConfirmVisible = !isConfirmVisible;
    confirmIcon = isConfirmVisible ? Icons.visibility_off: Icons.visibility ;
    emit(ConfirmPasswordVisibilityState());
  }

  void setInitStatus() {
    if (isOldVisible == false ||
        isNewVisible == false ||
        isConfirmVisible == false) {
      isOldVisible == true;
      isNewVisible == true;
      isConfirmVisible == true;
      emit(SetInitStatusState());
    }
  }

}
