import 'package:flutter/material.dart';
import 'package:sahelmobileapplication/core/core.export.dart';

Future<void> languageDialog({BuildContext? context}) async {
  return showDialog(
    context: context!,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Language'),
        content: SizedBox(
          height: 100,
          child: Column(
            children: [
              dialogButton(title: 'العربية'),
              dialogButton(title: 'English'),

            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget dialogButton({
  String? title,
  Color? buttonColor,
  Color? textColor,
  Function? onPressed
}) {
  return SizedBox(
    width: double.infinity,
    child: MaterialButton(
      onPressed: () {},
      color: buttonColor ?? ColorHelper.primaryColor,
      child: Text(
        '$title',
        style: TextStyle(
            color: textColor ?? Colors.white, fontFamily: FontsHelper.cairo),
      ),
    ),
  );
}