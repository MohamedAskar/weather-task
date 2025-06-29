import 'package:weather/core/constants/icons.dart';

class WeatherIcons {
  static String getIcon(String iconCode) {
    final isNight = iconCode.toLowerCase().contains('n');
    switch (iconCode.substring(0, 2)) {
      case '01':
        if (isNight) return AppIcons.moon;
        return AppIcons.sun;
      case '02':
        if (isNight) return AppIcons.cloudMoon;
        return AppIcons.cloudSun;
      case '03':
        return AppIcons.cloud;
      case '04':
        return AppIcons.brokenClouds;
      case '09':
        return AppIcons.rainy;
      case '10':
        if (isNight) return AppIcons.cloudMoonRain;
        return AppIcons.cloudSunRain;
      case '11':
        return AppIcons.thunderstorm;
      case '13':
        return AppIcons.snow;
      case '50':
        return AppIcons.cloud;
      default:
        return AppIcons.sun;
    }
  }
}
