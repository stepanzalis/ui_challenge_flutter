import 'dart:math';

import 'package:flutter/material.dart';
import 'package:temperature_oval/colors.dart';

class ShadowPainter extends CustomPainter {
  

  ShadowPainter({Key key});

  @override
  void paint(Canvas canvas, Size size) {

    final radius = size.width;
    canvas.save();

    final shadow = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..color = pinkColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 90);
      
    canvas.drawCircle(new Offset(radius, radius), radius + 8, shadow);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
