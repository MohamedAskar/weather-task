import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/screens/home/controller/home_controller.dart';
import 'package:weather/screens/home/widgets/location_search_result.dart';
import 'package:weather/services/location/location_service.dart';
import 'package:weather/widgets/home_sheet_drag_handle_delegate.dart';

import '../widgets/persistent_search_bar.dart';

class LocationSearchSheet extends ConsumerWidget {
  const LocationSearchSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCode = context.languageCode;

    final controller = ref.watch(homeControllerProvider);

    final scrollController = controller.scrollController;
    final searchController = controller.searchController;
    final focusNode = controller.focusNode;

    final canJumpToCurrentLocation = ref.watch(
      locationServiceProvider.select((state) => state.canJumpToCurrentLocation),
    );

    void onJumpToCurrentLocationPressed() {
      if (!context.mounted) return;

      ref.read(locationServiceProvider.notifier).jumpToCurrentLocation();

      if (!context.mounted) return;

      ref.read(homeControllerProvider.notifier).onSearchResultTap();
    }

    void onSearchChanged(String searchText) {
      ref
          .read(homeControllerProvider.notifier)
          .onSearchChanged(searchText, languageCode: languageCode);
    }

    return SafeArea(
      bottom: false,
      child: DraggableScrollableSheet(
        initialChildSize: 0,
        minChildSize: 0,
        maxChildSize: 1,
        snap: true,
        controller: scrollController,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: Offset(0, -10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: HomeSheetDragHandleDelegate(
                      colorScheme: context.colorScheme,
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    sliver: SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverSearchBar(
                        controller: searchController,
                        onChanged: onSearchChanged,
                        focusNode: focusNode,
                      ),
                    ),
                  ),
                  if (canJumpToCurrentLocation)
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          children: [
                            TextButton.icon(
                              onPressed: onJumpToCurrentLocationPressed,
                              icon: const Icon(Icons.my_location),
                              label: Text(context.l10n.useMyLocation),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const LocationSearchResult(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
