import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/configuration/configuration.dart';
import '../core/network/dio_client.dart';
import '../models/city_suggestion.dart';

part 'geo_repository.g.dart';

@riverpod
GeoRepository geoRepository(Ref ref) {
  return GeoRepository(client: ref.read(dioClientProvider));
}

class GeoRepository {
  final DioClient client;

  GeoRepository({required this.client});

  String getUrl(String path) {
    return '${configuration.geocodingApiUrl}$path';
  }

  Future<List<CitySuggestion>> searchCities(
    String query, {
    String? languageCode,
  }) async {
    try {
      final response = await client.dio.get(
        getUrl('/direct'),
        queryParameters: {'q': query, 'lang': languageCode},
      );

      final data = response.data as List<dynamic>?;

      final suggestions =
          data?.map((json) {
            return CitySuggestion.fromJson(json as Map<String, dynamic>);
          }).toList() ??
          [];

      return suggestions;
    } on DioException catch (e) {
      throw Exception('Failed to search cities: ${e.message}');
    }
  }

  Future<CitySuggestion?> getCitySuggestion(
    double lat,
    double lon, {
    String? languageCode,
  }) async {
    try {
      final response = await client.dio.get(
        getUrl('/reverse'),
        queryParameters: {'lat': lat, 'lon': lon, 'lang': languageCode},
      );

      final data = response.data as List<dynamic>?;

      final suggestion = data?.firstOrNull;

      if (suggestion == null) {
        return null;
      }

      return CitySuggestion.fromJson(suggestion);
    } on DioException catch (e) {
      throw Exception('Failed to get city suggestion: ${e.message}');
    }
  }
}
