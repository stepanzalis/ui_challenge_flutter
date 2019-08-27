import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vpn_app/ui/screens/home/drawer_layout.dart';
import 'package:vpn_app/ui/screens/home/main_page_container.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).backgroundColor,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: SvgPicture.asset('assets/images/hamburger.svg'),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              centerTitle: true,
              title: Text(
                'VPN',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            drawer: DrawerLayout(),
            body: MainPageContainer()),
      );
}