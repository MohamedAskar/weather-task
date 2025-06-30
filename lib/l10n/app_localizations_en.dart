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

  @override
  String get useMyLocation => 'Use My Location';

  @override
  String get locationPermissionDenied =>
      'Location permission is required to get weather data for your current location';

  @override
  String get enableLocation => 'Enable Location';

  @override
  String get gettingLocation => 'Getting your location...';

  @override
  String get checkingPermission => 'Checking location permission...';

  @override
  String get requestingPermission => 'Requesting location permission...';

  @override
  String get loadingLocationData => 'Loading location data...';

  @override
  String get errorPermissionDenied =>
      'Location permission is required to get weather for your location.';

  @override
  String get errorPermissionPermanentlyDenied =>
      'Location permission was permanently denied. Please enable it in settings.';

  @override
  String get errorLocationServicesDisabled =>
      'Location services are disabled. Please enable them in your device settings.';

  @override
  String get errorLocationTimeout =>
      'Location request timed out. Please try again.';

  @override
  String get errorLocationAccuracyLow =>
      'GPS signal is weak. Please move to an open area and try again.';

  @override
  String get errorNetworkError =>
      'Network error. Please check your internet connection and try again.';

  @override
  String get errorGeocodingFailed =>
      'Unable to determine your location name. Please try again.';

  @override
  String get errorGpsUnavailable =>
      'GPS is currently unavailable. Please try again later.';

  @override
  String get errorUnknown => 'An unexpected error occurred. Please try again.';
}
