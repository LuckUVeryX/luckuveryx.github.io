import 'dart:math';

import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  CurvePainter({required this.value, required this.color, super.repaint});

  final double value;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final white = Paint()..color = color;
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path
      ..moveTo(size.width * 0, startPointY)
      ..quadraticBezierTo(
        size.width * 0.5,
        controlPointY,
        size.width,
        endPointY,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
