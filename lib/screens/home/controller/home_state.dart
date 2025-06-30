import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required DraggableScrollableController scrollController,
    required TextEditingController searchController,
    required FocusNode focusNode,
  }) = _HomeState;
}
