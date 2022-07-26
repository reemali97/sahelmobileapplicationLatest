import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/core.export.dart';
import '../../../../features.export.dart';

class LoginScreen extends StatelessWidget {

   LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool? isVisible = true;
  IconData? modeIcon = Icons.visibility;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is GetTokenState) {
          // ShowToastSnackBar.showSnackBars(
          //   context,
          //   message: state.token,
          // );
        }
        if (state is ErrorGetTokenState) {
          ShowToastSnackBar.showSnackBars(
            context,
            message: state.error,
          );
        }
        if (state is PasswordVisibilityState) {
          isVisible = state.isVisible;
          modeIcon = state.modeIcon;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () =>Navigator.pop(context),
              ),
            ) ,
            elevation: 0.0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: FontsHelper.cairo,
                          fontWeight: FontWeight.bold,
                          fontSize: getScreenWidth(context) * 0.08),
                    ),
                    SizedBox(
                      height: getScreenWidth(context) * 0.09,
                    ),
                    SvgPicture.asset(
                      ImageHelper.login,
                      width: double.infinity,
                      height: getScreenWidth(context) * 0.45,
                    ),
                    SizedBox(
                      height: getScreenHeight(context) * 0.1,
                    ),
                    TextFieldApp(
                      hintText: 'UserName',
                      controller: emailController,
                      isRTL: false,
                      height: getScreenWidth(context) * 0.12,
                      inputFormatters: [RegExpValidator.clearWhitespace],
                    ),
                    SizedBox(
                      height: getScreenWidth(context) * 0.06,
                    ),
                    TextFieldApp(
                      hintText: 'Password',
                      controller: passwordController,
                      isRTL: false,
                      height: getScreenWidth(context) * 0.12,
                      obscureText: isVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          modeIcon,
                          color: ColorHelper.primaryColor,
                        ),
                        onPressed: () => showPassword(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () => forGetPassword(context),
                        child: const Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            'Forget Password',
                            style: TextStyle(
                                color: ColorHelper.primaryColor,
                                fontFamily: FontsHelper.cairo,
                                fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getScreenWidth(context) * 0.05,
                    ),
                    ButtonApp(
                      onPressed: () => onLogin(context),
                      borderRadius: 4.0,
                      text: 'Login',
                      color: ColorHelper.primaryColor,
                      height: getScreenWidth(context) *0.13,
                      textStyle: const TextStyle(
                          fontFamily: FontsHelper.cairo, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  void onLogin(BuildContext? context) {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(context!,
          message: 'Email/Password must be not empty');
      return;
    }
    LoginBloc.get(context).add(GetTokenEvent(
      context:context!,
      userName: emailController.text.trim(),
      passWord: passwordController.text,
    ),
    );
  }
  void forGetPassword(BuildContext? context) {
     openNewPage(context!,const ForgetPasswordScreen());
   }
  void showPassword(BuildContext? context) {
    LoginBloc.get(context).add(PasswordVisibilityEvent());
  }
}

