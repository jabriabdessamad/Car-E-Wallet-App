import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Color(0xffC1853B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.81;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0487000, size.height * 0.9923500);
    path0.lineTo(size.width * 0.0500000, size.height * 0.2500000);
    path0.lineTo(size.width * 0.1239250, size.height * 0.2520000);
    path0.lineTo(size.width * 0.1237000, size.height * 0.0700000);
    path0.lineTo(size.width * 0.2025000, size.height * 0.2504000);
    path0.lineTo(size.width * 0.9266000, size.height * 0.2496000);
    path0.lineTo(size.width * 0.9275000, size.height * 0.9950000);
    path0.lineTo(size.width * 0.0487000, size.height * 0.9923500);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
