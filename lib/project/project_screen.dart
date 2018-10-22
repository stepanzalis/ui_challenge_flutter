import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenges/project/item_person.dart';
import 'package:ui_challenges/io/data/data.dart';
import 'package:ui_challenges/theme/text_styles.dart';

class ProjectScreen extends StatefulWidget {
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    final data = DataHolder();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBar(),
        body: getBody(data));
  }

  Widget getAppBar() {
    return AppBar(
      title: Text("Project",
          style: MyTextTheme().getLightSmallGrey().copyWith(fontSize: 20.0)),
      leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: Colors.grey[400], size: 25.0),
          onPressed: () {}),
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: Image(image: AssetImage("assets/images/ic_trash.png"), width: 25, height: 25),
          onPressed: () {},
        )
      ],
    );
  }

  Widget getBody(data) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text("Activity Feed",
                  style: MyTextTheme()
                      .getSmallBlue()
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 25))),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 40),
                  itemCount: data.persons.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: ItemPerson(data.persons[index]));
                  }))
        ]);
  }
}
