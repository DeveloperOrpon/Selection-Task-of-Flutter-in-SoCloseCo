import 'package:flutter/material.dart';

class BottomCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.0450000);
    path0.lineTo(size.width * 0.0612500, size.height * 0.1000000);
    path0.lineTo(size.width * 0.1253500, size.height * 0.1500000);
    path0.lineTo(size.width * 0.1875000, size.height * 0.1800000);
    path0.lineTo(size.width * 0.2500000, size.height * 0.2000000);
    path0.lineTo(size.width * 0.3125000, size.height * 0.2200000);
    path0.lineTo(size.width * 0.4009375, size.height * 0.2015000);
    path0.quadraticBezierTo(size.width * 0.3886625, size.height * 0.7211500,
        size.width * 0.4014125, size.height * 0.7191000);
    path0.cubicTo(
        size.width * 0.4210625,
        size.height * 0.7695000,
        size.width * 0.6005375,
        size.height * 0.7688000,
        size.width * 0.6027625,
        size.height * 0.7164500);
    path0.quadraticBezierTo(size.width * 0.6144375, size.height * 0.6510000,
        size.width * 0.6003375, size.height * 0.2053500);
    path0.lineTo(size.width * 0.6250000, size.height * 0.2224500);
    path0.lineTo(size.width * 0.6875000, size.height * 0.2250000);
    path0.lineTo(size.width * 0.7496750, size.height * 0.2116500);
    path0.lineTo(size.width * 0.8126375, size.height * 0.1924000);
    path0.lineTo(size.width * 0.8737500, size.height * 0.1650000);
    path0.lineTo(size.width * 0.9379875, size.height * 0.1229500);
    path0.lineTo(size.width * 0.9987500, size.height * 0.0544500);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
