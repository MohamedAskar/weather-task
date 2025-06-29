import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather/models/city_suggestion.dart';
import 'package:weather/repositories/geo_repository.dart';

part 'search_service.g.dart';

@riverpod
class SearchService extends _$SearchService {
  @override
  AsyncValue<List<CitySuggestion>> build() {
    return const AsyncValue.data([]);
  }

  Future<void> searchCities(String query, {String? languageCode}) async {
    state = const AsyncValue.loading();
    final searchTerm = query.trim().toLowerCase();
    if (searchTerm.isEmpty) {
      state = const AsyncValue.data([]);
      return;
    }

    try {
      final cities = await ref
          .read(geoRepositoryProvider)
          .searchCities(searchTerm, languageCode: languageCode);

      state = AsyncValue.data(cities);
    } on Exception catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  void clear() {
    state = const AsyncValue.data([]);
  }
}

