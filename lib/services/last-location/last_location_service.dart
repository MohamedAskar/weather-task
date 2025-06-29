import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../models/city_suggestion.dart';
import '../../utils/shared-preferences/shared_preferences_provider.dart';

part 'last_location_service.g.dart';

@riverpod
class LastLocationService extends _$LastLocationService {
  static const String _lastLocationKey = 'last_location';

  @override
  CitySuggestion? build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final lastLocationJson = prefs.getString(_lastLocationKey);

    if (lastLocationJson == null) return null;

    final lastLocation = jsonDecode(lastLocationJson);

    return CitySuggestion.fromJson(lastLocation);
  }

  Future<void> setLastLocation(CitySuggestion city) async {
    final prefs = ref.read(sharedPreferencesProvider);

    final lastLocationJson = jsonEncode(city.toJson());

    await prefs.setString(_lastLocationKey, lastLocationJson);
    state = city;
  }
}
