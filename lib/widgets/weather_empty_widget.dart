import 'package:flutter/material.dart';
import 'package:weather/core/constants/icons.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/core/extensions/text_style.dart';

class WeatherEmptyWidget extends StatelessWidget {
  const WeatherEmptyWidget({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: 140,
            child: Image.asset(AppIcons.location),
          ),
          const SizedBox(height: 16),
          Text(
            message ?? context.l10n.noData,
            style: context.textTheme.titleMedium?.bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}
