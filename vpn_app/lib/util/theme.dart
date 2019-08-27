import 'package:flutter/material.dart';
import 'package:vpn_app/util/colors.dart';

var appTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: backgroundColor,
  primaryColor: primaryColor,
  fontFamily: 'SF-Pro-Display-Medium',
  buttonTheme: ButtonThemeData(
    buttonColor: primaryColor
  ),
  textTheme: TextTheme(
    title: TextStyle(color: primaryTextColor, fontSize: 20.0), // App bar
    headline: TextStyle(color: primaryTextColor, fontSize: 20.0, fontFamily: 'SF-Pro-Display', fontWeight: FontWeight.w800), // Onboarding title
    body1: TextStyle(color: primaryTextColor, fontSize: 18.0, fontFamily: 'SF-Pro-Display-Regular'), // regular text
    overline: TextStyle(color: secondaryTextColor, fontSize: 14.0, letterSpacing: 0), // description text
    button: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold, fontFamily: 'SF-Pro-Display-Bold',letterSpacing: 1),
  ),
);
