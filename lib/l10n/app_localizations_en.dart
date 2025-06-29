// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'ThunderBolt';

  @override
  String get searchLocationHint => 'Search for a location';

  @override
  String get lastUpdated => 'Last updated';

  @override
  String get today => 'Today';

  @override
  String get wind => 'Wind';

  @override
  String get windUnit => 'm/s';

  @override
  String get humidity => 'Humidity';

  @override
  String get humidityUnit => '%';

  @override
  String get feelsLike => 'Feels Like';

  @override
  String get pressure => 'Pressure';

  @override
  String get pressureUnit => 'hPa';

  @override
  String get sunrise => 'Sunrise';

  @override
  String get sunset => 'Sunset';

  @override
  String daysForecast(int days) {
    return '$days-Day Forecast';
  }

  @override
  String unit(String unit) {
    String _temp0 = intl.Intl.selectLogic(unit, {
      'metric': 'Metric',
      'imperial': 'Imperial',
      'other': 'Unit',
    });
    return '$_temp0';
  }

  @override
  String get error => 'Something went wrong';

  @override
  String get retry => 'Retry';

  @override
  String get noData => 'Please search for a location to get started';

  @override
  String get noResults => 'No results found';

  @override
  String get localTime => 'Local time';

  @override
  String get search => 'Search';
}
