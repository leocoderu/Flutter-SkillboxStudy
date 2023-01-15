import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:advanced_widgets/fluro_router.dart';
import 'package:advanced_widgets/components/weather.dart';
import 'package:business_sm/business_sm.dart';
import 'package:model_sm/model_sm.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Column(
                  children: [
                    BlocBuilder<WeatherBloc, WeatherData>(
                      builder: (context, state) => Text('${state.degrees.toInt()}'), // Вытаскиваем состояние из стейта и отображаем его,
                    ),
                    BlocBuilder<WeatherBloc, WeatherData>(
                      builder: (context, state) => Text('${state.cloudy.toInt()}'), // Вытаскиваем состояние из стейта и отображаем его,
                    ),
                    Container(
                      //color: Colors.purple,
                      alignment: Alignment.topRight,
                      child: Weather(),
                    ),
                  ],
                ),
            ),
            Container(
              //color: Colors.cyan,
              height: 150,
              width: double.infinity,
              child: Column(
                children: [
                  Text('ProgressBar for Degrees'),
                  BlocBuilder<WeatherBloc, WeatherData>(
                    builder: (bloc, state) => Slider(
                      //label: 'Degrees',
                      min: 0,
                      max: 100,
                      value: state.degrees,
                      onChanged: (value) {context.read<WeatherBloc>().add(SetTemperature(value));},
                    ),
                  ),
                  Text('ProgressBar for Cloudy'),
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
          ],
      ),
    );
  }
}
