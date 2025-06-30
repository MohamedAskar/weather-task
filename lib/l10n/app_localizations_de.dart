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

  @override
  String get useMyLocation => 'Meinen Standort verwenden';

  @override
  String get locationPermissionDenied =>
      'Standortberechtigung ist erforderlich, um Wetterdaten für Ihren aktuellen Standort zu erhalten';

  @override
  String get enableLocation => 'Standort aktivieren';

  @override
  String get gettingLocation => 'Standort wird ermittelt...';

  @override
  String get locationError =>
      'Ihr Standort konnte nicht ermittelt werden. Bitte suchen Sie stattdessen nach einem Ort.';

  @override
  String get checkingPermission => 'Standortberechtigung wird geprüft...';

  @override
  String get requestingPermission => 'Standortberechtigung wird angefordert...';

  @override
  String get loadingLocationData => 'Standortdaten werden geladen...';

  @override
  String get errorPermissionDenied =>
      'Standortberechtigung ist erforderlich, um das Wetter für Ihren Standort zu erhalten.';

  @override
  String get errorPermissionPermanentlyDenied =>
      'Standortberechtigung wurde dauerhaft verweigert. Bitte aktivieren Sie sie in den Einstellungen.';

  @override
  String get errorLocationServicesDisabled =>
      'Standortdienste sind deaktiviert. Bitte aktivieren Sie sie in Ihren Geräteeinstellungen.';

  @override
  String get errorLocationTimeout =>
      'Standortanfrage ist abgelaufen. Bitte versuchen Sie es erneut.';

  @override
  String get errorLocationAccuracyLow =>
      'GPS-Signal ist schwach. Bitte begeben Sie sich zu einem offenen Bereich und versuchen Sie es erneut.';

  @override
  String get errorNetworkError =>
      'Netzwerkfehler. Bitte überprüfen Sie Ihre Internetverbindung und versuchen Sie es erneut.';

  @override
  String get errorGeocodingFailed =>
      'Ihr Standortname konnte nicht ermittelt werden. Bitte versuchen Sie es erneut.';

  @override
  String get errorGpsUnavailable =>
      'GPS ist derzeit nicht verfügbar. Bitte versuchen Sie es später erneut.';

  @override
  String get errorUnknown =>
      'Ein unerwarteter Fehler ist aufgetreten. Bitte versuchen Sie es erneut.';
}
