import 'package:flutter/material.dart';

class RPsSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Color(0xffF0F1F4)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, 0);
    path0.quadraticBezierTo(size.width * 0.2847500, size.height * -0.0164667,
        size.width * 0.3769167, 0);
    path0.cubicTo(
        size.width * 0.3767167,
        size.height * 0.1958000,
        size.width * 0.4054167,
        size.height * 0.9318000,
        size.width * 0.5008000,
        size.height * 0.9348000);
    path0.cubicTo(
        size.width * 0.5893500,
        size.height * 0.9397333,
        size.width * 0.6229667,
        size.height * 0.2038667,
        size.width * 0.6216667,
        0);
    path0.quadraticBezierTo(size.width * 0.7162500, size.height * 0.0000667,
        size.width, size.height * 0.0002667);
    path0.lineTo(size.width * 0.9984167, size.height * 0.9968000);
    path0.lineTo(0, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
