import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/models/city_suggestion.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required DraggableScrollableController scrollController,
    required TextEditingController searchController,
    required FocusNode focusNode,
    CitySuggestion? lastLocation,
  }) = _HomeState;
}
