import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather/utils/theme-controller/theme_controller_provider.dart';

import '../../repositories/weather_repository.dart';
import 'weather_state.dart';

part 'weather_service.g.dart';

@riverpod
class WeatherService extends _$WeatherService {
  @override
  AsyncValue<WeatherState> build() {
    return const AsyncValue.data(WeatherState());
  }

  Future<void> get({
    required double lat,
    required double lon,
    String? languageCode,
    String? unit,
    bool isRefresh = false,
  }) async {
    if (!isRefresh) state = const AsyncValue.loading();

    final currentWeather = await ref
        .read(weatherRepositoryProvider)
        .getCurrentWeather(
          lat: lat,
          lon: lon,
          languageCode: languageCode,
          unit: unit,
        );

    final forecast = await ref
        .read(weatherRepositoryProvider)
        .getWeatherForecast(
          lat: lat,
          lon: lon,
          languageCode: languageCode,
          unit: unit,
        );

    final newState = WeatherState(
      currentWeather: currentWeather,
      forecast: forecast,
    );
    state = AsyncValue.data(newState);

    ref.read(themeControllerProvider.notifier).update(currentWeather);
  }

  Future<void> refresh({
    required double lat,
    required double lon,
    String? languageCode,
    String? unit,
  }) async {
    await get(
      lat: lat,
      lon: lon,
      languageCode: languageCode,
      unit: unit,
      isRefresh: true,
    );
  }
}
