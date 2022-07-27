import 'package:flutter/material.dart';
import '../../../../core/core.export.dart';

class NotificationsItem extends StatelessWidget {
  const NotificationsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0)),
      elevation: 7.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New treatment',
              style: TextStyle(
                color: ColorHelper.primaryColor,
                fontSize: getScreenWidth(context) * 0.07,
                fontWeight: FontWeight.bold,
                fontFamily: FontsHelper.cairo,),
            ),
            Text(
              'You receive a new treatment',
              style: TextStyle(
                color: ColorHelper.greyColor,
                fontSize: getScreenWidth(context) * 0.045,
                fontFamily: FontsHelper.cairo,),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Text(
                '10 min ago',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getScreenWidth(context) * 0.035,
                  fontFamily: FontsHelper.cairo,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
