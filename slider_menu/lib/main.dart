import 'package:flutter/material.dart';
import 'package:ui_challenges/menu_holder.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.white,
        accentIconTheme: Theme.of(context).accentIconTheme.copyWith(
            color: Colors.white
        )
      ),
      home: Menuholder(),
    );
}