import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather/screens/home/controller/home_state.dart';
import 'package:weather/services/search/search_service.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  Timer? _debounceTimer;

  static const double closedSheetSize = 0;
  static const double openSheetSize = 1;

  @override
  HomeState build() {
    final scrollController = DraggableScrollableController();
    final searchController = TextEditingController();
    final focusNode = FocusNode();

    scrollController.addListener(() {
      if (scrollController.size > closedSheetSize) {
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

  Future<void> onSearchResultTap() async {
    state.searchController.clear();
    ref.read(searchServiceProvider.notifier).clear();

    await closeSearchSheet();
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
      closedSheetSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> openSearchSheet() async {
    final scrollController = state.scrollController;
    if (!scrollController.isAttached) return;

    state.focusNode.requestFocus();

    await scrollController.animateTo(
      openSheetSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
