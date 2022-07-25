import 'package:flutter/material.dart';

import '../../../../core/core.export.dart';

class TreatmentDetails extends StatelessWidget {
  final String? title;
  final String? value;
  final IconData? icon;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final double? iconSize;
  const TreatmentDetails({
    Key? key,
    this.title = '',
    this.value = '',
    this.icon = Icons.home_outlined,
    this.titleStyle = const TextStyle(fontFamily: FontsHelper.cairo),
    this.valueStyle = const TextStyle(fontFamily: FontsHelper.cairo),
    this.iconSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: iconSize,),
        const SizedBox(width: 4.0,),
        Text('$title : ',style:titleStyle,),
        Text('$value',style:valueStyle,softWrap: true,),
      ],
    );
  }
}
