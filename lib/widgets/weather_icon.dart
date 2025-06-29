import 'package:flutter/material.dart';

import '../utils/weather_icons.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({super.key, required this.icon, this.size = 48});

  final String icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Image.asset(WeatherIcons.getIcon(icon)),
    );
  }
}
