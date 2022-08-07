import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'change_password_bloc.export.dart';



class ChangePasswordBloc extends Cubit<ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitial());
  static ChangePasswordBloc get(context) => BlocProvider.of(context);
  bool? oldPasswordVisibility = true;
  bool? newPasswordVisibility = true;
  bool? confirmPasswordVisibility = true;

  void onVisibilityOldPass(){
    oldPasswordVisibility=!oldPasswordVisibility!;
    emit(OnVisibilityOldPassState());
  }
  void onVisibilityNewPass(){
    newPasswordVisibility=!newPasswordVisibility!;
    emit(OnVisibilityNewPassState());
  }
  void onVisibilityConfirmPass(){
    confirmPasswordVisibility=!confirmPasswordVisibility!;
    emit(OnVisibilityConfirmPassState());
  }
  Future<void> onChangePassword(BuildContext context) async{
    try{
      emit(SuccessChangePassword(success:"Success"));
    }
    catch(onError){
      emit(ErrorChangePassword(onError: onError.toString()));
    }

  }
}

