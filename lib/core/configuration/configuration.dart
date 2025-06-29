import 'package:flutter_dotenv/flutter_dotenv.dart';

final configuration = Configuration();

class Configuration {
  Uri get weatherApiUrl {
    return Uri.parse(dotenv.env['WEATHER_API_URL'] ?? '');
  }

  Uri get geocodingApiUrl {
    return Uri.parse(dotenv.env['GEOCODING_API_URL'] ?? '');
  }

  Uri get iconBaseUrl {
    return Uri.parse(dotenv.env['ICON_BASE_URL'] ?? '');
  }

  String get apiKey {
    return dotenv.env['API_KEY'] ?? '';
  }
}
