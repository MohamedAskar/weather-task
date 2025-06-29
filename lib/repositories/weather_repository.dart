import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather/core/configuration/configuration.dart';
import 'package:weather/core/network/dio_client.dart';
import '../models/forecast_response.dart';
import '../models/weather.dart';

part 'weather_repository.g.dart';

@riverpod
WeatherRepository weatherRepository(Ref ref) {
  return WeatherRepository(client: ref.read(dioClientProvider));
}

class WeatherRepository {
  final DioClient client;

  WeatherRepository({required this.client});

  String getUrl(String path) {
    return '${configuration.weatherApiUrl}$path';
  }

  Future<WeatherResponse> getCurrentWeather({
    required double lat,
    required double lon,
    String? languageCode,
    String? unit,
  }) async {
    try {
      final response = await client.dio.get(
        getUrl('/weather'),
        queryParameters: {
          'lat': lat,
          'lon': lon,
          if (languageCode != null) 'lang': languageCode,
          if (unit != null) 'units': unit,
        },
      );

      final data = response.data;

      if (data != null) {
        return WeatherResponse.fromJson(data);
      } else {
        throw Exception('No data received from API');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch current weather: ${e.message}');
    }
  }

  Future<ForecastResponse> getWeatherForecast({
    required double lat,
    required double lon,
    String? languageCode,
    String? unit,
  }) async {
    try {
      final response = await client.dio.get(
        getUrl('/forecast'),
        queryParameters: {
          'lat': lat,
          'lon': lon,
          if (languageCode != null) 'lang': languageCode,
          if (unit != null) 'units': unit,
        },
      );

      final data = response.data;

      if (data != null) {
        return ForecastResponse.fromJson(data);
      } else {
        throw Exception('No data received from API');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch forecast: ${e.message}');
    }
  }
}
