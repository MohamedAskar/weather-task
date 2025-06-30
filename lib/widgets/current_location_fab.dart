import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/services/location/location_service.dart';

class CurrentLocationFab extends ConsumerWidget {
  const CurrentLocationFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canJumpToCurrentLocation = ref.watch(
      locationServiceProvider.select((state) => state.canJumpToCurrentLocation),
    );

    if (!canJumpToCurrentLocation) return const SizedBox.shrink();

    void onPressed() {
      ref.read(locationServiceProvider.notifier).jumpToCurrentLocation();
    }

    return FloatingActionButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      onPressed: onPressed,
      tooltip: context.l10n.useMyLocation,
      child: const Icon(Icons.my_location),
    );
  }
}
