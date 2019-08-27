import 'package:flutter/material.dart';

class DrawerLayout extends StatelessWidget {

  const DrawerLayout();

  @override
  Widget build(BuildContext context) => Drawer(
    child: Container(
      color: Colors.white,
      child: Center(
        child: Text('Implement me', style: Theme.of(context).textTheme.body2),
      ),
    ),
  );
}