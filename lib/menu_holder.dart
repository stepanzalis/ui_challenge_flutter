import 'package:flutter/material.dart';
import 'package:ui_challenges/menu/menu_screen.dart';
import 'package:ui_challenges/project/project_screen.dart';

class Menuholder extends StatefulWidget {

  _MenuholderState createState() => _MenuholderState();
}

class _MenuholderState extends State<Menuholder> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          MenuScreen(),
          ProjectScreen()
          ],
      ),
    );
  }
}
