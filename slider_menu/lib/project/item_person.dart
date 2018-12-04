import 'package:flutter/material.dart';
import 'package:ui_challenges/io/data/person.dart';
import 'package:ui_challenges/theme/text_styles.dart';

class ItemPerson extends StatelessWidget {
  ItemPerson(this.person);

  final Person person;
  final MyTextTheme textTheme = MyTextTheme();

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        roundedImage(person.imagePath, 40.0),
        SizedBox(width: 20),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              firstRow(person, context),
              secondRow(person, context)
            ])),
      ]),
    );

  Widget roundedImage(String path, double radius) => Material(
        shape: CircleBorder(),
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        child: Image.asset(path, width: radius, height: radius));

  Widget firstRow(person, context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(person.name, style: textTheme.getGrey()),
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(person.time,
                  style: textTheme
                      .getLightSmallGrey()
                      .copyWith(fontSize: 17.0, fontWeight: FontWeight.w600)))
        ]);

  Widget secondRow(person, context) => Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(person.state, style: textTheme.getLightSmallGrey()),
      SizedBox(width: 15.0),
      Text(person.task, style: textTheme.getSmallBlue())
    ]);
}
