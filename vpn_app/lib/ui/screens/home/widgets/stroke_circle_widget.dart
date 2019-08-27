import 'package:flutter/material.dart';
import 'package:vpn_app/util/dimens.dart';

class StrokedCircle extends StatelessWidget {
  final Color color;
  final double circleSize;

  StrokedCircle({@required this.color, this.circleSize = 100, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      );
}
