import 'package:flutter/material.dart';
import 'package:vpn_app/ui/screens/home/home_page_screen.dart';
import 'package:vpn_app/ui/screens/welcome/welcome_screen.dart';

class Router {

  static const HOME_PAGE = "/home";
  static const DEFAULT = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DEFAULT:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case HOME_PAGE:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
    }
  }

}
