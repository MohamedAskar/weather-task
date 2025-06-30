import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/constants/icons.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/core/extensions/text_style.dart';
import 'package:weather/models/location_error_type.dart';
import 'package:weather/services/location/location_service.dart';
import 'package:weather/services/location/location_state.dart';
import 'package:weather/widgets/location_action_buttons.dart';

class LocationSetupWidget extends ConsumerWidget {
  const LocationSetupWidget({super.key, required this.onSearchRequested});

  final VoidCallback onSearchRequested;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationServiceProvider);

    final serviceStatus = locationState.serviceStatus;

    final isLoading = locationState.isLoading;
    final errorType = locationState.errorType;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: 140,
            child: Image.asset(AppIcons.location),
          ),

          if (isLoading) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(width: 8),
                Text(
                  LocationServiceStatus.getLoadingMessage(
                    context,
                    status: serviceStatus,
                  ),
                  style: context.textTheme.titleMedium?.bold,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ] else if (errorType != null || true) ...[
            Text(
              LocationErrorType.getErrorMessage(
                context,
                type: errorType ?? LocationErrorType.geocodingFailed,
              ),
              style: context.textTheme.titleMedium?.bold,
              textAlign: TextAlign.center,
            ),
            LocationErrorCta(
              errorType: errorType ?? LocationErrorType.geocodingFailed,
              onUseMyLocationPressed: () => _requestCurrentLocation(ref),
              onEnableLocationPressed: () => _openLocationSettings(ref),
              onSearchLocationPressed: onSearchRequested,
            ),
          ],

          const SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }

  Future<void> _requestCurrentLocation(WidgetRef ref) async {
    await ref.read(locationServiceProvider.notifier).getCurrentLocation();
  }

  Future<void> _openLocationSettings(WidgetRef ref) async {
    await ref.read(locationServiceProvider.notifier).openLocationSettings();
  }
}
