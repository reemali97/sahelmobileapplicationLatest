import 'package:flutter/material.dart';
import '../../../../../../core/core.export.dart';
import '../../../../../features.export.dart';

class ForEvaluatedScreen extends StatelessWidget {
  const ForEvaluatedScreen({Key? key}) : super(key: key);

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
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
