import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather/core/extensions/datetime.dart';
import 'package:weather/models/weather.dart';

part 'theme_controller_provider.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void update(WeatherResponse? currentWeather) {
    final sunrise = currentWeather?.sunriseTime;
    final sunset = currentWeather?.sunsetTime;
    final timezone = currentWeather?.timezone;

    if (sunrise == null || sunset == null || timezone == null) {
      state = ThemeMode.system;
      return;
    }

    final now = DateTime.now().getLocalTime(timezone);

    if (now.isAfter(sunrise) && now.isBefore(sunset)) {
      state = ThemeMode.light;
    } else {
      state = ThemeMode.dark;
    }
  }
}
