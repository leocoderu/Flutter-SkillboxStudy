import 'package:flutter/material.dart';

class SomePainter extends CustomPainter {
  final List<Offset>? vertex;

  SomePainter({this.vertex});

  @override
  void paint(Canvas canvas, Size size) {
    if (vertex != null) {
      final outCircle = Paint()..color = Colors.black;
      final insCircle = Paint()..color = Colors.yellow;

      for (Offset e in vertex!) {
        canvas.drawCircle(e, 10, outCircle);
        canvas.drawCircle(e, 8, insCircle);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}