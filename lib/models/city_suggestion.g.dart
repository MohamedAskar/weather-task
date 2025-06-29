// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_suggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CitySuggestionImpl _$$CitySuggestionImplFromJson(Map<String, dynamic> json) =>
    _$CitySuggestionImpl(
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      country: json['country'] as String,
      state: json['state'] as String?,
      localNames: (json['local_names'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$CitySuggestionImplToJson(
  _$CitySuggestionImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'lat': instance.lat,
  'lon': instance.lon,
  'country': instance.country,
  'state': instance.state,
  'local_names': instance.localNames,
};
