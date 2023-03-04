//import 'dart:math';

//import 'package:advanced_widgets/components/slider_text.dart';
import 'package:advanced_widgets/themes/theme_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:advanced_widgets/fluro_router.dart';
import 'package:advanced_widgets/components/weather.dart';
import 'package:business_sm/business_sm.dart';
import 'package:model_sm/model_sm.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: 500),
    vsync: this,);
    //..repeat();

  @override
  void dispose(){
    _controller.dispose();
    // ignore: avoid_print
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              MyFluroRouter.router.navigateTo(context, '/settings');
            },
          ),
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Container(
            //   height: 50,
            //   child:SliderText(
            //     color: Colors.green,
            //     child: Text('Some text'),
            //   ),
            // ),
            Expanded(
              child: BlocBuilder<WeatherBloc, WeatherData>(
                builder: (context, state) {
                  return Container(
                    //color: Colors.green,
                    //mainAxisAlignment: state.minimize ? MainAxisAlignment.start : MainAxisAlignment.center,
                    alignment: Alignment.topRight,
                    child: AnimatedBuilder(
                        animation: _controller,
                        builder: (BuildContext context, Widget? child) {
                          double dX = _controller.value * ((MediaQuery.of(context).size.width/2) - (27.5 *(_controller.value + 1))) * -1 - 5.0;
                          double dY = _controller.value * ((MediaQuery.of(context).size.height / 2) + (10.0 * (_controller.value + 1))) + 5.0;
                          if(MediaQuery.of(context).orientation == Orientation.landscape) {
                            dY = _controller.value * ((MediaQuery.of(context).size.height / 8) + (10.0 * (_controller.value + 1))) + 5.0;
                          }
                          return Transform.translate(
                            transformHitTests: true,
                            offset: Offset(dX, dY),
                            child: Transform.scale(
                              transformHitTests: true,
                              scale: (MediaQuery.of(context).size.height > 500) ? 1 + _controller.value * 1.5 : 1 + _controller.value,   // 100 <-> 250,
                              child: GestureDetector(
                                onTap: () {_controller.value == 0 ? _controller.forward() : _controller.reverse();},
                                child: Weather(weatherData: state, advInfo: _controller.value == 1),
                              ),
                            ),
                          );
                        },
                      ),
                  );
                },
              ),
            ),
            ThemeText(
              theme: CustomTextTheme(fontSize: 18, textColor: Colors.indigoAccent, fontWeight: FontWeight.bold),
              child: Builder(
                builder: (innerContext) =>
                  Container(
                    //color: Colors.cyan,
                    height: 150,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          'Slider for Degrees',
                          style: TextStyle(
                            fontSize: ThemeText.of(innerContext).fontSize,
                            color: ThemeText.of(innerContext).textColor,
                          ),
                        ),
                        BlocBuilder<WeatherBloc, WeatherData>(
                          builder: (bloc, state) => Slider(
                            label: state.degrees.toString(),
                            min: -50,
                            max: 50,
                            value: state.degrees,
                            onChanged: (value) {context.read<WeatherBloc>().add(SetTemperature(value));},
                          ),
                        ),
                        Text(
                          'Slider for Cloudy',
                          style: TextStyle(
                            fontSize: ThemeText.of(innerContext).fontSize,
                            color: ThemeText.of(innerContext).textColor,
                            fontWeight: ThemeText.of(innerContext).fontWeight,
                          ),
                        ),
                        BlocBuilder<WeatherBloc, WeatherData>(
                            builder: (bloc, state) => Slider(
                              //label: 'Cloudy',
                              min: 0,
                              max: 100,
                              value: state.cloudy,
                              onChanged: (value) {context.read<WeatherBloc>().add(SetCloudy(value));},
                            ),
                        ),
                      ],
                    ),
                  ),
              ),
            ),
          ],
      ),
    );
  }
}

