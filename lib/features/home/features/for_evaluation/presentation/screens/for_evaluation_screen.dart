import 'package:flutter/material.dart';

class ForEvaluatedScreen extends StatelessWidget {
  const ForEvaluatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text('For Evaluated Screen')],
            ),
          ),
        ],
      ),
    );
  }
}
