import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  final List<Offset> points;

  MyCustomPainter(
    this.points,
  );

  @override
  void paint(Canvas canvas, Size size) {
    for (int x = 0; x < points.length; ++x) {
      canvas.drawPoints(PointMode.points, [points[x]], getCurrentPaint(true));
      if (x + 1 <= points.length - 1) {
        canvas.drawLine(points[x], points[x + 1], getCurrentPaint(false));
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  Paint getCurrentPaint(bool isPoint) => Paint()
    ..color = Colors.black
    ..strokeWidth = isPoint ? 10 : 3
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.round;
}
