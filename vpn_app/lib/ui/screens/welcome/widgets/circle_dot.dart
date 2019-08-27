import 'package:flutter/material.dart';
import 'package:vpn_app/util/colors.dart';

class CircleDot extends StatelessWidget {
  final bool selected;

  CircleDot({@required this.selected, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double size = selected ? 10 : 8;
    final Color color = selected ? unselectedGrey : selectedGrey;

    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: size,
      height: size,
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}