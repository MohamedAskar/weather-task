import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/core/extensions/datetime.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/widgets/weather_property.dart';

class WeatherProperties extends ConsumerWidget {
  const WeatherProperties({super.key, required this.weather});

  final WeatherResponse weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feelsLike = weather.feelsLike;
    final humidity = weather.humidity;
    final pressure = weather.pressure;

    final windSpeed = weather.windSpeed;

    final sunrise = weather.sunriseTime;
    final sunset = weather.sunsetTime;

    return GridView.extent(
      maxCrossAxisExtent: 150,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24),
      mainAxisSpacing: 24,
      crossAxisSpacing: 24,
      childAspectRatio: 1.15,
      children: [
        if (windSpeed != null)
          WeatherProperty(
            title: context.l10n.wind,
            value: windSpeed,
            unit: context.l10n.windUnit,
            icon: Icons.air,
          ),
        if (humidity != null)
          WeatherProperty(
            title: context.l10n.humidity,
            value: humidity,
            unit: context.l10n.humidityUnit,
            icon: Icons.water,
          ),
        if (feelsLike != null)
          WeatherProperty(
            title: context.l10n.feelsLike,
            value: '$feelsLike°',
            icon: Icons.thermostat_outlined,
          ),
        if (pressure != null)
          WeatherProperty(
            title: context.l10n.pressure,
            value: pressure,
            unit: context.l10n.pressureUnit,
            icon: Icons.speed_outlined,
          ),
        if (sunrise != null)
          WeatherProperty(
            title: context.l10n.sunrise,
            value: sunrise.getTimeOfDay(context),
            icon: Icons.light_mode_outlined,
          ),
        if (sunset != null)
          WeatherProperty(
            title: context.l10n.sunset,
            value: sunset.getTimeOfDay(context),
            icon: Icons.wb_twilight_outlined,
          ),
      ],
    );
  }
}
