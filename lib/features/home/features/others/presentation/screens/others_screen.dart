import 'package:flutter/material.dart';
import 'package:sahelmobileapplication/core/core.export.dart';

import '../../../../../features.export.dart';

class OthersScreen extends StatelessWidget {
  const OthersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(

      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return const TreatmentItem(
                backgroundColor: ColorHelper.otherTreatment,
                treatmentNoColor: ColorHelper.colorPrimary,
              );
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
