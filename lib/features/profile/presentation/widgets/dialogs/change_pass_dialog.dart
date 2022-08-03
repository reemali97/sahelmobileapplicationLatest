import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/core.export.dart';
import '../../../profile.export.dart';


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
                          controller: oldPassController,
                          labelText: "Old Password",
                          labelStyle: const TextStyle(
                              fontSize: 16,
                              color: ColorHelper.primaryColor2,
                              fontFamily: FontsHelper.cairo),
                          borderColor: Colors.grey,
                          borderRadius: 4,
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.visibility)),
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
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.visibility)),
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
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.visibility)),
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
