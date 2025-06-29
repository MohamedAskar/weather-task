import 'package:flutter/material.dart';
import 'package:weather/core/constants/icons.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/core/extensions/text_style.dart';

class WeatherErrorWidget extends StatelessWidget {
  const WeatherErrorWidget({super.key, this.error, required this.onTryAgain});

  final String? error;
  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppIcons.error, width: 100, height: 100),
          Text(
            error ?? context.l10n.error,
            style: context.textTheme.titleMedium?.bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Center(
            child: FilledButton(
              onPressed: onTryAgain,
              child: Text(context.l10n.retry),
            ),
          ),
          const SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}
