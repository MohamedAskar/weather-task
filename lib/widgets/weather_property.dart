import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/core/extensions/text_style.dart';

class WeatherProperty<T> extends StatelessWidget {
  const WeatherProperty({
    super.key,
    required this.title,
    required this.value,
    this.unit,
    required this.icon,
  });

  final String title;
  final T value;
  final String? unit;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 24),
        FittedBox(
          child: Text(
            title,
            style: context.textTheme.bodyMedium?.semibold,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        const SizedBox(height: 8),
        FittedBox(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: value.toString(),
                  style: context.textTheme.headlineMedium?.bold,
                ),
                if (unit != null)
                  TextSpan(
                    text: ' $unit',
                    style: context.textTheme.bodyLarge?.semibold,
                  ),
              ],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
