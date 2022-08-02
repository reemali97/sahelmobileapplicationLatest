import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/core.export.dart';
import '../../../features.export.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body:LayoutBuilder(

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
                          const Spacer(flex: 1,),
                          SvgPicture.asset(
                            ImageHelper.welcome,
                            width: double.infinity,
                            height: getScreenWidth(context) * 0.5,
                          ),
                          const SizedBox(height: 20,),
                          Text(
                            'welcome',
                            style: TextStyle(
                              fontSize: getScreenWidth(context) * 0.08,
                              color: ColorHelper.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontsHelper.cairo,
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Text(
                            'Language',
                            style: TextStyle(
                                fontSize: getScreenWidth(context) * 0.06,
                                color: ColorHelper.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontsHelper.cairo),
                          ),
                          const SizedBox(height: 20,),
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
                          const SizedBox(height: 20,),
                          ButtonApp(
                            onPressed: () => onNext(context),
                            color: ColorHelper.primaryColor,
                            width: getScreenWidth(context) *0.5,
                            text: 'Next',
                            textStyle: const TextStyle(fontFamily: FontsHelper.cairo,fontSize: 18),
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
  void onNext(BuildContext? context) {
    openNewPage(context!, LoginScreen());
  }
}





