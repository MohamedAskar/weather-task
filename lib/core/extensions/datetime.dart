import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/extensions/context.dart';

extension DateTimeExtension on DateTime {
  DateTime get startOfDay => DateTime(year, month, day);

  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  bool isToday() => isSameDay(DateTime.now());

  String getDayOfWeek(BuildContext context) {
    if (isToday()) {
      return context.l10n.today;
    }
    return DateFormat('EEE').format(this);
  }

  String getTimeOfDay(BuildContext context, {bool minutes = true}) {
    final format = minutes ? 'HH:mm' : 'HH';
    return DateFormat(format, context.languageCode).format(this);
  }

  DateTime getLocalTime(int timezoneOffsetSeconds) {
    final utcTime = isUtc ? this : toUtc();

    return utcTime.add(Duration(seconds: timezoneOffsetSeconds));
  }

  String timezoneOffsetToGMT({int? timezoneOffset}) {
    final offset = timezoneOffset ?? timeZoneOffset.inSeconds;
    if (offset == 0) return 'GMT';

    final isNegative = offset < 0;
    final absSeconds = offset.abs();
    final hours = absSeconds ~/ 3600;
    final minutes = (absSeconds % 3600) ~/ 60;

    final sign = isNegative ? '-' : '+';
    if (minutes == 0) {
      return 'GMT$sign$hours';
    } else {
      return 'GMT$sign$hours:${minutes.toString().padLeft(2, '0')}';
    }
  }
}
