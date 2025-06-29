import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/models/forecast_response.dart';
import 'package:weather/screens/home/widgets/next_days_forecast.dart';

import 'upcoming_weather_forecast.dart';

class WeatherForecast extends ConsumerWidget {
  const WeatherForecast({super.key, required this.forecast});

  final ForecastResponse forecast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lowestTemp = forecast.lowestTemp;
    final highestTemp = forecast.highestTemp;

    final todayForecast = forecast.list.take(6).toList();
    final timezone = forecast.city?.timezone;
    final upcomingForecast = forecast.upcomingForecast;

    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: UpcomingWeatherForecast(
            forecast: todayForecast,
            timezoneOffset: timezone ?? 0,
          ),
        ),
        Divider(height: 1, indent: 16, endIndent: 16),
        NextDaysForecast(
          forecast: upcomingForecast,
          lowestTemp: lowestTemp,
          highestTemp: highestTemp,
        ),
      ],
    );
  }
}
