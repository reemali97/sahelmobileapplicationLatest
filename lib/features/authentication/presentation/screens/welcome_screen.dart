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
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageHelper.welcome,
                  width: double.infinity,
                  height: 220.0,
                ),
                const SizedBox(height: 40.0,),
                const Text(
                  'Welcome to Sahel',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: ColorHelper.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontsHelper.cairo,
                  ),
                ),
                const SizedBox(height: 26.0,),
                const Text('Language',style:TextStyle(fontSize: 22.0,color:ColorHelper.primaryColor,fontWeight: FontWeight.bold,fontFamily: FontsHelper.cairo),),
                const SizedBox(height: 24.0,),
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
                const SizedBox(height: 24.0,),
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
      ),
    );
  }
  void onNext(BuildContext? context){
    openNewPage(context!, LoginScreen());
}

}





