import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/core/extensions/datetime.dart';
import 'package:weather/core/extensions/text_style.dart';
import 'package:weather/screens/home/controller/clock_controller_provider.dart';

class LocalTimeWidget extends ConsumerWidget {
  const LocalTimeWidget({super.key, required this.timezoneOffset});

  final int timezoneOffset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clockStream = ref.watch(clockControllerProvider);
    final clock = clockStream.valueOrNull ?? DateTime.now();
    final localTime = clock.getLocalTime(timezoneOffset);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.localTime, style: context.textTheme.bodySmall),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: localTime.getTimeOfDay(context),
                style: context.textTheme.bodySmall?.bold,
              ),
              TextSpan(
                text:
                    ' (${localTime.timezoneOffsetToGMT(timezoneOffset: timezoneOffset)})',
                style: context.textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
