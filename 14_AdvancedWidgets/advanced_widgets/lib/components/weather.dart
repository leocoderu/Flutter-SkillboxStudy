import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blueAccent,
      width: 200.0,
      height: 150.0,
      child: CustomPaint(
        painter: WeatherPainter(),
      ),
    );
  }
}

class WeatherPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final sun = Paint()
        ..color = Colors.yellow.withOpacity(1.0)
        ..style = PaintingStyle.fill;

    final cloud = Paint()
        ..color = Colors.black26.withOpacity(0.5)
        ..style = PaintingStyle.fill;

    final rain = Paint()
        ..color = Colors.black26.withOpacity(0.5)
        ..style = PaintingStyle.fill;

    // final snow = Paint()
    //   ..color = Colors.white.withOpacity(1.0)
    //   ..style = PaintingStyle.fill;

    var pathSun = Path()
      ..addOval(Rect.fromCenter(center: Offset(80, 40), width: 80, height: 80))
      ..close();
    
    canvas.drawPath(pathSun, sun);

    var pathCloud = Path()
      ..moveTo(0, 76)
      ..quadraticBezierTo(5, 50, 24, 45)
      ..quadraticBezierTo(32, 44, 44, 45)
      ..quadraticBezierTo(66, 45, 91, 32)
      ..quadraticBezierTo(105, 22, 120, 20)
      ..quadraticBezierTo(142, 25, 150, 45)
      ..quadraticBezierTo(195, 42, 200, 74)
      ..quadraticBezierTo(195, 98, 143, 99)
      ..quadraticBezierTo(111, 97, 79, 99)
      ..quadraticBezierTo(1, 105, 0, 76)
      ..close();

    canvas.drawPath(pathCloud, cloud);

    var pathRain = Path()
      ..moveTo(30, 110)
      ..quadraticBezierTo(26, 115, 32, 115)
      ..lineTo(45, 100)

      ..moveTo(80, 117)
      ..quadraticBezierTo(76, 122, 82, 122)
      ..lineTo(95, 107)

      ..moveTo(140, 113)
      ..quadraticBezierTo(136, 118, 142, 118)
      ..lineTo(155, 103)

      ..moveTo(45, 133)
      ..quadraticBezierTo(41, 138, 47, 138)
      ..lineTo(60, 123)

      ..moveTo(100, 140)
      ..quadraticBezierTo(99, 145, 102, 145)
      ..lineTo(115, 130);

    canvas.drawPath(pathRain, rain);

  //   var pathSnow = Path()
  //     ..moveTo(30, 105)
  //     ..lineTo(30, 110)
  //     ..lineTo(27, 107)
  //     ..lineTo(26, 108)
  //     ..lineTo(29, 111)
  //     ..lineTo(24, 111)
  //     ..lineTo(24, 112)
  //     ..lineTo(29, 112)
  //     ..lineTo(26, 115)
  //     ..lineTo(27, 116)
  //     ..lineTo(30, 113)
  //     ..lineTo(30, 118)
  //     ..lineTo(31, 118)
  //     ..lineTo(31, 113)
  //     ..lineTo(34, 116)
  //     ..lineTo(35, 115)
  //     ..lineTo(32, 112)
  //     ..lineTo(37, 112)
  //     ..lineTo(37, 111)
  //     ..lineTo(32, 111)
  //     ..lineTo(35, 108)
  //     ..lineTo(34, 107)
  //     ..lineTo(31, 110)
  //     ..lineTo(31, 105)
  //     ..lineTo(30, 105)
  //     ..close();
  //   canvas.drawPath(pathSnow, snow);
  }

  @override
  bool shouldRepaint(WeatherPainter oldDelegate) {
    return false;
  }

  @override
  bool shouldRebuildSemantics(WeatherPainter oldDelegate) {
    return false;
  }
}
