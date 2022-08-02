import 'package:flutter/material.dart';

import '../../../../../core/core.export.dart';
import '../../../../features.export.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        elevation: 1.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          'LOGIN',
          style: TextStyle(
              color: Colors.black,
              fontFamily: FontsHelper.cairo,
              fontSize: 22.0),
        ),
      ),
      body: LayoutBuilder(
          builder: (_, constraints){
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50.0,
                          ),
                          Image.asset(
                            ImageHelper.logo,
                            width: getScreenWidth(context) * 0.69,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'How do you want to reset the password?',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const RadioButtonApp(
                            groupValue: 1,
                            title: 'Send a message to the email',
                            activeColor: ColorHelper.primaryColor,
                            value: 1,
                            toggleAble: true,
                            textStyle: TextStyle(
                                fontFamily: FontsHelper.cairo, fontSize: 18.0),
                          ),
                          const RadioButtonApp(
                            groupValue: 1,
                            title: 'Send a sms message to the mobile',
                            activeColor: ColorHelper.primaryColor,
                            value: 1,
                            toggleAble: true,
                            textStyle: TextStyle(
                                fontFamily: FontsHelper.cairo, fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ButtonApp(
                            borderRadius: 6.0,
                            height: getScreenWidth(context) * 0.15,
                            text: 'Next',
                            textStyle: const TextStyle(
                                fontFamily: FontsHelper.cairo, fontSize: 18.0),
                            onPressed: () => onNext(context),
                            color: ColorHelper.primaryColor,
                          ),
                          const Spacer(flex: 1,),
                        ],
                      ),
                    ),
                  ) ,
                ),
              ),
            );
          }
      ),
    );
  }

  void onNext(BuildContext context) {
    openNewPage(context, ResetPasswordScreen());
  }
}
