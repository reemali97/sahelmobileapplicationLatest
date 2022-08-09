import 'package:flutter/material.dart';
import 'package:sahelmobileapplication/features/authentication/presentation/blocs/change_language/change_language_bloc.export.dart';
import 'package:sahelmobileapplication/main.dart';
import '../../../../../core/core.export.dart';
class LanguageDialog{
  static Future<void> showLanguageDialog({BuildContext? context}) async {
    return showDialog(
      context: context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
              child: Text(
                'Language',
                style: TextStyle(fontFamily: FontsHelper.cairo,color: ColorHelper.primaryColor),
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
    ChangeLanguageBloc.get(context).setLocale(langCode: 'ar');
    Navigator.pop(context!);
  }
  static void onEnglish({BuildContext? context}){
    ChangeLanguageBloc.get(context).setLocale(langCode: 'en');
    Navigator.pop(context!);

  }

}
