import 'package:flutter/material.dart';
import 'package:ui_challenges/project/project_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.white,
        accentIconTheme: Theme.of(context).accentIconTheme.copyWith(
            color: Colors.white
        )
      ),
      home: new ProjectScreen(),
    );
  }
}
