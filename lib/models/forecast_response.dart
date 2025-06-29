import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/core/extensions/datetime.dart';
import 'package:weather/core/extensions/list.dart';
import 'weather.dart';

part 'forecast_response.freezed.dart';
part 'forecast_response.g.dart';

@freezed
class ForecastResponse with _$ForecastResponse {
  const ForecastResponse._();
  const factory ForecastResponse({
    @Default([]) List<WeatherResponse> list,
    City? city,
  }) = _ForecastResponse;

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);

  int get lowestTemp {
    final min = list.map((item) => item.main?.tempMin).getMin();
    return min?.round() ?? 0;
  }

  int get highestTemp {
    final max = list.map((item) => item.main?.tempMax).getMax();
    return max?.round() ?? 0;
  }

  // Today forecast
  List<WeatherResponse> get todayForecast => list.where((item) {
    final date = item.timestamp;
    return date.isToday();
  }).toList();

  // Upcoming days forecast
  Map<DateTime, List<WeatherResponse>> get groupedByDay {
    return list.groupListsBy((item) => item.timestamp.startOfDay);
  }

  List<WeatherResponse> get upcomingForecast {
    return groupedByDay.entries
        .map((entry) => _getAverageWeather(entry.key, entry.value))
        .toList();
  }

  WeatherResponse _getAverageWeather(
    DateTime date,
    List<WeatherResponse> items,
  ) {
    final temp = items.map((item) => item.main?.temp).getAverage();
    final feelsLike = items.map((item) => item.main?.feelsLike).getAverage();
    final minTemp = items.map((item) => item.main?.tempMin).getMin();
    final maxTemp = items.map((item) => item.main?.tempMax).getMax();
    final humidity = items.map((item) => item.main?.humidity).getAverage();
    final pressure = items.map((item) => item.main?.pressure).getAverage();
    final windSpeed = items.map((item) => item.wind?.speed).getAverage();

    final description = items.map((item) => item.description).join(', ');
    final icon =
        items
            .firstWhereOrNull((item) => item.icon?.contains('d') ?? false)
            ?.icon ??
        items.firstOrNull?.icon;

    final clouds = items.map((item) => item.clouds?.all).getAverage();

    final country = items.firstOrNull?.sys?.country;
    final sunrise = items.firstOrNull?.sys?.sunrise;
    final sunset = items.firstOrNull?.sys?.sunset;

    return WeatherResponse(
      dt: (date.millisecondsSinceEpoch / 1000).toInt(),
      main: Main(
        temp: temp,
        feelsLike: feelsLike,
        tempMin: minTemp,
        tempMax: maxTemp,
        humidity: humidity.toInt(),
        pressure: pressure.toInt(),
      ),
      wind: Wind(speed: windSpeed),
      weather: [Weather(description: description, icon: icon)],
      clouds: Clouds(all: clouds.toInt()),
      sys: Sys(country: country, sunrise: sunrise, sunset: sunset),
    );
  }
}
