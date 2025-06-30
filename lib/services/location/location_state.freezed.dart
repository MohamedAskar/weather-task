// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LocationState {
  CitySuggestion? get savedLocation => throw _privateConstructorUsedError;
  CitySuggestion? get currentLocation => throw _privateConstructorUsedError;
  LocationPermissionStatus get permissionStatus =>
      throw _privateConstructorUsedError;
  LocationServiceStatus get serviceStatus => throw _privateConstructorUsedError;
  LocationErrorType? get errorType => throw _privateConstructorUsedError;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationStateCopyWith<LocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
    LocationState value,
    $Res Function(LocationState) then,
  ) = _$LocationStateCopyWithImpl<$Res, LocationState>;
  @useResult
  $Res call({
    CitySuggestion? savedLocation,
    CitySuggestion? currentLocation,
    LocationPermissionStatus permissionStatus,
    LocationServiceStatus serviceStatus,
    LocationErrorType? errorType,
  });

  $CitySuggestionCopyWith<$Res>? get savedLocation;
  $CitySuggestionCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res, $Val extends LocationState>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedLocation = freezed,
    Object? currentLocation = freezed,
    Object? permissionStatus = null,
    Object? serviceStatus = null,
    Object? errorType = freezed,
  }) {
    return _then(
      _value.copyWith(
            savedLocation: freezed == savedLocation
                ? _value.savedLocation
                : savedLocation // ignore: cast_nullable_to_non_nullable
                      as CitySuggestion?,
            currentLocation: freezed == currentLocation
                ? _value.currentLocation
                : currentLocation // ignore: cast_nullable_to_non_nullable
                      as CitySuggestion?,
            permissionStatus: null == permissionStatus
                ? _value.permissionStatus
                : permissionStatus // ignore: cast_nullable_to_non_nullable
                      as LocationPermissionStatus,
            serviceStatus: null == serviceStatus
                ? _value.serviceStatus
                : serviceStatus // ignore: cast_nullable_to_non_nullable
                      as LocationServiceStatus,
            errorType: freezed == errorType
                ? _value.errorType
                : errorType // ignore: cast_nullable_to_non_nullable
                      as LocationErrorType?,
          )
          as $Val,
    );
  }

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CitySuggestionCopyWith<$Res>? get savedLocation {
    if (_value.savedLocation == null) {
      return null;
    }

    return $CitySuggestionCopyWith<$Res>(_value.savedLocation!, (value) {
      return _then(_value.copyWith(savedLocation: value) as $Val);
    });
  }

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CitySuggestionCopyWith<$Res>? get currentLocation {
    if (_value.currentLocation == null) {
      return null;
    }

    return $CitySuggestionCopyWith<$Res>(_value.currentLocation!, (value) {
      return _then(_value.copyWith(currentLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocationStateImplCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$$LocationStateImplCopyWith(
    _$LocationStateImpl value,
    $Res Function(_$LocationStateImpl) then,
  ) = __$$LocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CitySuggestion? savedLocation,
    CitySuggestion? currentLocation,
    LocationPermissionStatus permissionStatus,
    LocationServiceStatus serviceStatus,
    LocationErrorType? errorType,
  });

  @override
  $CitySuggestionCopyWith<$Res>? get savedLocation;
  @override
  $CitySuggestionCopyWith<$Res>? get currentLocation;
}

/// @nodoc
class __$$LocationStateImplCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res, _$LocationStateImpl>
    implements _$$LocationStateImplCopyWith<$Res> {
  __$$LocationStateImplCopyWithImpl(
    _$LocationStateImpl _value,
    $Res Function(_$LocationStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? savedLocation = freezed,
    Object? currentLocation = freezed,
    Object? permissionStatus = null,
    Object? serviceStatus = null,
    Object? errorType = freezed,
  }) {
    return _then(
      _$LocationStateImpl(
        savedLocation: freezed == savedLocation
            ? _value.savedLocation
            : savedLocation // ignore: cast_nullable_to_non_nullable
                  as CitySuggestion?,
        currentLocation: freezed == currentLocation
            ? _value.currentLocation
            : currentLocation // ignore: cast_nullable_to_non_nullable
                  as CitySuggestion?,
        permissionStatus: null == permissionStatus
            ? _value.permissionStatus
            : permissionStatus // ignore: cast_nullable_to_non_nullable
                  as LocationPermissionStatus,
        serviceStatus: null == serviceStatus
            ? _value.serviceStatus
            : serviceStatus // ignore: cast_nullable_to_non_nullable
                  as LocationServiceStatus,
        errorType: freezed == errorType
            ? _value.errorType
            : errorType // ignore: cast_nullable_to_non_nullable
                  as LocationErrorType?,
      ),
    );
  }
}

/// @nodoc

class _$LocationStateImpl extends _LocationState {
  const _$LocationStateImpl({
    this.savedLocation,
    this.currentLocation,
    this.permissionStatus = LocationPermissionStatus.unknown,
    this.serviceStatus = LocationServiceStatus.idle,
    this.errorType,
  }) : super._();

  @override
  final CitySuggestion? savedLocation;
  @override
  final CitySuggestion? currentLocation;
  @override
  @JsonKey()
  final LocationPermissionStatus permissionStatus;
  @override
  @JsonKey()
  final LocationServiceStatus serviceStatus;
  @override
  final LocationErrorType? errorType;

  @override
  String toString() {
    return 'LocationState(savedLocation: $savedLocation, currentLocation: $currentLocation, permissionStatus: $permissionStatus, serviceStatus: $serviceStatus, errorType: $errorType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationStateImpl &&
            (identical(other.savedLocation, savedLocation) ||
                other.savedLocation == savedLocation) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.permissionStatus, permissionStatus) ||
                other.permissionStatus == permissionStatus) &&
            (identical(other.serviceStatus, serviceStatus) ||
                other.serviceStatus == serviceStatus) &&
            (identical(other.errorType, errorType) ||
                other.errorType == errorType));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    savedLocation,
    currentLocation,
    permissionStatus,
    serviceStatus,
    errorType,
  );

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationStateImplCopyWith<_$LocationStateImpl> get copyWith =>
      __$$LocationStateImplCopyWithImpl<_$LocationStateImpl>(this, _$identity);
}

abstract class _LocationState extends LocationState {
  const factory _LocationState({
    final CitySuggestion? savedLocation,
    final CitySuggestion? currentLocation,
    final LocationPermissionStatus permissionStatus,
    final LocationServiceStatus serviceStatus,
    final LocationErrorType? errorType,
  }) = _$LocationStateImpl;
  const _LocationState._() : super._();

  @override
  CitySuggestion? get savedLocation;
  @override
  CitySuggestion? get currentLocation;
  @override
  LocationPermissionStatus get permissionStatus;
  @override
  LocationServiceStatus get serviceStatus;
  @override
  LocationErrorType? get errorType;

  /// Create a copy of LocationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationStateImplCopyWith<_$LocationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
