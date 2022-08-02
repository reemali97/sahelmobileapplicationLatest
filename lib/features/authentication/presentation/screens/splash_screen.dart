import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/core.export.dart';
import '../../../features.export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 1,
      ),
    ).then(
          (value) =>
      {
        openNewPage(context, const WelcomeScreen(),),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      body: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Image.asset(
                        ImageHelper.sahl,
                        fit: BoxFit.cover,
                        height: getScreenHeight(context),
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }

  void checkLoginUser() async {
    UserModel? user = await Auth.getUserFromPref();

    if (user == null) {
      openNewPage(context, LoginScreen(), popPreviousPages: true);
    }
    else {
      UserModel? userLogin ;

      if (userLogin == null) return;


      await Auth.updateUserInPref(user: userLogin);

      openNewPage(context, HomeScreen(), popPreviousPages: true);
    }
  }
}