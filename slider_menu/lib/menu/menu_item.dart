import 'package:flutter/material.dart';
import 'package:ui_challenges/theme/text_styles.dart';

class ItemMenu extends StatelessWidget {

  final String path;
  final String name;

  const ItemMenu({@required this.path, @required this.name});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 10.0, bottom: 10.0),
      child: Container(
        height: 55,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Image.asset(path, width: 25, height: 25, color: Colors.grey[400]),
            SizedBox(width: 20.0),
            Text(name,
                style: MyTextTheme()
                    .getLightSmallGrey()
                    .copyWith(fontSize: 22.0, fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
}
