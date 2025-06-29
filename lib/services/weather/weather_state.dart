import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/models/forecast_response.dart';
import 'package:weather/models/weather.dart';

part 'weather_state.freezed.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    WeatherResponse? currentWeather,
    ForecastResponse? forecast,
  }) = _WeatherState;
}
