import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather/models/city_suggestion.dart';
import 'package:weather/models/location_error_type.dart';
import 'package:weather/models/location_permission_status.dart';
import 'package:weather/repositories/geo_repository.dart';
import 'package:weather/services/location/location_state.dart';
import 'package:weather/utils/shared-preferences/shared_preferences_provider.dart';

part 'location_service.g.dart';

@riverpod
class LocationService extends _$LocationService {
  static const String _lastLocationKey = 'last_location';

  @override
  LocationState build() {
    final savedLocation = _loadSavedLocation();
    return LocationState(savedLocation: savedLocation);
  }

  CitySuggestion? _loadSavedLocation() {
    final prefs = ref.read(sharedPreferencesProvider);
    final lastLocationJson = prefs.getString(_lastLocationKey);

    if (lastLocationJson == null) return null;

    try {
      final lastLocation = jsonDecode(lastLocationJson);
      return CitySuggestion.fromJson(lastLocation);
    } catch (e) {
      return null;
    }
  }

  Future<void> saveLocation(CitySuggestion location) async {
    final prefs = ref.read(sharedPreferencesProvider);
    final locationJson = jsonEncode(location.toJson());
    await prefs.setString(_lastLocationKey, locationJson);

    state = state.copyWith(
      savedLocation: location,
      serviceStatus: LocationServiceStatus.success,
    );
  }

  Future<void> clearSavedLocation() async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.remove(_lastLocationKey);

    state = state.copyWith(savedLocation: null, currentLocation: null);
  }

  Future<void> checkLocationPermission() async {
    state = state.copyWith(
      serviceStatus: LocationServiceStatus.checkingPermission,
    );

    final permission = await Geolocator.checkPermission();
    final permissionStatus = switch (permission) {
      LocationPermission.always => LocationPermissionStatus.granted,
      LocationPermission.whileInUse => LocationPermissionStatus.granted,
      LocationPermission.denied => LocationPermissionStatus.denied,
      LocationPermission.deniedForever =>
        LocationPermissionStatus.permanentlyDenied,
      LocationPermission.unableToDetermine => LocationPermissionStatus.unknown,
    };

    state = state.copyWith(
      permissionStatus: permissionStatus,
      serviceStatus: LocationServiceStatus.idle,
    );
  }

  Future<void> requestLocationPermission() async {
    state = state.copyWith(
      serviceStatus: LocationServiceStatus.requestingPermission,
    );

    final permission = await Geolocator.requestPermission();
    final permissionStatus = switch (permission) {
      LocationPermission.always => LocationPermissionStatus.granted,
      LocationPermission.whileInUse => LocationPermissionStatus.granted,
      LocationPermission.denied => LocationPermissionStatus.denied,
      LocationPermission.deniedForever =>
        LocationPermissionStatus.permanentlyDenied,
      LocationPermission.unableToDetermine => LocationPermissionStatus.unknown,
    };

    final errorType = switch (permissionStatus) {
      LocationPermissionStatus.denied => LocationErrorType.permissionDenied,
      LocationPermissionStatus.permanentlyDenied =>
        LocationErrorType.permissionPermanentlyDenied,
      _ => null,
    };

    state = state.copyWith(
      permissionStatus: permissionStatus,
      serviceStatus: LocationServiceStatus.idle,
      errorType: errorType,
    );
  }

  Future<void> getCurrentLocation() async {
    try {
      state = state.copyWith(
        serviceStatus: LocationServiceStatus.gettingLocation,
      );

      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        state = state.copyWith(
          serviceStatus: LocationServiceStatus.error,
          errorType: LocationErrorType.locationServicesDisabled,
        );
        return;
      }

      await checkLocationPermission();

      if (state.permissionStatus != LocationPermissionStatus.granted) {
        await requestLocationPermission();
        if (state.permissionStatus != LocationPermissionStatus.granted) {
          state = state.copyWith(serviceStatus: LocationServiceStatus.idle);
          return;
        }
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 15),
        ),
      );

      state = state.copyWith(
        serviceStatus: LocationServiceStatus.loadingLocationData,
      );

      final cityData = await ref
          .read(geoRepositoryProvider)
          .getCitySuggestion(position.latitude, position.longitude);

      if (cityData == null) {
        state = state.copyWith(
          serviceStatus: LocationServiceStatus.error,
          errorType: LocationErrorType.geocodingFailed,
        );
        return;
      }

      state = state.copyWith(
        currentLocation: cityData,
        serviceStatus: LocationServiceStatus.success,
      );

      await saveLocation(cityData);
    } catch (error) {
      state = state.copyWith(
        serviceStatus: LocationServiceStatus.error,
        errorType: LocationErrorType.unknown,
      );
      return;
    }
  }

  Future<void> jumpToCurrentLocation() async {
    await getCurrentLocation();
  }

  Future<void> openLocationSettings() async {
    await Geolocator.openAppSettings();
  }

  Future<void> refreshPermissionStatus() async {
    await checkLocationPermission();
  }

  Future<void> initializeLocation() async {
    if (state.savedLocation != null) return;

    await checkLocationPermission();

    if (state.permissionStatus == LocationPermissionStatus.granted) {
      await getCurrentLocation();
      return;
    } else {
      await requestLocationPermission();

      if (state.permissionStatus == LocationPermissionStatus.granted) {
        await getCurrentLocation();
        return;
      }
    }
  }

  void clearError() {
    state = state.copyWith(
      serviceStatus: LocationServiceStatus.idle,
      errorType: null,
    );
  }
}
