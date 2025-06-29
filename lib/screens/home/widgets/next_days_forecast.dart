import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/core/extensions/datetime.dart';
import 'package:weather/core/extensions/text_style.dart';
import 'package:weather/models/weather.dart';
import 'package:weather/screens/home/widgets/temperature_range_indicator.dart';
import 'package:weather/widgets/weather_icon.dart';

class NextDaysForecast extends StatelessWidget {
  const NextDaysForecast({
    super.key,
    required this.forecast,
    required this.lowestTemp,
    required this.highestTemp,
  });

  final List<WeatherResponse> forecast;
  final int lowestTemp;
  final int highestTemp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            context.l10n.daysForecast(forecast.length),
            style: context.textTheme.bodyMedium?.bold,
          ),
        ),
        const SizedBox(height: 8),
        ListView.separated(
          itemCount: forecast.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          separatorBuilder: (_, _) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = forecast[index];
            final date = item.timestamp;
            final icon = item.icon;
            final lowTemp = item.main?.tempMin?.round();
            final maxTemp = item.main?.tempMax?.round();

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    date.getDayOfWeek(context),
                    style: context.textTheme.titleMedium?.bold,
                  ),
                ),
                if (icon != null) WeatherIcon(icon: icon, size: 28),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 32,
                        child: Text(
                          '$lowTemp°',
                          style: context.textTheme.bodyMedium?.semibold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      TemperatureRangeIndicator(
                        overallMinTemp: lowestTemp,
                        overallMaxTemp: highestTemp,
                        dayMinTemp: lowTemp ?? 0,
                        dayMaxTemp: maxTemp ?? 0,
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 32,
                        child: Text(
                          '$maxTemp°',
                          style: context.textTheme.bodyMedium?.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
