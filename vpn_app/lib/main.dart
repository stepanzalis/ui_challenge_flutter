import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpn_app/io/models/connection_model.dart';
import 'package:vpn_app/io/models/welcome_model.dart';
import 'package:vpn_app/io/models/server_model.dart';
import 'package:vpn_app/ui/screens/home/home_page_screen.dart';
import 'package:vpn_app/util/router.dart';
import 'package:vpn_app/util/status_bar.dart';
import 'package:vpn_app/util/theme.dart';

Future<void> main() async {
  setPreferredOrientations();
  setStatusBarColor();
  runApp(VpnApp());
}

class VpnApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (context) => WelcomeModel()),
          ChangeNotifierProvider(builder: (context) => ConnectionModel()),
          ChangeNotifierProvider(builder: (context) => ServerModel()),
        ],
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: MaterialApp(
            title: 'VPN',
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            onGenerateRoute: Router.generateRoute,
            home: HomeScreen(),
          ),
        ),
      );
}
