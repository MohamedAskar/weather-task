import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/core/extensions/datetime.dart';
import 'package:weather/core/extensions/text_style.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/widgets/weather_icon.dart';

class UpcomingWeatherForecast extends StatelessWidget {
  const UpcomingWeatherForecast({
    super.key,
    required this.forecast,
    required this.timezoneOffset,
  });

  final List<WeatherResponse> forecast;
  final int timezoneOffset;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 32,

        children: forecast.map((item) {
          final icon = item.icon;
          final dateTime = item.timestamp;
          final temperature = item.temperature;

          return Column(
            spacing: 8,
            children: [
              Text(
                dateTime
                    .getLocalTime(timezoneOffset)
                    .getTimeOfDay(context, minutes: false),
                style: context.textTheme.labelMedium?.semibold,
              ),
              if (icon != null) WeatherIcon(icon: icon, size: 32),
              Text('$temperature°', style: context.textTheme.bodyMedium?.bold),
            ],
          );
        }).toList(),
      ),
    );
  }
}
