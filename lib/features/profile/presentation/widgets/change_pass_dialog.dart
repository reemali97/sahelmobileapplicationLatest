import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahelmobileapplication/core/core.export.dart';
import 'package:sahelmobileapplication/features/profile/presentation/blocs/change_password/change_password_bloc.export.dart';

class ChangePasswordDialog {
  static final _formKey = GlobalKey<FormState>();
  static var oldPassController = TextEditingController();
  static var newPassController = TextEditingController();
  static var confirmPassController = TextEditingController();

  static Future<void> showChangPasswordDialog({BuildContext? context}) async {
    return showDialog(
      context: context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
          listener: (context, state) {
            if(state is SuccessChangePassword){
              ShowToastSnackBar.showSnackBars(context, message: state.success);
            } if(state is ErrorChangePassword){
              ShowToastSnackBar.showSnackBars(context, message: state.onError);
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
                width: double.infinity,
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFieldApp(
                          obscureText: ChangePasswordBloc.get(context).oldPasswordVisibility,
                          controller: oldPassController,
                          labelText: "Old Password",
                          labelStyle: const TextStyle(
                              fontSize: 16,
                              color: ColorHelper.primaryColor2,
                              fontFamily: FontsHelper.cairo),
                          borderColor: Colors.grey,
                          borderRadius: 4,
                          suffixIcon: IconButton(
                              onPressed: () {
                                ChangePasswordBloc.get(context).onVisibilityOldPass();
                              },
                              icon: ChangePasswordBloc.get(context).oldPasswordVisibility==true? const Icon(Icons.visibility) :const Icon(Icons.visibility_off)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldApp(
                          obscureText:ChangePasswordBloc.get(context).newPasswordVisibility,
                          controller: newPassController,
                          labelText: "New Password",
                          labelStyle: const TextStyle(
                              fontSize: 16,
                              color: ColorHelper.primaryColor2,
                              fontFamily: FontsHelper.cairo),
                          borderColor: Colors.grey,
                          borderRadius: 4,
                          suffixIcon: IconButton(
                              onPressed: () {
                                ChangePasswordBloc.get(context).onVisibilityNewPass();
                              },
                              icon: ChangePasswordBloc.get(context).newPasswordVisibility==true? const Icon(Icons.visibility) :const Icon(Icons.visibility_off)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldApp(
                          obscureText: ChangePasswordBloc.get(context).confirmPasswordVisibility,
                          controller: confirmPassController,
                          labelText: "Confirm New Password",
                          labelStyle: const TextStyle(
                              fontSize: 16,
                              color: ColorHelper.primaryColor2,
                              fontFamily: FontsHelper.cairo),
                          borderColor: Colors.grey,
                          borderRadius: 4,
                          suffixIcon: IconButton(
                              onPressed: () {
                                ChangePasswordBloc.get(context).onVisibilityConfirmPass();
                                },
                              icon:  ChangePasswordBloc.get(context).confirmPasswordVisibility==true? const Icon(Icons.visibility) :const Icon(Icons.visibility_off)),
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
                      onPressed: () => Navigator.pop(context),
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

  static Widget passDialogButton(
      {BuildContext? context,
        VoidCallback? onPressed,
        String? title = '',
        Color? textColor,
        Color? backgroundColor = Colors.white}) {
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

  static void onSave({BuildContext? context}) {
    if (oldPassController.text.isEmpty ||
        newPassController.text.isEmpty ||
        confirmPassController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(context!,
          message: 'Old/New/Confirm password must be not empty');
      return;
    }

    ChangePasswordBloc.get(context).onChangePassword(context!);
    Navigator.pop(context);
  }
}