import 'package:flutter/material.dart';
import 'package:weather/core/constants/icons.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/core/extensions/text_style.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    super.key,
    this.message,
    this.onButtonPressed,
    this.buttonText,
  });

  final String? message;
  final VoidCallback? onButtonPressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: 140,
            child: Image.asset(AppIcons.location),
          ),
          Text(
            message ?? context.l10n.noData,
            style: context.textTheme.titleMedium?.bold,
            textAlign: TextAlign.center,
          ),
          if (onButtonPressed != null && buttonText != null)
            Center(
              child: FilledButton(
                onPressed: onButtonPressed,
                child: Text(buttonText!),
              ),
            ),
          const SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}
