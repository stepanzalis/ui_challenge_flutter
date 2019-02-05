import 'dart:math';

import 'package:flutter/material.dart';
import 'package:temperature_oval/colors.dart';

class RulerPainter extends CustomPainter {
  final smallLength = 25.0;
  final longLength = 15.0;
  final numberOfLines = 200;

  final strokeWidth = 1.0;

  final Paint rulerPaint;

  RulerPainter({Key key, this.scrollLen}) : rulerPaint = new Paint() {
    rulerPaint.color = rulerColor;
  }

  final double scrollLen;

  @override
  void paint(Canvas canvas, Size size) {
    var tickMarkLength;
    final angle = 2 * pi / numberOfLines;

    final radius = size.width;
    canvas.save();

    final circlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..color = pinkColor;

    final shadow = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..color = pinkColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 90);

    // pink border around ruler
    canvas.drawCircle(new Offset(radius, radius), radius + 8, circlePaint);
    canvas.drawCircle(new Offset(radius, radius), radius + 8, shadow);

    // drawing
    canvas.translate(radius, radius);

    for (var i = 0; i < numberOfLines; i++) {
      tickMarkLength = i % 5 == 0 ? smallLength : longLength;
      rulerPaint.strokeWidth = strokeWidth;
      canvas.drawLine(new Offset(0.0, -radius),
          new Offset(0.0, -radius + tickMarkLength), rulerPaint);

      canvas.rotate(angle);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(RulerPainter oldDelegate) => true;
}
