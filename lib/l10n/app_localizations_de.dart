// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'DonnerBlitz';

  @override
  String get searchLocationHint => 'Nach einem Ort suchen';

  @override
  String get lastUpdated => 'Zuletzt aktualisiert';

  @override
  String get today => 'Heute';

  @override
  String get wind => 'Wind';

  @override
  String get windUnit => 'm/s';

  @override
  String get humidity => 'Luftfeuchtigkeit';

  @override
  String get humidityUnit => '%';

  @override
  String get feelsLike => 'Gefühlt wie';

  @override
  String get pressure => 'Luftdruck';

  @override
  String get pressureUnit => 'hPa';

  @override
  String get sunrise => 'Sonnenaufgang';

  @override
  String get sunset => 'Sonnenuntergang';

  @override
  String daysForecast(int days) {
    return '$days-Tage Vorhersage';
  }

  @override
  String unit(String unit) {
    String _temp0 = intl.Intl.selectLogic(unit, {
      'metric': 'Metrisch',
      'imperial': 'Imperial',
      'other': 'Einheit',
    });
    return '$_temp0';
  }

  @override
  String get error => 'Etwas ist schiefgelaufen';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get noData => 'Bitte suchen Sie nach einem Ort, um zu beginnen';

  @override
  String get noResults => 'Keine Ergebnisse gefunden';

  @override
  String get localTime => 'Ortszeit';

  @override
  String get search => 'Suchen';
}
