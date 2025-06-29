import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/core/extensions/context.dart';
import 'package:weather/models/unit.dart';
import 'package:weather/screens/home/widgets/unit_icon_button.dart';
import 'package:weather/services/unit/unit_service.dart';
import 'package:weather/services/weather/weather_service.dart';
import 'package:weather/widgets/weather_empty_widget.dart';
import 'package:weather/widgets/weather_error_widget.dart';

import 'controller/home_controller.dart';
import 'widgets/current_location.dart';
import 'views/location_search_sheet.dart';
import 'views/weather_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final lastLocation = ref.read(
        homeControllerProvider.select((state) => state.lastLocation),
      );

      final lat = lastLocation?.lat;
      final lon = lastLocation?.lon;
      final unit = ref.read(unitServiceProvider);
      final languageCode = context.languageCode;

      if (lat == null || lon == null) return;

      ref
          .read(weatherServiceProvider.notifier)
          .get(lat: lat, lon: lon, unit: unit.name, languageCode: languageCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final languageCode = context.languageCode;
    final selectedUnit = ref.watch(unitServiceProvider);

    final lastLocation = ref.watch(
      homeControllerProvider.select((state) => state.lastLocation),
    );

    final lat = lastLocation?.lat;
    final lon = lastLocation?.lon;

    Future<void> refresh({String? unit}) async {
      if (lat != null && lon != null) {
        ref
            .read(weatherServiceProvider.notifier)
            .refresh(
              lat: lat,
              lon: lon,
              languageCode: languageCode,
              unit: unit ?? selectedUnit.name,
            );
      }
    }

    void onUnitChange(Unit unit) {
      ref.read(unitServiceProvider.notifier).setUnit(unit);
      refresh(unit: unit.name);
    }

    final dataAsync = ref.watch(weatherServiceProvider);

    return GestureDetector(
      onTap: () =>
          ref.read(homeControllerProvider.notifier).onTapOutside(context),
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: lastLocation != null
              ? CurrentLocation(location: lastLocation)
              : const SizedBox.shrink(),
          actions: [UnitIconButton(onUnitChange: onUnitChange)],
        ),
        body: Stack(
          children: [
            Builder(
              builder: (_) {
                if (lat == null || lon == null) {
                  return const WeatherEmptyWidget();
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
            const LocationSearchSheet(),
          ],
        ),
      ),
    );
  }
}
