import 'package:flutter/material.dart';

class CentralTemp extends StatelessWidget {
  
  const CentralTemp({Key key, this.temperature}) : super(key: key);

  // actul temperature number
  final temperature;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('TEMPERATURE, °F',
            style: TextStyle(fontSize: 13, color: Colors.white)),
        Text(temperature,
            style: TextStyle(fontSize: 160, color: Colors.white, height: 0.85)),
      ],
    ),
  );
}
