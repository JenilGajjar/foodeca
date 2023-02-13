import 'dart:math';
import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;

    var path = Path();
    path.moveTo(2.3, size.height);

    path.lineTo(size.width * 0.2, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.4,
        size.width * 0.5, size.height * 0.5);

    path.quadraticBezierTo(size.width * 0.7, size.height * 0.68,
        size.width * 0.8, size.height * 0.27);
    path.moveTo(size.width * 0.81, size.height * 0.13);
    path.quadraticBezierTo(size.width * 0.85, 0, 85, size.height * 0.2);

    canvas.drawPath(path, paint);

    final centerX = size.width * 0.8;
    final centerY = size.height * 0.2;
    final Paint paint1 = Paint()..color = Colors.white;
    const double filledCircleRadius = .5;
    const int numberOfDots = 100;
    const double radiantStep = 2 * pi / numberOfDots;
    for (int i = 0; i < numberOfDots; i++) {
      canvas.drawCircle(
        Offset(centerX + sin(i * radiantStep) * 4,
            centerY + cos(i * radiantStep) * 4),
        filledCircleRadius,
        paint1,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
