import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model_sm/model_sm.dart';

abstract class WeatherEvent {}

class SetTemperature extends WeatherEvent {
  final double temp;
  SetTemperature(this.temp);
}

class SetCloudy extends WeatherEvent {
  final double cloudy;
  SetCloudy(this.cloudy);
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherData>{
  WeatherBloc() : super(WeatherData(degrees: 0.0, cloudy: 0.0))  {
    on<SetTemperature>((event, emit) => emit(state.copyWith(degrees: event.temp)));
    on<SetCloudy>((event, emit) => emit(state.copyWith(cloudy: event.cloudy)));
  }
}
