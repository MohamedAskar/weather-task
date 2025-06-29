import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather/models/city_suggestion.dart';
import 'package:weather/screens/home/controller/home_state.dart';
import 'package:weather/services/last-location/last_location_service.dart';
import 'package:weather/services/search/search_service.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  Timer? _debounceTimer;

  @override
  HomeState build() {
    final lastLocation = ref.read(lastLocationServiceProvider);

    final scrollController = DraggableScrollableController();
    final searchController = TextEditingController();
    final focusNode = FocusNode();

    scrollController.addListener(() {
      if (scrollController.size > 0.15) {
        focusNode.requestFocus();
      } else {
        focusNode.unfocus();
      }
    });

    ref.onDispose(() {
      _debounceTimer?.cancel();
      scrollController.dispose();
      searchController.dispose();
      focusNode.dispose();
    });

    return HomeState(
      scrollController: scrollController,
      searchController: searchController,
      focusNode: focusNode,
      lastLocation: lastLocation,
    );
  }

  void onSearchChanged(String searchText, {String? languageCode}) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      ref
          .read(searchServiceProvider.notifier)
          .searchCities(searchText, languageCode: languageCode);
    });
  }

  Future<void> onSearchResultTap(CitySuggestion city) async {
    ref.read(lastLocationServiceProvider.notifier).setLastLocation(city);
    state.searchController.clear();

    state = state.copyWith(lastLocation: city);
    ref.read(searchServiceProvider.notifier).clear();

    await closeSearchSheet();
  }

  Future<void> onSearchFieldTap() async {
    final scrollController = state.scrollController;
    if (!scrollController.isAttached) return;

    await openSearchSheet();
  }

  Future<void> onTapOutside(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final scrollController = state.scrollController;
    if (!scrollController.isAttached) return;

    await closeSearchSheet();
  }

  Future<void> closeSearchSheet() async {
    final scrollController = state.scrollController;
    if (!scrollController.isAttached) return;

    state.focusNode.unfocus();

    await scrollController.animateTo(
      0.15,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> openSearchSheet() async {
    final scrollController = state.scrollController;
    if (!scrollController.isAttached) return;

    state.focusNode.requestFocus();

    await scrollController.animateTo(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
