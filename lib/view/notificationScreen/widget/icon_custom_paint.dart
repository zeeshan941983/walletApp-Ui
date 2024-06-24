import 'package:flutter/material.dart';

class VPainter extends CustomPainter {
  final Color color;
  final double shape;

  VPainter({required this.color, required this.shape});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    // Calculate points for drawing the 'V'
    double width = size.width;
    double height = size.height;

    // Define the points for the 'V' shape
    Offset startPoint = Offset(width / 2, shape);
    Offset leftPoint = Offset(width * 0.3, height - 14);
    Offset rightPoint = Offset(width * 0.7, height - 14);

    // Draw lines to form the 'V' shape
    canvas.drawLine(startPoint, leftPoint, paint);
    canvas.drawLine(startPoint, rightPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
