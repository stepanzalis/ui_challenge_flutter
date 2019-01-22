import 'package:flutter/material.dart';
import 'package:temperature_oval/widgets/painters/ruler_painter.dart';
import 'package:temperature_oval/widgets/painters/shadow_painter.dart';

class RulerWidget extends StatefulWidget {
  const RulerWidget({
    Key key,
  }) : super(key: key);

  @override
  RulerWidgetState createState() => new RulerWidgetState();
}

class RulerWidgetState extends State<RulerWidget> {
  @override
  Widget build(BuildContext context) => Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: CustomPaint(
          painter: ShadowPainter(), foregroundPainter: RulerPainter()));
}
