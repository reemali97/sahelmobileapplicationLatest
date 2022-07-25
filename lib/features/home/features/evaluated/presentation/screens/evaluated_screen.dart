import 'package:flutter/material.dart';

import '../../../../../../core/core.export.dart';
import '../../../../../features.export.dart';

class EvaluatedScreen extends StatelessWidget {
  const EvaluatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return const TreatmentItem(
                folderIcon: ImageHelper.evaluatedFolder,
                statusIcon: ImageHelper.evaluatedSign,
                backgroundColor: ColorHelper.evaluatedTreatment,
                treatmentNoColor: ColorHelper.chatRoomColor,
              );
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
