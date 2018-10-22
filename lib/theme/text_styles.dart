import 'package:flutter/material.dart';

class MyTextTheme {

  const MyTextTheme();

  TextStyle getSmallBlue() {
    return _getSmallFont(Colors.blue);
  }

  TextStyle getBigBlue() {
    return getSmallBlue().copyWith(fontSize: 25, fontWeight: FontWeight.bold);
  }

  TextStyle getLightSmallGrey() {
    return _getSmallFont(Colors.grey[400]);
  }

  TextStyle getGrey() {
    return TextStyle(fontSize: 22.0, color: Colors.blueGrey[300], fontWeight: FontWeight.w600);
  }

  _getSmallFont(Color color) {
    return TextStyle(fontSize: 15.0, color: color);
  }


}