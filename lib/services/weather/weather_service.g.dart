// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherServiceHash() => r'b896142dc0131e369608edf5193cb53dc6f36507';

/// See also [WeatherService].
@ProviderFor(WeatherService)
final weatherServiceProvider =
    AutoDisposeNotifierProvider<
      WeatherService,
      AsyncValue<WeatherState>
    >.internal(
      WeatherService.new,
      name: r'weatherServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$weatherServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WeatherService = AutoDisposeNotifier<AsyncValue<WeatherState>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
