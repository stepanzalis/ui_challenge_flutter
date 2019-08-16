import 'package:flutter/material.dart';
import 'package:ui_challenges/io/data/person.dart';
import 'package:ui_challenges/theme/text_styles.dart';

class ItemPerson extends StatelessWidget {
  ItemPerson(this.person);

  final Person person;
  final MyTextTheme textTheme = MyTextTheme();

  @override
  Widget build(BuildContext context) => PersonListTile(person, textTheme);
}

class PersonListTile extends ListTile {

  final Person person;
  final MyTextTheme textTheme;
  const PersonListTile(this.person, this.textTheme);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      _AvatarWidget(person.imagePath, 40.0),
      SizedBox(width: 20),
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[_FirstRowInPerson(person, textTheme), _SecondRowInPerson(person, textTheme)])),
    ]),
  );
}


class _AvatarWidget extends StatelessWidget {

  final String path;
  final double radius;

  const _AvatarWidget(this.path, this.radius)
      : assert(path != null),
        assert(radius != null);

  @override
  Widget build(BuildContext context) => Material(
      shape: CircleBorder(),
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Image.asset(path, width: radius, height: radius));
}

class _FirstRowInPerson extends StatelessWidget {
  final Person person;
  final MyTextTheme textTheme;

  const _FirstRowInPerson(this.person, this.textTheme)
      : assert(person != null),
        assert(textTheme != null);

  @override
  Widget build(BuildContext context) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Text(person.name, style: textTheme.getGrey()),
        Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Text(person.time,
                style: textTheme.getLightSmallGrey().copyWith(fontSize: 17.0, fontWeight: FontWeight.w600)))
      ]);
}

class _SecondRowInPerson extends StatelessWidget {
  final Person person;
  final MyTextTheme textTheme;

  const _SecondRowInPerson(this.person, this.textTheme)
      : assert(person != null),
        assert(textTheme != null);

  @override
  Widget build(BuildContext context) => Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Text(person.state, style: textTheme.getLightSmallGrey()),
        SizedBox(width: 15.0),
        Text(person.task, style: textTheme.getSmallBlue())
      ]);
}
