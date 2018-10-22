import 'package:flutter/material.dart';
import 'package:ui_challenges/theme/text_styles.dart';

class ItemMenu extends StatelessWidget {
  ItemMenu(this.path, this.name);

  final String path;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 25.0, bottom: 25.0),
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
    );
  }
}
