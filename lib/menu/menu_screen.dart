import 'package:flutter/material.dart';
import 'package:ui_challenges/io/data/data.dart';
import 'package:ui_challenges/menu/menu_item.dart';
import 'package:ui_challenges/theme/text_styles.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final data = DataHolder().menu;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: <Widget>[
              _buildAvatar(),
              SizedBox(height: 70),
              Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final model = data[index];
                    if (model.path.isEmpty)
                      return buildDivider(context);
                    else
                      return ItemMenu(model.path, model.name);
                  }),
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 15, bottom: 15),
      child: Container(
        height: 3.0,
        color: Colors.grey[300],
      ),
    );
  }

  _buildAvatar() {
    return ListTile(
        leading: CircleAvatar(radius: 25.0,child: Image.asset("assets/images/avatars/user_image.png", fit: BoxFit.contain)),
        title: Text("Roman Bova", style: MyTextTheme().getGrey().copyWith(fontSize: 24, fontWeight: FontWeight.w600)), subtitle: Text("UI/UX Designer", style: MyTextTheme().getSmallBlue().copyWith(fontSize: 20, fontWeight: FontWeight.w400)));

  }
}
