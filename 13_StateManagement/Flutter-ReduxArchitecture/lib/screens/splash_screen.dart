import 'package:flutter/material.dart';
import 'package:reduxdemo/core/constant/page_route_constants.dart';

import 'package:reduxdemo/core/resources/styles.dart' as MyTheme;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
          ..addListener(() {
            if (animationController.isCompleted) {
              Navigator.pushReplacementNamed(
                  context, PageRouteConstants.login_screen);
            }
            setState(() {});
          });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Spacer(),
            Image.asset(
              'assets/images/logo.png',
              width: animation.value * 250,
              height: animation.value * 250,
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(MyTheme.AppDimension.px10),
                child: Image.asset(
                  'assets/images/powered_by.png',
                  height: MyTheme.AppDimension.px25,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
