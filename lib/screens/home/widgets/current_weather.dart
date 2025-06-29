import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/core/extensions/datetime.dart';
import 'package:weather/core/extensions/strings.dart';
import 'package:weather/core/extensions/text_style.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/widgets/weather_icon.dart';

import 'local_time_widget.dart';

class CurrentWeather extends ConsumerWidget {
  const CurrentWeather({super.key, required this.weather});

  final WeatherResponse weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icon = weather.icon;
    final description = weather.description;
    final temperature = weather.temperature;
    final minTemp = weather.minTemp;
    final maxTemp = weather.maxTemp;
    final timestamp = weather.timestamp;
    final timezone = weather.timezone;

    final deviceTimezoneOffset = DateTime.now().timeZoneOffset.inSeconds;

    return IntrinsicHeight(
      child: Row(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '$temperature°',
                  style: TextStyle(fontSize: 120, height: 1).extraBold,
                ),
                if (description != null)
                  Text(
                    description.capitalize(),
                    style: context.textTheme.titleMedium?.bold,
                  ),
                if (timezone != deviceTimezoneOffset)
                  LocalTimeWidget(timezoneOffset: timezone ?? 0),
              ],
            ),
          ),
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (icon != null) WeatherIcon(icon: icon, size: 64),
              Text(
                '$minTemp° - $maxTemp°',
                style: context.textTheme.titleMedium?.bold,
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    context.l10n.lastUpdated,
                    style: context.textTheme.bodySmall,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: timestamp.getTimeOfDay(context),
                          style: context.textTheme.bodySmall?.bold,
                        ),
                        if (timezone != deviceTimezoneOffset)
                          TextSpan(
                            text: ' (${timestamp.timezoneOffsetToGMT()})',
                            style: context.textTheme.labelSmall,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
