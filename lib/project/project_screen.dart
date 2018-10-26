import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenges/project/item_person.dart';
import 'package:ui_challenges/io/data/data.dart';
import 'package:ui_challenges/theme/text_styles.dart';

class ProjectScreen extends StatefulWidget {
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _scale;

  @override
  Widget build(BuildContext context) {
    final data = DataHolder();

    final openPercent = Interval(0.0, 0.8, curve: Curves.easeOut).transform(_scale.value);

    final slideAmount = 255.0 * openPercent;
    final contentScale = 1 - (0.35 * openPercent);

    return Transform(
      transform: Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.blue[100],
                offset: Offset(0.0, 3.0),
                blurRadius: 50.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Container(color: Colors.white,child: Scaffold(appBar: getAppBar(), body: getBody(data)))),
    );
  }

  Widget getAppBar() {
    return AppBar(
      title: Text("Project",
          style: MyTextTheme().getLightSmallGrey().copyWith(fontSize: 20.0)),
      leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: Colors.grey[400], size: 25.0),
          onPressed: () {
            _animationController.forward();
          }),
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: Image(
              image: AssetImage("assets/images/ic_trash.png"),
              width: 25,
              height: 25),
          onPressed: () {},
        )
      ],
    );
  }

  Widget getBody(data) {
    return Container(color: Colors.white, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 20.0),
                  child: Text("Activity Feed",
                      style: MyTextTheme().getSmallBlue().copyWith(
                          fontWeight: FontWeight.bold, fontSize: 25))),
              Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 40),
                      itemCount: data.persons.length,
                      itemBuilder: (context, int index) {
                        return Padding(
                            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: ItemPerson(data.persons[index]));
                      }))
            ]));
  }

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _scale = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
