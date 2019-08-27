import 'package:flutter/material.dart';

class IntroWidget extends StatelessWidget {

  final String title;
  final String description;
  final String imageRes;

  IntroWidget({@required this.title, @required this.description, this.imageRes, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            Image.asset(imageRes, scale: 1.2),
            SizedBox(height: 20),
            Text(title, style: Theme.of(context).textTheme.headline),
            Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: Text(description, style: Theme.of(context).textTheme.overline, textAlign: TextAlign.center))
          ],
        ));
  }
}
