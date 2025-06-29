// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherResponseImpl _$$WeatherResponseImplFromJson(
  Map<String, dynamic> json,
) => _$WeatherResponseImpl(
  dt: (json['dt'] as num).toInt(),
  main: json['main'] == null
      ? null
      : Main.fromJson(json['main'] as Map<String, dynamic>),
  weather:
      (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  wind: json['wind'] == null
      ? null
      : Wind.fromJson(json['wind'] as Map<String, dynamic>),
  clouds: json['clouds'] == null
      ? null
      : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
  sys: json['sys'] == null
      ? null
      : Sys.fromJson(json['sys'] as Map<String, dynamic>),
  city: json['city'] == null
      ? null
      : City.fromJson(json['city'] as Map<String, dynamic>),
  coord: json['coord'] == null
      ? null
      : Coord.fromJson(json['coord'] as Map<String, dynamic>),
  name: json['name'] as String?,
  timezone: (json['timezone'] as num?)?.toInt(),
  pop: (json['pop'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$WeatherResponseImplToJson(
  _$WeatherResponseImpl instance,
) => <String, dynamic>{
  'dt': instance.dt,
  'main': instance.main,
  'weather': instance.weather,
  'wind': instance.wind,
  'clouds': instance.clouds,
  'sys': instance.sys,
  'city': instance.city,
  'coord': instance.coord,
  'name': instance.name,
  'timezone': instance.timezone,
  'pop': instance.pop,
};

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      id: (json['id'] as num?)?.toInt(),
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

_$MainImpl _$$MainImplFromJson(Map<String, dynamic> json) => _$MainImpl(
  temp: (json['temp'] as num).toDouble(),
  feelsLike: (json['feels_like'] as num?)?.toDouble(),
  tempMin: (json['temp_min'] as num?)?.toDouble(),
  tempMax: (json['temp_max'] as num?)?.toDouble(),
  pressure: (json['pressure'] as num?)?.toInt(),
  humidity: (json['humidity'] as num?)?.toInt(),
);

Map<String, dynamic> _$$MainImplToJson(_$MainImpl instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

_$WindImpl _$$WindImplFromJson(Map<String, dynamic> json) => _$WindImpl(
  speed: (json['speed'] as num?)?.toDouble(),
  deg: (json['deg'] as num?)?.toInt(),
  gust: (json['gust'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$WindImplToJson(_$WindImpl instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };

_$CloudsImpl _$$CloudsImplFromJson(Map<String, dynamic> json) =>
    _$CloudsImpl(all: (json['all'] as num?)?.toInt());

Map<String, dynamic> _$$CloudsImplToJson(_$CloudsImpl instance) =>
    <String, dynamic>{'all': instance.all};

_$SysImpl _$$SysImplFromJson(Map<String, dynamic> json) => _$SysImpl(
  country: json['country'] as String?,
  sunrise: (json['sunrise'] as num?)?.toInt(),
  sunset: (json['sunset'] as num?)?.toInt(),
);

Map<String, dynamic> _$$SysImplToJson(_$SysImpl instance) => <String, dynamic>{
  'country': instance.country,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
};

_$CoordImpl _$$CoordImplFromJson(Map<String, dynamic> json) => _$CoordImpl(
  lon: (json['lon'] as num?)?.toDouble(),
  lat: (json['lat'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$CoordImplToJson(_$CoordImpl instance) =>
    <String, dynamic>{'lon': instance.lon, 'lat': instance.lat};

_$CityImpl _$$CityImplFromJson(Map<String, dynamic> json) => _$CityImpl(
  name: json['name'] as String?,
  coord: json['coord'] == null
      ? null
      : Coord.fromJson(json['coord'] as Map<String, dynamic>),
  country: json['country'] as String?,
  timezone: (json['timezone'] as num?)?.toInt(),
);

Map<String, dynamic> _$$CityImplToJson(_$CityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'coord': instance.coord,
      'country': instance.country,
      'timezone': instance.timezone,
    };
