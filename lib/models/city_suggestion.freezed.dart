// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CitySuggestion _$CitySuggestionFromJson(Map<String, dynamic> json) {
  return _CitySuggestion.fromJson(json);
}

/// @nodoc
mixin _$CitySuggestion {
  String get name => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'local_names')
  Map<String, String>? get localNames => throw _privateConstructorUsedError;

  /// Serializes this CitySuggestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CitySuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CitySuggestionCopyWith<CitySuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CitySuggestionCopyWith<$Res> {
  factory $CitySuggestionCopyWith(
    CitySuggestion value,
    $Res Function(CitySuggestion) then,
  ) = _$CitySuggestionCopyWithImpl<$Res, CitySuggestion>;
  @useResult
  $Res call({
    String name,
    double lat,
    double lon,
    String country,
    String? state,
    @JsonKey(name: 'local_names') Map<String, String>? localNames,
  });
}

/// @nodoc
class _$CitySuggestionCopyWithImpl<$Res, $Val extends CitySuggestion>
    implements $CitySuggestionCopyWith<$Res> {
  _$CitySuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CitySuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? lat = null,
    Object? lon = null,
    Object? country = null,
    Object? state = freezed,
    Object? localNames = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            lat: null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                      as double,
            lon: null == lon
                ? _value.lon
                : lon // ignore: cast_nullable_to_non_nullable
                      as double,
            country: null == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as String,
            state: freezed == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as String?,
            localNames: freezed == localNames
                ? _value.localNames
                : localNames // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CitySuggestionImplCopyWith<$Res>
    implements $CitySuggestionCopyWith<$Res> {
  factory _$$CitySuggestionImplCopyWith(
    _$CitySuggestionImpl value,
    $Res Function(_$CitySuggestionImpl) then,
  ) = __$$CitySuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    double lat,
    double lon,
    String country,
    String? state,
    @JsonKey(name: 'local_names') Map<String, String>? localNames,
  });
}

/// @nodoc
class __$$CitySuggestionImplCopyWithImpl<$Res>
    extends _$CitySuggestionCopyWithImpl<$Res, _$CitySuggestionImpl>
    implements _$$CitySuggestionImplCopyWith<$Res> {
  __$$CitySuggestionImplCopyWithImpl(
    _$CitySuggestionImpl _value,
    $Res Function(_$CitySuggestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CitySuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? lat = null,
    Object? lon = null,
    Object? country = null,
    Object? state = freezed,
    Object? localNames = freezed,
  }) {
    return _then(
      _$CitySuggestionImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        lat: null == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double,
        lon: null == lon
            ? _value.lon
            : lon // ignore: cast_nullable_to_non_nullable
                  as double,
        country: null == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String,
        state: freezed == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String?,
        localNames: freezed == localNames
            ? _value._localNames
            : localNames // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CitySuggestionImpl extends _CitySuggestion {
  const _$CitySuggestionImpl({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    this.state,
    @JsonKey(name: 'local_names') final Map<String, String>? localNames,
  }) : _localNames = localNames,
       super._();

  factory _$CitySuggestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CitySuggestionImplFromJson(json);

  @override
  final String name;
  @override
  final double lat;
  @override
  final double lon;
  @override
  final String country;
  @override
  final String? state;
  final Map<String, String>? _localNames;
  @override
  @JsonKey(name: 'local_names')
  Map<String, String>? get localNames {
    final value = _localNames;
    if (value == null) return null;
    if (_localNames is EqualUnmodifiableMapView) return _localNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CitySuggestion(name: $name, lat: $lat, lon: $lon, country: $country, state: $state, localNames: $localNames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CitySuggestionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(
              other._localNames,
              _localNames,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    lat,
    lon,
    country,
    state,
    const DeepCollectionEquality().hash(_localNames),
  );

  /// Create a copy of CitySuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CitySuggestionImplCopyWith<_$CitySuggestionImpl> get copyWith =>
      __$$CitySuggestionImplCopyWithImpl<_$CitySuggestionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CitySuggestionImplToJson(this);
  }
}

abstract class _CitySuggestion extends CitySuggestion {
  const factory _CitySuggestion({
    required final String name,
    required final double lat,
    required final double lon,
    required final String country,
    final String? state,
    @JsonKey(name: 'local_names') final Map<String, String>? localNames,
  }) = _$CitySuggestionImpl;
  const _CitySuggestion._() : super._();

  factory _CitySuggestion.fromJson(Map<String, dynamic> json) =
      _$CitySuggestionImpl.fromJson;

  @override
  String get name;
  @override
  double get lat;
  @override
  double get lon;
  @override
  String get country;
  @override
  String? get state;
  @override
  @JsonKey(name: 'local_names')
  Map<String, String>? get localNames;

  /// Create a copy of CitySuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CitySuggestionImplCopyWith<_$CitySuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
