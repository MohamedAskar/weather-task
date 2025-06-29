import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/models/forecast_response.dart';
import 'package:weather/models/weather.dart';

import '../widgets/current_weather.dart';
import '../widgets/weather_forecast.dart';
import '../widgets/weather_properties.dart';

class WeatherView extends ConsumerWidget {
  const WeatherView({
    super.key,
    required this.weather,
    required this.forecast,
    required this.onRefresh,
  });

  final WeatherResponse weather;
  final ForecastResponse forecast;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = this.weather;
    final forecast = this.forecast;

    return RefreshIndicator(
      color: context.colorScheme.onSurface,
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 120),
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: CurrentWeather(weather: weather),
              ),
              WeatherForecast(forecast: forecast),
              Divider(height: 1, indent: 16, endIndent: 16),
              WeatherProperties(weather: weather),
            ],
          ),
        ),
      ),
    );
  }
}
