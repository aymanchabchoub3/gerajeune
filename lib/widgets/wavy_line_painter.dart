import 'package:flutter/material.dart';

class WavyLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(size.width / 4, size.height - 20, size.width / 2, size.height)
      ..quadraticBezierTo(3 * size.width / 4, size.height + 20, size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
