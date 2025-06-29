import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/core/extensions/text_style.dart';
import 'package:weather/models/city_suggestion.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key, required this.location});

  final CitySuggestion location;

  @override
  Widget build(BuildContext context) {
    final languageCode = context.languageCode;
    return Row(
      spacing: 4,
      children: [
        Icon(Icons.explore_outlined, size: 32),
        Text(
          location.getLocalName(languageCode),
          style: context.textTheme.headlineLarge?.bold,
        ),
      ],
    );
  }
}
