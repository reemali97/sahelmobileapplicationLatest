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
      (value) => {
         openNewPage(context,const WelcomeScreen(),),
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
      body: Column(
        children: [
          Image.asset(
            ImageHelper.sahl,
            fit: BoxFit.cover,
            height: getScreenHeight(context),
            width: getScreenWidth(context),
          ),
        ],
      ),
    );
  }

  void checkLoginUser() async {}
}
