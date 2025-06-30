import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/constants/dimensions.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/models/city_suggestion.dart';
import 'package:weather/models/location_permission_status.dart';
import 'package:weather/models/unit.dart';
import 'package:weather/screens/home/widgets/unit_icon_button.dart';
import 'package:weather/services/location/location_service.dart';
import 'package:weather/services/location/location_state.dart';

import 'package:weather/services/unit/unit_service.dart';
import 'package:weather/services/weather/weather_service.dart';
import 'package:weather/widgets/current_location_fab.dart';
import 'package:weather/widgets/location_setup_widget.dart';
import 'package:weather/widgets/weather_error_widget.dart';

import 'controller/home_controller.dart';
import 'widgets/current_location.dart';
import 'views/location_search_sheet.dart';
import 'views/weather_view.dart';
import 'widgets/search_icon_button.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeApp();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      _refreshPermissionsAfterResume();
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeLocation = ref.watch(
      locationServiceProvider.select((state) => state.activeLocation),
    );

    final lat = activeLocation?.lat;
    final lon = activeLocation?.lon;

    final dataAsync = ref.watch(weatherServiceProvider);

    ref.listen<LocationState>(locationServiceProvider, (prev, next) {
      final previousLocation = prev?.activeLocation;
      final currentLocation = next.activeLocation;

      if (previousLocation == currentLocation) return;
      if (currentLocation == null) return;

      _loadWeatherForLocation(currentLocation);
    });

    return Material(
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTapOutside,
            child: Scaffold(
              floatingActionButton: const CurrentLocationFab(),
              appBar: AppBar(
                forceMaterialTransparency: true,
                title: activeLocation != null
                    ? CurrentLocation(location: activeLocation)
                    : const SizedBox.shrink(),
                actions: [
                  const SearchIconButton(),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12),
                    child: UnitIconButton(onUnitChange: onUnitChange),
                  ),
                ],
              ),
              body: Builder(
                builder: (_) {
                  if (lat == null || lon == null) {
                    return LocationSetupWidget(
                      onSearchRequested: () {
                        ref
                            .read(homeControllerProvider.notifier)
                            .openSearchSheet();
                      },
                    );
                  }

                  return dataAsync.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stackTrace) => WeatherErrorWidget(
                      error: error.toString(),
                      onTryAgain: () => refresh(),
                    ),
                    data: (data) {
                      final weather = data.currentWeather;
                      final forecast = data.forecast;

                      if (weather == null || forecast == null) {
                        return const SizedBox.shrink();
                      }

                      return WeatherView(
                        weather: weather,
                        forecast: forecast,
                        onRefresh: refresh,
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: Dimensions.sheetMaxWidth),
              child: LocationSearchSheet(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> refresh({String? unit}) async {
    final activeLocation = ref.read(
      locationServiceProvider.select((state) => state.activeLocation),
    );

    final lat = activeLocation?.lat;
    final lon = activeLocation?.lon;

    final languageCode = context.languageCode;
    final selectedUnit = ref.read(unitServiceProvider);

    if (lat == null || lon == null) return;

    ref
        .read(weatherServiceProvider.notifier)
        .refresh(
          lat: lat,
          lon: lon,
          languageCode: languageCode,
          unit: unit ?? selectedUnit.name,
        );
  }

  void onUnitChange(Unit unit) {
    ref.read(unitServiceProvider.notifier).setUnit(unit);
    refresh(unit: unit.name);
  }

  void onTapOutside() {
    ref.read(homeControllerProvider.notifier).onTapOutside(context);
  }

  Future<void> _refreshPermissionsAfterResume() async {
    final locationService = ref.read(locationServiceProvider.notifier);
    final oldPermissionStatus = ref.read(
      locationServiceProvider.select((state) => state.permissionStatus),
    );

    await locationService.refreshPermissionStatus();

    final newPermissionStatus = ref.read(
      locationServiceProvider.select((state) => state.permissionStatus),
    );

    if (oldPermissionStatus == LocationPermissionStatus.granted) return;

    if (newPermissionStatus == LocationPermissionStatus.granted) {
      await locationService.getCurrentLocation();

      final activeLocation = ref.read(
        locationServiceProvider.select((state) => state.activeLocation),
      );

      if (activeLocation == null) return;

      _loadWeatherForLocation(activeLocation);
    }
  }

  Future<void> _initializeApp() async {
    await ref.read(locationServiceProvider.notifier).initializeLocation();

    final activeLocation = ref.read(
      locationServiceProvider.select((state) => state.activeLocation),
    );

    if (activeLocation == null) return;

    _loadWeatherForLocation(activeLocation);
  }

  Future<void> _loadWeatherForLocation(CitySuggestion location) async {
    final unit = ref.read(unitServiceProvider);
    final languageCode = context.languageCode;

    ref
        .read(weatherServiceProvider.notifier)
        .get(
          lat: location.lat,
          lon: location.lon,
          unit: unit.name,
          languageCode: languageCode,
        );
  }
}
