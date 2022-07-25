import 'package:flutter/material.dart';
import '../../../../../../core/core.export.dart';
import '../../../../../features.export.dart';

class OnGoingScreen extends StatelessWidget {
  const OnGoingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return const TreatmentItem(
                folderIcon: ImageHelper.onGoingFolder,
                statusIcon: ImageHelper.onGoingSign,
                backgroundColor: ColorHelper.onGoingTreatment,
                treatmentNoColor: ColorHelper.selectedColor,
              );
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
