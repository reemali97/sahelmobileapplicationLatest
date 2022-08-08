import 'package:flutter/material.dart';
import '../../../../../core/core.export.dart';
import '../../../../authentication/authentication.export.dart';

class LogoutDialog{

  static Future<void> showLogoutDialog({BuildContext? context}) async {
    return showDialog(
      context: context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
              child: Text(
              'Logout',
              style: TextStyle(
                  fontFamily: FontsHelper.cairo,
                  color: ColorHelper.primaryColor),
            ),
          ),
          content: SizedBox(

            height: 50.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Are you sure you want to Logout?',
                  style: TextStyle(
                    fontFamily: FontsHelper.cairo,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                logoutDialogButton(
                  title: 'Close',
                  context: context,
                  textColor: Colors.black,
                  onPressed: () => onClose(context: context),
                ),
                const SizedBox(
                  width: 10,
                ),
                logoutDialogButton(
                  title: 'Yes',
                  context: context,
                  onPressed: () => onLogout(context: context),
                  textColor: Colors.white,
                  backgroundColor: ColorHelper.primaryColor,

                ),

              ],
            ),
          ],
        );
      },
    );
  }

  static Widget logoutDialogButton({
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


  static void onLogout({BuildContext? context}){
    openNewPage(context!, LoginScreen(), popPreviousPages: true);
  }
  static void onClose({BuildContext? context}){
    Navigator.pop(context!);

  }



}