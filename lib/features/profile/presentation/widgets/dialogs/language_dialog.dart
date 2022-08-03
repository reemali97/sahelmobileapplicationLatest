import 'package:flutter/material.dart';
import 'package:sahelmobileapplication/core/core.export.dart';
class LanguageDialog{
  static Future<void> languageDialog({BuildContext? context}) async {
    return showDialog(
      context: context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
              child: Text(
                'Language',
                style: TextStyle(fontFamily: FontsHelper.cairo),
              )),
          content: SizedBox(

            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                langDialogButton(title: 'العربية',onPressed: ()=>onArabic(context: context),),
                langDialogButton(title: 'English',onPressed: ()=>onEnglish(context: context),),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget langDialogButton({
    String? title,
    Color? buttonColor,
    Color? textColor,
    VoidCallback? onPressed
  }) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed ?? (){} ,
        color: buttonColor ?? ColorHelper.primaryColor,
        child: Text(
          '$title',
          style: TextStyle(
              color: textColor ?? Colors.white, fontFamily: FontsHelper.cairo),
        ),
      ),
    );
  }

  static void onArabic({BuildContext? context}){
    Navigator.pop(context!);
  }
  static void onEnglish({BuildContext? context}){
    Navigator.pop(context!);

  }



}
