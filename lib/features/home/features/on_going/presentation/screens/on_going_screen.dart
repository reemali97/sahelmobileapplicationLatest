import 'package:flutter/material.dart';

class OnGoingScreen extends StatelessWidget {
  const OnGoingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Text('On Going Screen')
          ],),
      ),);
  }
}
