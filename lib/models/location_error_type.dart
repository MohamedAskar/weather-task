import 'package:flutter/material.dart';
import 'package:weather/core/extensions/context.dart';

enum LocationErrorType {
  unknown,
  permissionDenied,
  permissionPermanentlyDenied,
  locationServicesDisabled,
  locationTimeout,
  locationAccuracyLow,
  networkError,
  geocodingFailed,
  gpsUnavailable;

  static String getErrorMessage(
    BuildContext context, {
    required LocationErrorType type,
  }) {
    final l10n = context.l10n;
    switch (type) {
      case LocationErrorType.permissionDenied:
        return l10n.errorPermissionDenied;
      case LocationErrorType.permissionPermanentlyDenied:
        return l10n.errorPermissionPermanentlyDenied;
      case LocationErrorType.locationServicesDisabled:
        return l10n.errorLocationServicesDisabled;
      case LocationErrorType.locationTimeout:
        return l10n.errorLocationTimeout;
      case LocationErrorType.locationAccuracyLow:
        return l10n.errorLocationAccuracyLow;
      case LocationErrorType.networkError:
        return l10n.errorNetworkError;
      case LocationErrorType.geocodingFailed:
        return l10n.errorGeocodingFailed;
      case LocationErrorType.gpsUnavailable:
        return l10n.errorGpsUnavailable;
      default:
        return l10n.errorUnknown;
    }
  }
}
