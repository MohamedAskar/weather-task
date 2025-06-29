import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/core/extensions/datetime.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class WeatherResponse with _$WeatherResponse {
  const WeatherResponse._();
  const factory WeatherResponse({
    required int dt,
    Main? main,
    @Default([]) List<Weather> weather,
    Wind? wind,
    Clouds? clouds,
    Sys? sys,
    City? city,
    Coord? coord,
    String? name,
    int? timezone,
    double? pop,
  }) = _WeatherResponse;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  int? get temperature => main?.temp.round();
  int? get minTemp => main?.tempMin?.round();
  int? get maxTemp => main?.tempMax?.round();

  int? get feelsLike => main?.feelsLike?.round();

  int? get humidity => main?.humidity;
  int? get pressure => main?.pressure;

  int? get windSpeed => wind?.speed?.round();
  int? get windGust => wind?.gust?.round();
  int? get windDeg => wind?.deg;

  String? get description => weather.firstOrNull?.description;
  String? get icon => weather.firstOrNull?.icon;

  DateTime? get sunriseTime {
    final sunrise = sys?.sunrise;
    final timezone = this.timezone;
    if (sunrise == null || timezone == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(
      sunrise * 1000,
      isUtc: true,
    ).getLocalTime(timezone);
  }

  DateTime? get sunsetTime {
    final sunset = sys?.sunset;
    final timezone = this.timezone;
    if (sunset == null || timezone == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(
      sunset * 1000,
      isUtc: true,
    ).getLocalTime(timezone);
  }

  DateTime get timestamp {
    return DateTime.fromMillisecondsSinceEpoch(dt * 1000);
  }
}

@freezed
class Weather with _$Weather {
  const Weather._();
  const factory Weather({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
class Main with _$Main {
  const Main._();
  const factory Main({
    required double temp,
    @JsonKey(name: 'feels_like') double? feelsLike,
    @JsonKey(name: 'temp_min') double? tempMin,
    @JsonKey(name: 'temp_max') double? tempMax,
    int? pressure,
    int? humidity,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
class Wind with _$Wind {
  const Wind._();
  const factory Wind({double? speed, int? deg, double? gust}) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

@freezed
class Clouds with _$Clouds {
  const Clouds._();
  const factory Clouds({int? all}) = _Clouds;

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@freezed
class Sys with _$Sys {
  const Sys._();
  const factory Sys({String? country, int? sunrise, int? sunset}) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@freezed
class Coord with _$Coord {
  const Coord._();
  const factory Coord({double? lon, double? lat}) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@freezed
class City with _$City {
  const City._();
  const factory City({
    String? name,
    Coord? coord,
    String? country,
    int? timezone,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
