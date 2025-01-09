import 'package:design_layer/design_layer.dart';
import 'package:flutter/material.dart';

class GradientColors extends StatelessWidget {
  final DefaultTheme state;

  const GradientColors({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: state.mainColor100, // LightTheme.mainColor100,
          height: 30.0,
          width: 250.0,
        ),
        Container(
          color: state.mainColor200, // LightTheme.mainColor100,
          height: 30.0,
          width: 250.0,
        ),
        Container(
          color: state.mainColor300, // LightTheme.mainColor100,
          height: 30.0,
          width: 250.0,
        ),
        Container(
          color: state.mainColor400, // LightTheme.mainColor100,
          height: 30.0,
          width: 250.0,
        ),
        Container(
          color: state.mainColor500, // LightTheme.mainColor100,
          height: 30.0,
          width: 250.0,
        ),
      ],
    );
  }
}
