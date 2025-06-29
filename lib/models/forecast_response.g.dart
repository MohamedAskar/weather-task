// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForecastResponseImpl _$$ForecastResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ForecastResponseImpl(
  list:
      (json['list'] as List<dynamic>?)
          ?.map((e) => WeatherResponse.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  city: json['city'] == null
      ? null
      : City.fromJson(json['city'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ForecastResponseImplToJson(
  _$ForecastResponseImpl instance,
) => <String, dynamic>{'list': instance.list, 'city': instance.city};
