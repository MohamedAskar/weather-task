// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ForecastResponse _$ForecastResponseFromJson(Map<String, dynamic> json) {
  return _ForecastResponse.fromJson(json);
}

/// @nodoc
mixin _$ForecastResponse {
  List<WeatherResponse> get list => throw _privateConstructorUsedError;
  City? get city => throw _privateConstructorUsedError;

  /// Serializes this ForecastResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForecastResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForecastResponseCopyWith<ForecastResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastResponseCopyWith<$Res> {
  factory $ForecastResponseCopyWith(
    ForecastResponse value,
    $Res Function(ForecastResponse) then,
  ) = _$ForecastResponseCopyWithImpl<$Res, ForecastResponse>;
  @useResult
  $Res call({List<WeatherResponse> list, City? city});

  $CityCopyWith<$Res>? get city;
}

/// @nodoc
class _$ForecastResponseCopyWithImpl<$Res, $Val extends ForecastResponse>
    implements $ForecastResponseCopyWith<$Res> {
  _$ForecastResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForecastResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? list = null, Object? city = freezed}) {
    return _then(
      _value.copyWith(
            list: null == list
                ? _value.list
                : list // ignore: cast_nullable_to_non_nullable
                      as List<WeatherResponse>,
            city: freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as City?,
          )
          as $Val,
    );
  }

  /// Create a copy of ForecastResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CityCopyWith<$Res>? get city {
    if (_value.city == null) {
      return null;
    }

    return $CityCopyWith<$Res>(_value.city!, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForecastResponseImplCopyWith<$Res>
    implements $ForecastResponseCopyWith<$Res> {
  factory _$$ForecastResponseImplCopyWith(
    _$ForecastResponseImpl value,
    $Res Function(_$ForecastResponseImpl) then,
  ) = __$$ForecastResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WeatherResponse> list, City? city});

  @override
  $CityCopyWith<$Res>? get city;
}

/// @nodoc
class __$$ForecastResponseImplCopyWithImpl<$Res>
    extends _$ForecastResponseCopyWithImpl<$Res, _$ForecastResponseImpl>
    implements _$$ForecastResponseImplCopyWith<$Res> {
  __$$ForecastResponseImplCopyWithImpl(
    _$ForecastResponseImpl _value,
    $Res Function(_$ForecastResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForecastResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? list = null, Object? city = freezed}) {
    return _then(
      _$ForecastResponseImpl(
        list: null == list
            ? _value._list
            : list // ignore: cast_nullable_to_non_nullable
                  as List<WeatherResponse>,
        city: freezed == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as City?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForecastResponseImpl extends _ForecastResponse {
  const _$ForecastResponseImpl({
    final List<WeatherResponse> list = const [],
    this.city,
  }) : _list = list,
       super._();

  factory _$ForecastResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastResponseImplFromJson(json);

  final List<WeatherResponse> _list;
  @override
  @JsonKey()
  List<WeatherResponse> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final City? city;

  @override
  String toString() {
    return 'ForecastResponse(list: $list, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastResponseImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_list),
    city,
  );

  /// Create a copy of ForecastResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastResponseImplCopyWith<_$ForecastResponseImpl> get copyWith =>
      __$$ForecastResponseImplCopyWithImpl<_$ForecastResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ForecastResponseImplToJson(this);
  }
}

abstract class _ForecastResponse extends ForecastResponse {
  const factory _ForecastResponse({
    final List<WeatherResponse> list,
    final City? city,
  }) = _$ForecastResponseImpl;
  const _ForecastResponse._() : super._();

  factory _ForecastResponse.fromJson(Map<String, dynamic> json) =
      _$ForecastResponseImpl.fromJson;

  @override
  List<WeatherResponse> get list;
  @override
  City? get city;

  /// Create a copy of ForecastResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForecastResponseImplCopyWith<_$ForecastResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
