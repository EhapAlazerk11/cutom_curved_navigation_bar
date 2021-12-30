import 'package:flutter/material.dart';

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;

  NavCustomPainter(
      double startingLoc, int itemsLength, this.color, this.textDirection) {
    final span = 1.0 / itemsLength;
    s = 0.3;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 0.1) * size.width, 0)
      ..cubicTo(
        (loc + s * 0.8) * size.width  - 50,
        size.height * 0.04 - 10,
        loc * size.width - 12,
        size.height * 0.60 - 5,
        (loc + s * 0.50) * size.width -15,
        size.height * 0.60 - 3,
      )
      ..cubicTo(
        (loc + s * .8) * size.width + 40 ,
        size.height * 0.68,
        (loc + s - s * 0.20) * size.width ,
        size.height * 0.05,
        (loc + s + 0.1) * size.width - 15 ,
        0,
      )

      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
