import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahelmobileapplication/core/core.export.dart';
import 'package:sahelmobileapplication/features/authentication/authentication.export.dart';

class WelcomeScreen extends StatelessWidget {

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              SvgPicture.asset(
                ImageHelper.welcome,
                width: double.infinity,
                height: getScreenWidth(context) * 0.5,
              ),
              SizedBox(height: getScreenWidth(context) * 0.1,),
              Text(
                'welcome',
                style: TextStyle(
                  fontSize: getScreenWidth(context) * 0.08,
                  color: ColorHelper.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontsHelper.cairo,
                ),
              ),
              SizedBox(height: getScreenWidth(context) * 0.06,),
              Text(
                'Language',
                style: TextStyle(
                    fontSize: getScreenWidth(context) * 0.06,
                    color: ColorHelper.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontsHelper.cairo),
              ),
              SizedBox(height: getScreenWidth(context) * 0.06,),
              Row(
                children:  const [
                  Expanded(
                    child: SizedBox(
                      width: 145,
                      child: RadioButtonApp(
                        title: 'English',
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                            color: ColorHelper.primaryColor,
                            fontFamily: FontsHelper.cairo),
                        toggleAble: true,
                        activeColor: ColorHelper.primaryColor,
                        value: 1,
                        groupValue: 1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 145,
                      child: RadioButtonApp(
                        title: 'العربية',
                        toggleAble: true,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,

                            color: ColorHelper.primaryColor,
                            fontFamily: FontsHelper.cairo),
                        activeColor: ColorHelper.primaryColor,
                        value: 1,
                        groupValue: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getScreenWidth(context) * 0.06,),
              ButtonApp(
                onPressed: () => onNext(context),
                color: ColorHelper.primaryColor,
                width: getScreenWidth(context) *0.5,
                text: 'Next',
                textStyle: const TextStyle(fontFamily: FontsHelper.cairo,fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onNext(BuildContext? context) {
    openNewPage(context!, LoginScreen());
  }
}





