import 'package:flutter/material.dart';
import 'package:weather/l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  Size get screenSize => MediaQuery.sizeOf(this);

  double get width => screenSize.width;

  double get height => screenSize.height;

  Locale get locale => Localizations.localeOf(this);

  String get languageCode => locale.languageCode;

  String? get countryCode => locale.countryCode;

  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
