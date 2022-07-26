import 'package:flutter/material.dart';

import '../../../../../core/core.export.dart';
import '../../../../features.export.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        elevation: 1.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () =>Navigator.pop(context),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text('LOGIN',style: TextStyle(color: Colors.black,fontFamily: FontsHelper.cairo,fontSize: 22.0),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0,),
                Image.asset(
                  ImageHelper.logo,
                  width: getScreenWidth(context) * 0.69,
                ),
                SizedBox(height: getScreenWidth(context) * 0.2,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'How do you want to reset the password?',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                SizedBox(height: getScreenWidth(context) * 0.1,),
                const RadioButtonApp(
                  groupValue: 1,
                  title: 'Send a message to the email',
                  activeColor: ColorHelper.primaryColor,
                  value: 1,
                  toggleAble: true,

                  textStyle: TextStyle(fontFamily: FontsHelper.cairo,fontSize: 18.0),
                ),
                const RadioButtonApp(
                  groupValue: 1,
                  title: 'Send a sms message to the mobile',
                  activeColor: ColorHelper.primaryColor,
                  value: 1,
                  toggleAble: true,
                  textStyle: TextStyle(fontFamily: FontsHelper.cairo,fontSize: 18.0),
                ),
                SizedBox(height: getScreenWidth(context) * 0.1,),
                ButtonApp(
                  borderRadius: 6.0,
                  height: getScreenWidth(context) * 0.15,
                  text: 'Next',
                  textStyle: const TextStyle(fontFamily: FontsHelper.cairo,fontSize: 18.0),
                  onPressed: () =>onNext(context),
                  color: ColorHelper.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void onNext(BuildContext context){
    openNewPage(context,  ResetPasswordScreen());
  }
}
