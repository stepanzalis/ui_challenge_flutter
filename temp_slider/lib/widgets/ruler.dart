import 'package:flutter/material.dart';
import 'package:temperature_oval/widgets/painters/ruler_painter.dart';

class RulerWidget extends StatefulWidget {
  
  RulerWidget({
    Key key,
    this.size,
    this.function,
  }) : super(key: key);

  Size size;
  Function(double) function;

  @override
  RulerWidgetState createState() => new RulerWidgetState();
}

class RulerWidgetState extends State<RulerWidget> {
  double _y = 0;
  double _len = 0;

  GlobalKey keyPaint = GlobalKey();

  @override
  Widget build(BuildContext context) => GestureDetector(
        onVerticalDragStart: (detail) {
          _y = detail.globalPosition.dy;
        },
        onVerticalDragUpdate: (detail) {
          setState(() {
            _len += detail.globalPosition.dy - _y;
            _y = detail.globalPosition.dy;
           widget.function(_len);
          });
        },
        child: Transform(
          transform: Matrix4.rotationZ(_len / 10),
          alignment: FractionalOffset.centerRight,
          child: Container(
            height: 400,
            width: 200,
            child: CustomPaint(
              willChange: true,
              painter: RulerPainter(scrollLen: _len),
            ),
          ),
        ),
      );
}
