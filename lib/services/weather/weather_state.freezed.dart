// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WeatherState {
  WeatherResponse? get currentWeather => throw _privateConstructorUsedError;
  ForecastResponse? get forecast => throw _privateConstructorUsedError;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
    WeatherState value,
    $Res Function(WeatherState) then,
  ) = _$WeatherStateCopyWithImpl<$Res, WeatherState>;
  @useResult
  $Res call({WeatherResponse? currentWeather, ForecastResponse? forecast});

  $WeatherResponseCopyWith<$Res>? get currentWeather;
  $ForecastResponseCopyWith<$Res>? get forecast;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentWeather = freezed, Object? forecast = freezed}) {
    return _then(
      _value.copyWith(
            currentWeather: freezed == currentWeather
                ? _value.currentWeather
                : currentWeather // ignore: cast_nullable_to_non_nullable
                      as WeatherResponse?,
            forecast: freezed == forecast
                ? _value.forecast
                : forecast // ignore: cast_nullable_to_non_nullable
                      as ForecastResponse?,
          )
          as $Val,
    );
  }

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherResponseCopyWith<$Res>? get currentWeather {
    if (_value.currentWeather == null) {
      return null;
    }

    return $WeatherResponseCopyWith<$Res>(_value.currentWeather!, (value) {
      return _then(_value.copyWith(currentWeather: value) as $Val);
    });
  }

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ForecastResponseCopyWith<$Res>? get forecast {
    if (_value.forecast == null) {
      return null;
    }

    return $ForecastResponseCopyWith<$Res>(_value.forecast!, (value) {
      return _then(_value.copyWith(forecast: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherStateImplCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$WeatherStateImplCopyWith(
    _$WeatherStateImpl value,
    $Res Function(_$WeatherStateImpl) then,
  ) = __$$WeatherStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WeatherResponse? currentWeather, ForecastResponse? forecast});

  @override
  $WeatherResponseCopyWith<$Res>? get currentWeather;
  @override
  $ForecastResponseCopyWith<$Res>? get forecast;
}

/// @nodoc
class __$$WeatherStateImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$WeatherStateImpl>
    implements _$$WeatherStateImplCopyWith<$Res> {
  __$$WeatherStateImplCopyWithImpl(
    _$WeatherStateImpl _value,
    $Res Function(_$WeatherStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentWeather = freezed, Object? forecast = freezed}) {
    return _then(
      _$WeatherStateImpl(
        currentWeather: freezed == currentWeather
            ? _value.currentWeather
            : currentWeather // ignore: cast_nullable_to_non_nullable
                  as WeatherResponse?,
        forecast: freezed == forecast
            ? _value.forecast
            : forecast // ignore: cast_nullable_to_non_nullable
                  as ForecastResponse?,
      ),
    );
  }
}

/// @nodoc

class _$WeatherStateImpl implements _WeatherState {
  const _$WeatherStateImpl({this.currentWeather, this.forecast});

  @override
  final WeatherResponse? currentWeather;
  @override
  final ForecastResponse? forecast;

  @override
  String toString() {
    return 'WeatherState(currentWeather: $currentWeather, forecast: $forecast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherStateImpl &&
            (identical(other.currentWeather, currentWeather) ||
                other.currentWeather == currentWeather) &&
            (identical(other.forecast, forecast) ||
                other.forecast == forecast));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentWeather, forecast);

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      __$$WeatherStateImplCopyWithImpl<_$WeatherStateImpl>(this, _$identity);
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState({
    final WeatherResponse? currentWeather,
    final ForecastResponse? forecast,
  }) = _$WeatherStateImpl;

  @override
  WeatherResponse? get currentWeather;
  @override
  ForecastResponse? get forecast;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
