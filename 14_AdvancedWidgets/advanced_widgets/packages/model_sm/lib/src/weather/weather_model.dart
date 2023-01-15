// Model of Weather
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';

@freezed
class WeatherData with _$WeatherData{
  const factory WeatherData({
    required double degrees,
    required double cloudy,
  }) = _WeatherData;
}