import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenges/io/data/persons_data.dart';
import 'package:ui_challenges/project/item_person.dart';
import 'package:ui_challenges/theme/text_styles.dart';

class ProjectScreen extends StatelessWidget {

  PersonsData data;

  ProjectScreen() {
    data = PersonsData();
  }

  @override
  Widget build(BuildContext context) => _ActivityListView(data);
}

class _ActivityListView extends StatelessWidget {

  final PersonsData data;
  const _ActivityListView(this.data);

  @override
  Widget build(BuildContext context) => Container(
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text("Activity Feed",
                style: MyTextTheme().getSmallBlue().copyWith(fontWeight: FontWeight.bold, fontSize: 25))),
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: data.persons.length,
                itemBuilder: (context, int index) =>
                    Padding(padding: EdgeInsets.only(top: 20.0, bottom: 20.0), child: ItemPerson(data.persons[index]))))
      ]));
}
