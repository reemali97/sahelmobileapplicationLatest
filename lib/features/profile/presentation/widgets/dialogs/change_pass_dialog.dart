import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/core.export.dart';
import '../../../profile.export.dart';

class ChangePasswordDialog {
  static final _formKey = GlobalKey<FormState>();
  static var oldPassController = TextEditingController();
  static var newPassController = TextEditingController();
  static var confirmPassController = TextEditingController();
  static var iconsColor = ColorHelper.primaryColor;

  static Future<void> showChangPasswordDialog({BuildContext? context}) async {
    return showDialog(
      context: context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        var changePassBloc = ChangePasswordBloc.get(context);
        return BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
          listener: (context, state) {
            if (state is SuccessChangePasswordState) {
              ShowToastSnackBar.showSnackBars(context, message: state.success);
            }
            if (state is ErrorChangePasswordState) {
              ShowToastSnackBar.showSnackBars(context, message: state.errorChangePassModel!.detail);
            }
          },
          builder: (context, state) {
            return AlertDialog(
              title: const Center(
                child: Text(
                  'Change Password',
                  style: TextStyle(
                    color: ColorHelper.primaryColor,
                    fontFamily: FontsHelper.cairo,
                  ),
                ),
              ),
              content: SizedBox(
                height: 200,
                width: getScreenWidth(context),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(

                      children: [
                        TextFieldApp(
                          controller: oldPassController,
                          labelText: "Old Password",
                          labelStyle: const TextStyle(
                              fontSize: 16,
                              color: ColorHelper.primaryColor2,
                              fontFamily: FontsHelper.cairo),
                          borderColor: Colors.grey,
                          borderRadius: 4,
                          obscureText: changePassBloc.isOldVisible,
                          suffixIcon: IconButton(
                            onPressed: () =>
                                changePassBloc.onVisibilityOldPassword(),
                            icon: Icon(
                              changePassBloc.oldIcon,
                              color: iconsColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldApp(
                          controller: newPassController,
                          labelText: "New Password",
                          labelStyle: const TextStyle(
                              fontSize: 16,
                              color: ColorHelper.primaryColor2,
                              fontFamily: FontsHelper.cairo),
                          borderColor: Colors.grey,
                          borderRadius: 4,
                          obscureText: changePassBloc.isNewVisible,
                          suffixIcon: IconButton(
                            color: iconsColor,
                            onPressed: () =>
                                changePassBloc.onVisibilityNewPassword(),
                            icon: Icon(
                              changePassBloc.newIcon,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldApp(
                          controller: confirmPassController,
                          labelText: "Confirm New Password",
                          labelStyle: const TextStyle(
                              fontSize: 16,
                              color: ColorHelper.primaryColor2,
                              fontFamily: FontsHelper.cairo),
                          borderColor: Colors.grey,
                          borderRadius: 4,
                          obscureText: changePassBloc.isConfirmVisible,
                          suffixIcon: IconButton(
                            color: iconsColor,
                            onPressed: () =>
                                changePassBloc.onVisibilityConfirmPassword(),
                            icon: Icon(
                              changePassBloc.confirmIcon,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                Row(

                  children: [
                    passDialogButton(
                      context: context,
                      title: 'Close',
                      onPressed: () => onClose(context: context),
                      textColor: Colors.black,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    passDialogButton(
                      context: context,
                      title: 'Save',
                      onPressed: () => onSave(context: context),
                      backgroundColor: ColorHelper.primaryColor,
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  static Widget passDialogButton({
    BuildContext? context,
    VoidCallback? onPressed,
    String? title = '',
    Color? textColor,
    Color? backgroundColor = Colors.white,
  }) {
    return Expanded(
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        child: Text(
          '$title',
          style: TextStyle(color: textColor ?? Colors.white),
        ),
        onPressed: onPressed ?? () {},
      ),
    );
  }

  static void onClose({BuildContext? context}) {
    if (isControllersNotEmpty()) {
      onClearControllers();
    }
    Navigator.pop(context!);
  }

  static void onSave({BuildContext? context}) {
    if(!_formKey.currentState!.validate()){
      return ;
    }
    String? _userName =Auth.currentUser!.user!.userName;
    String? _oldPassword=oldPassController.text;
    String? _newPassword=newPassController.text;
    String? _currentPassword=oldPassController.text;
    if (isControllersEmpty()) {
      ShowToastSnackBar.showSnackBars(context!,
          message: 'Old/New/Confirm password must be not empty');
      return;
    }
    ChangePasswordBloc.get(context)
        .onChangePassword(
            context: context!,
            userName: _userName,
            newPassword: _newPassword,
            currentPassword: _currentPassword)
        .then((value) => {onClearControllers()}).catchError((onError){

    });
    Navigator.pop(context);
  }

  static void onClearControllers() {
    if (isControllersNotEmpty()) {
      oldPassController.clear();
      newPassController.clear();
      confirmPassController.clear();
      return;
    }
  }

  static bool isControllersNotEmpty() {
    if (oldPassController.text.isNotEmpty ||
        newPassController.text.isNotEmpty ||
        confirmPassController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static bool isControllersEmpty() {
    if (oldPassController.text.isEmpty ||
        newPassController.text.isEmpty ||
        confirmPassController.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
