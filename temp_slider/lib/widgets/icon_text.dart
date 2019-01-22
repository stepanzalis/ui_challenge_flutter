import 'package:flutter/material.dart';
import 'package:temperature_oval/colors.dart';
import 'package:temperature_oval/type_enum.dart';

class IconTextWidget extends StatelessWidget {
  
  const IconTextWidget({Key key, this.icon, this.text, this.type})
      : super(key: key);

  final icon;
  final text;
  final type;

  @override
  Widget build(BuildContext context) {
    final iconColor = type == IconText.greyIconPinkText ? greyColor : pinkColor;
    final textColor = type == IconText.greyIconPinkText ? pinkColor : greyColor;

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Icon(icon, color: iconColor),
      SizedBox(width: 7),
      Text(text, style: TextStyle(fontSize: 13, color: textColor))
    ]);
  }
}
