import 'package:flutter/material.dart';

import 'package:model_sm/model_sm.dart';

class Weather extends StatelessWidget {
  final WeatherData weatherData;
  final bool? advInfo;

  Weather({super.key, required this.weatherData, this.advInfo}) ;

  @override
  Widget build(BuildContext context) {
    String skyState = 'Ясно';
    int wDeg = weatherData.degrees.toInt();
    if(weatherData.cloudy > 40) skyState = 'Облачно';
    if(weatherData.cloudy > 70) skyState = 'Пасмурно';
    if(weatherData.cloudy > 80) skyState = (wDeg > -3) ? 'Дождь' : 'Снег';
    if(weatherData.cloudy == 100) skyState = (wDeg > -3) ? 'Ливень' : 'Снегопад';

    String postFix = 'ов';
    wDeg = wDeg.abs();
    if(((wDeg - 1) % 10 == 0) || (wDeg == 1)) postFix = '';
    if(((wDeg - 2) % 10 == 0) ||((wDeg - 3) % 10 == 0) || ((wDeg - 4) % 10 == 0)) postFix = 'а';
    if((wDeg == 0) ||(wDeg == 11) || (wDeg == 12) || (wDeg == 13) || (wDeg == 14)) postFix = 'ов';

    return
      //if(MediaQuery.of(context).orientation == Orientation.portrait) {
        Column(
          children: [
            Container(
              width: 100,
              height: 75,
              child: CustomPaint(
                painter: _WeatherPainter(weatherData: weatherData),
              ),
            ),
            if (advInfo ?? false)
              Column(
                children: [
                  Text('$skyState,'),
                  Text('${weatherData.degrees.toInt()} градус$postFix'),
                ],
              ),
          ],
        );

  }
}

class _WeatherPainter extends CustomPainter{
  final WeatherData weatherData;

  _WeatherPainter({required this.weatherData});

  @override
  void paint(Canvas canvas, Size size) {
    final sun = Paint()
        ..color = Colors.yellow.withOpacity(_getSunOpacity(weatherData.cloudy / 100))
        ..style = PaintingStyle.fill;

    final cloud = Paint()
        ..color = Color(0x00000032).withOpacity(_getCloudyOpacity(weatherData.cloudy / 100))
        ..style = PaintingStyle.fill;

    final rain = Paint()
        ..color = Color(0x00000032).withOpacity((weatherData.degrees.toInt() < -2) ? 0 : _getDropOpacity(weatherData.cloudy / 100))
        ..style = PaintingStyle.fill;

    final snow = Paint()
      ..color = Colors.lightBlueAccent.withOpacity((weatherData.degrees.toInt() >= -2) ? 0 :_getDropOpacity(weatherData.cloudy / 100))
      ..strokeWidth = 1;

    var pathSun = Path()
      ..addOval(Rect.fromCenter(center: Offset(40, 20), width: 40, height: 40))
      ..close();
    canvas.drawPath(pathSun, sun);

    var pathCloud = Path()
      ..moveTo(0, 38)
      ..quadraticBezierTo(2.5, 25, 12, 22.5)..quadraticBezierTo(16, 22, 22, 22.5)
      ..quadraticBezierTo(33, 22.5, 45.5, 16)..quadraticBezierTo(52.5, 11, 60, 10)
      ..quadraticBezierTo(71, 12.5, 75, 22.5)..quadraticBezierTo(97.5, 21, 100, 37)
      ..quadraticBezierTo(97.5, 49, 71.5, 49.5)..quadraticBezierTo(55.5, 48.5, 39.5, 49.5)
      ..quadraticBezierTo(0.5, 52.5, 0, 38)
      ..close();
    canvas.drawPath(pathCloud, cloud);

    var pathRain = Path()
      ..moveTo(15, 55)..quadraticBezierTo(13, 57.5, 16, 57.5)..lineTo(22.5, 50)
      ..moveTo(40, 58.5)..quadraticBezierTo(38, 61, 41, 61)..lineTo(47.5, 53.5)
      ..moveTo(70, 56.5)..quadraticBezierTo(68, 59, 71, 59)..lineTo(77.5, 51.5)
      ..moveTo(22.5, 66.5)..quadraticBezierTo(20.5, 69, 23.5, 69)..lineTo(30, 61.5)
      ..moveTo(50, 70)..quadraticBezierTo(48, 72.5, 51, 72.5)..lineTo(57.5, 65);
    canvas.drawPath(pathRain, rain);

    // Snow
    void snowflake(double dX, double dY){
      canvas.drawLine(Offset(5 + dX, 0 + dY), Offset(5 + dX, 10 + dY), snow);
      canvas.drawLine(Offset(0 + dX, 5 + dY), Offset(10 + dX, 5 + dY), snow);
      canvas.drawLine(Offset(2 + dX, 2 + dY), Offset(8 + dX, 8 + dY), snow);
      canvas.drawLine(Offset(8 + dX, 2 + dY), Offset(2 + dX, 8 + dY), snow);
    };
    snowflake(10, 50);
    snowflake(45, 55);
    snowflake(75, 50);
    snowflake(30, 60);
    snowflake(60, 63);
  }

  @override
  bool shouldRepaint(_WeatherPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_WeatherPainter oldDelegate) => false;

  double _getSunOpacity(double value){
    if(value < 0.8) return 1;
    return 5 * (1 - value);
  }

  double _getCloudyOpacity(double value){
    if(value < 0.2) return 0;
    return 10 / 8 * value - 2 / 8;
  }

  double _getDropOpacity(double value){
    if(value < 0.7) return 0;
    return 10 / 3 * value - 7 / 3;
  }
}
