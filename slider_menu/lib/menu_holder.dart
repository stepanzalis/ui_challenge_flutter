import 'package:flutter/material.dart';
import 'package:ui_challenges/menu/animated_screen.dart';
import 'package:ui_challenges/menu/menu_screen.dart';
import 'package:ui_challenges/project/project_screen.dart';

class Menuholder extends StatefulWidget {

  @override
  _MenuholderState createState() => _MenuholderState();
}

class _MenuholderState extends State<Menuholder> {

 int selectedId = 0;
 Widget currectScreen = AnimatedScreen(appBar: 'Project', child: ProjectScreen());

  @override
  Widget build(BuildContext context) => Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          MenuScreen((selectedId) {
              this.selectedId = selectedId;
              if (selectedId == 1) {
                  // currectScreen = AnimatedScreen(appBar: "XXX", child: Widget); // different screen
              }
          }),
          currectScreen
          ],
      ),
    );
}
