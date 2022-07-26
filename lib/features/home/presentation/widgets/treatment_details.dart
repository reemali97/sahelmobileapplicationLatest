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
    this.titleStyle,
    this.valueStyle,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize ?? getScreenWidth(context) * 0.05,
        ),
        const SizedBox(
          width: 4.0,
        ),
        Text(
          '$title : ',
          style: titleStyle ??
              TextStyle(
                  fontFamily: FontsHelper.cairo,
                  fontSize: getScreenWidth(context) * 0.03),
        ),
        Text(
          '$value',
          style: valueStyle ??
              TextStyle(
                  fontFamily: FontsHelper.cairo,
                  fontSize: getScreenWidth(context) * 0.03),
          softWrap: true,
        ),
      ],
    );
  }
}
