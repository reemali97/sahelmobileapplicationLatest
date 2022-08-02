import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/core.export.dart';
class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({Key? key}) : super(key: key);
   var emailController = TextEditingController();
   final _formKey = GlobalKey<FormState>();
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
            onPressed: () =>Navigator.pop(context),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text('LOGIN',style: TextStyle(color: Colors.black,fontFamily: FontsHelper.cairo,fontSize: 22.0),),
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
                    child: Form(
                      key: _formKey,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20.0,),
                            Center(
                              child: Text(
                                'Reset Password',
                                style: TextStyle(
                                  fontFamily: FontsHelper.cairo,
                                  fontSize: getScreenWidth(context) * 0.1,

                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0,),
                            Text(
                              'Confirm your email and we will send the instructions.',
                              softWrap: true,
                              style: TextStyle(
                                fontFamily: FontsHelper.cairo,
                                color: Colors.grey[500],
                                fontSize: getScreenWidth(context) * 0.04,
                              ),
                            ),
                            const SizedBox(height: 20.0,),
                            const Text('Email'),
                            const SizedBox(height: 20.0,),
                            TextFieldWidget(
                              height: 50,
                              isRTL: false,
                              controller: emailController,
                              inputFormatters: [
                                RegExpValidator.clearWhitespace
                              ],
                              validator: (value){
                                bool isValidEmail =RegExpValidator.isValidEmail(email: value);
                                if(value!.isNotEmpty){
                                  if(!isValidEmail){
                                    ShowToastSnackBar.showSnackBars(context, message: 'Badly email format');
                                  }
                                }else{
                                  ShowToastSnackBar.showSnackBars(context, message: 'Email must be not empty');

                                }

                              },
                              hintStyle: const TextStyle(color: ColorHelper.greyColor),
                              hintText: 'aielements@sahel.com',
                            ),
                            const SizedBox(height: 20.0,),
                            ButtonApp(
                              borderRadius: 6.0,
                              height: getScreenWidth(context) * 0.15,
                              text: 'Send instructions',
                              textStyle:  TextStyle(fontFamily: FontsHelper.cairo,fontSize: getScreenWidth(context) * 0.05),
                              onPressed: () =>sendInstructions(context),
                              color: ColorHelper.primaryColor,

                            ),
                            const Spacer(flex: 1,),
                            SizedBox(
                              width: double.infinity,
                              height: getScreenHeight(context) * 0.3,
                              child: FittedBox(
                                child: SvgPicture.asset(
                                  ImageHelper.sahlBackground,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ) ,
                ),
              ),
            );
          },
      ),
    );
  }

  void sendInstructions(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      return;
    }
  }
}
