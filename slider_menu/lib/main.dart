import 'package:flutter/material.dart';
import 'package:ui_challenges/io/menu_provider.dart';
import 'package:ui_challenges/menu_holder.dart';
import 'package:provider/provider.dart';

void main() => runApp(MenuApp(key: ValueKey('menuApp')));

class MenuApp extends StatelessWidget {

  const MenuApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.white,
        accentIconTheme: Theme.of(context).accentIconTheme.copyWith(
            color: Colors.white
        )
      ),
      home: ChangeNotifierProvider<MenuProvider>(
          builder: (_) => MenuProvider(),
          child: MenuHolder())
    );
}