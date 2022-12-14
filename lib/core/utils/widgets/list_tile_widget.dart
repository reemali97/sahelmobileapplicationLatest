import 'package:flutter/material.dart';

import '../../core.export.dart';

class ListTileWidget extends StatelessWidget {
  final String? title;
  final Color? iconColor;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final IconData? leadingIcon;
  final IconData? trailing;
  final double? iconSize;


  const ListTileWidget({
    Key? key,
    this.title ='',
    this.iconColor,
    this.textStyle,
    this.onTap,
    this.leadingIcon =Icons.person_outline,
    this.trailing=Icons.arrow_forward_ios_outlined,
    this.iconSize ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      title: Text(
        '$title',
        style: textStyle ??  TextStyle(color: ColorHelper.primaryColor,fontSize:getScreenWidth(context) * 0.04 ),
      ),
      leading:  Icon(leadingIcon ,
          size: iconSize??getScreenWidth(context) * 0.07,
          color: iconColor ?? ColorHelper.primaryColor),
      onTap: onTap ?? (){},
      trailing:  Icon(trailing, color: iconColor ??ColorHelper.primaryColor,),
    );
  }
}
