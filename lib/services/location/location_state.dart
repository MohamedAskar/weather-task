import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/models/city_suggestion.dart';
import 'package:weather/models/location_error_type.dart';

import '../../models/location_permission_status.dart';

part 'location_state.freezed.dart';

enum LocationServiceStatus {
  idle,
  checkingPermission,
  requestingPermission,
  gettingLocation,
  loadingLocationData,
  success,
  error;

  static String getLoadingMessage(
    BuildContext context, {
    required LocationServiceStatus status,
  }) {
    final l10n = context.l10n;
    switch (status) {
      case LocationServiceStatus.checkingPermission:
        return l10n.checkingPermission;
      case LocationServiceStatus.requestingPermission:
        return l10n.requestingPermission;
      case LocationServiceStatus.gettingLocation:
        return l10n.gettingLocation;
      case LocationServiceStatus.loadingLocationData:
        return l10n.loadingLocationData;
      default:
        return '';
    }
  }
}

@freezed
class LocationState with _$LocationState {
  const LocationState._();
  const factory LocationState({
    CitySuggestion? savedLocation,
    CitySuggestion? currentLocation,
    @Default(LocationPermissionStatus.unknown)
    LocationPermissionStatus permissionStatus,
    @Default(LocationServiceStatus.idle) LocationServiceStatus serviceStatus,
    LocationErrorType? errorType,
  }) = _LocationState;

  CitySuggestion? get activeLocation => savedLocation ?? currentLocation;

  bool get isLoading {
    return serviceStatus == LocationServiceStatus.checkingPermission ||
        serviceStatus == LocationServiceStatus.requestingPermission ||
        serviceStatus == LocationServiceStatus.gettingLocation ||
        serviceStatus == LocationServiceStatus.loadingLocationData;
  }

  bool get canJumpToCurrentLocation {
    if (permissionStatus == LocationPermissionStatus.denied ||
        permissionStatus == LocationPermissionStatus.permanentlyDenied) {
      return false;
    }

    if (isLoading) return false;

    final savedLat = savedLocation?.lat ?? 0;
    final savedLon = savedLocation?.lon ?? 0;
    final currentLat = currentLocation?.lat ?? 0;
    final currentLon = currentLocation?.lon ?? 0;

    final latDiff = (savedLat - currentLat).abs();
    final lonDiff = (savedLon - currentLon).abs();

    const tolerance = 0.001;

    return latDiff > tolerance || lonDiff > tolerance;
  }
}
