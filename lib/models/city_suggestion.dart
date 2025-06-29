import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_suggestion.freezed.dart';
part 'city_suggestion.g.dart';

@freezed
class CitySuggestion with _$CitySuggestion {
  const CitySuggestion._();
  const factory CitySuggestion({
    required String name,
    required double lat,
    required double lon,
    required String country,
    String? state,
    @JsonKey(name: 'local_names') Map<String, String>? localNames,
  }) = _CitySuggestion;

  factory CitySuggestion.fromJson(Map<String, dynamic> json) =>
      _$CitySuggestionFromJson(json);

  String getLocalName(String languageCode) {
    return localNames?[languageCode] ?? name;
  }
}
