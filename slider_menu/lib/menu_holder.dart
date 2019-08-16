import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_challenges/io/menu_provider.dart';
import 'package:ui_challenges/menu/animated_screen.dart';
import 'package:ui_challenges/menu/menu_screen.dart';
import 'package:ui_challenges/project/project_screen.dart';

class MenuHolder extends StatefulWidget {
  const MenuHolder();

  @override
  _MenuHolderState createState() => _MenuHolderState();
}

class _MenuHolderState extends State<MenuHolder> {

  Widget currentScreen = AnimatedScreen(appBarTitle: 'Project', body: ProjectScreen());

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            MenuScreen((selectedId) => {
                  Provider.of<MenuProvider>(context, listen: false).changeSelectedPage(selectedId),
                  Provider.of<MenuProvider>(context, listen: false).toggleMenuPanel()
                }),
            currentScreen
          ],
        ),
      );
}
