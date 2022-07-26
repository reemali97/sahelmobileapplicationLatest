import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/core.export.dart';
import '../../../features.export.dart';

class TreatmentItem extends StatelessWidget {
  final Color? backgroundColor;
  final String? folderIcon;
  final String? statusIcon;
  final Color? treatmentNoColor;

  const TreatmentItem({
    Key? key,
    this.backgroundColor = ColorHelper.primaryColor,
    this.folderIcon =ImageHelper.readTreatment,
    this.statusIcon=ImageHelper.readSign,
    this.treatmentNoColor =ColorHelper.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 10.0,
        shadowColor: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                   SizedBox(
                    width: getScreenWidth(context) *0.05,
                  ),
                  SvgPicture.asset(
                    folderIcon!,
                    height: getScreenWidth(context) *0.09,
                  ),
                   SizedBox(
                    width: getScreenWidth(context) *0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 2.0,
                        ),
                        child: Row(
                          children:  [
                            const Text(
                              'Order No : ',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontsHelper.cairo,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '5487',
                              style: TextStyle(
                                fontSize: 14,
                                  fontFamily: FontsHelper.cairo,
                                  color: treatmentNoColor!,
                                  fontWeight: FontWeight.bold,),
                            ),
                          ],
                        ),
                      ),
                      const TreatmentDetails(
                          title: 'Type of property',
                          value: 'Land',
                          icon: Icons.home_outlined),
                      const TreatmentDetails(
                          title: 'Location',
                          value: 'Riyadh',
                          icon: Icons.location_on_outlined),
                      const TreatmentDetails(
                          title: 'City',
                          value: 'Riyadh',
                          icon: Icons.location_on_outlined),
                      const TreatmentDetails(
                          title: 'Neighborhood',
                          value: 'Al Amal Dist',
                          icon: Icons.location_on_outlined),
                      const TreatmentDetails(
                          title: 'Form',
                          value: 'New Inmaa Bank-indiv',
                          icon: Icons.location_on_outlined),
                      const TreatmentDetails(
                          title: 'Purpose Of The Evaluation',
                          value: 'Selling',
                          icon: Icons.calendar_today_outlined),
                      const TreatmentDetails(
                          title: 'Agent Name',
                          value: 'Al-Entmaa',
                          icon: Icons.person_outline),
                      const TreatmentDetails(
                          title: 'Owner Name',
                          value: 'Anything',
                          icon: Icons.person_outline),
                      const TreatmentDetails(
                          title: 'Phone',
                          value: '00768679999',
                          icon: Icons.person_outline),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  SvgPicture.asset(
                    statusIcon!,
                    height: getScreenWidth(context) * 0.09,
                  ),
                  SizedBox(
                    width: getScreenWidth(context) *0.05,
                  ),
                ],
              ),
            ),
            Container(
              color: backgroundColor,
              width: double.infinity,
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  SizedBox(width: getScreenWidth(context) *0.01,),
                  Text('Distribute Date: ', style: TextStyle(color: Colors.black, fontFamily: FontsHelper.cairo,fontSize: getScreenWidth(context)*0.035)),
                  Text('2022-07-20', style: TextStyle(color: Colors.black, fontFamily: FontsHelper.cairo,fontSize: getScreenWidth(context)*0.035)),
                  SizedBox(width: getScreenWidth(context) *0.01,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
