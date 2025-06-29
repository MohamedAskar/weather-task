// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  DraggableScrollableController get scrollController =>
      throw _privateConstructorUsedError;
  TextEditingController get searchController =>
      throw _privateConstructorUsedError;
  FocusNode get focusNode => throw _privateConstructorUsedError;
  CitySuggestion? get lastLocation => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    DraggableScrollableController scrollController,
    TextEditingController searchController,
    FocusNode focusNode,
    CitySuggestion? lastLocation,
  });

  $CitySuggestionCopyWith<$Res>? get lastLocation;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scrollController = null,
    Object? searchController = null,
    Object? focusNode = null,
    Object? lastLocation = freezed,
  }) {
    return _then(
      _value.copyWith(
            scrollController: null == scrollController
                ? _value.scrollController
                : scrollController // ignore: cast_nullable_to_non_nullable
                      as DraggableScrollableController,
            searchController: null == searchController
                ? _value.searchController
                : searchController // ignore: cast_nullable_to_non_nullable
                      as TextEditingController,
            focusNode: null == focusNode
                ? _value.focusNode
                : focusNode // ignore: cast_nullable_to_non_nullable
                      as FocusNode,
            lastLocation: freezed == lastLocation
                ? _value.lastLocation
                : lastLocation // ignore: cast_nullable_to_non_nullable
                      as CitySuggestion?,
          )
          as $Val,
    );
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CitySuggestionCopyWith<$Res>? get lastLocation {
    if (_value.lastLocation == null) {
      return null;
    }

    return $CitySuggestionCopyWith<$Res>(_value.lastLocation!, (value) {
      return _then(_value.copyWith(lastLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DraggableScrollableController scrollController,
    TextEditingController searchController,
    FocusNode focusNode,
    CitySuggestion? lastLocation,
  });

  @override
  $CitySuggestionCopyWith<$Res>? get lastLocation;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scrollController = null,
    Object? searchController = null,
    Object? focusNode = null,
    Object? lastLocation = freezed,
  }) {
    return _then(
      _$HomeStateImpl(
        scrollController: null == scrollController
            ? _value.scrollController
            : scrollController // ignore: cast_nullable_to_non_nullable
                  as DraggableScrollableController,
        searchController: null == searchController
            ? _value.searchController
            : searchController // ignore: cast_nullable_to_non_nullable
                  as TextEditingController,
        focusNode: null == focusNode
            ? _value.focusNode
            : focusNode // ignore: cast_nullable_to_non_nullable
                  as FocusNode,
        lastLocation: freezed == lastLocation
            ? _value.lastLocation
            : lastLocation // ignore: cast_nullable_to_non_nullable
                  as CitySuggestion?,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({
    required this.scrollController,
    required this.searchController,
    required this.focusNode,
    this.lastLocation,
  });

  @override
  final DraggableScrollableController scrollController;
  @override
  final TextEditingController searchController;
  @override
  final FocusNode focusNode;
  @override
  final CitySuggestion? lastLocation;

  @override
  String toString() {
    return 'HomeState(scrollController: $scrollController, searchController: $searchController, focusNode: $focusNode, lastLocation: $lastLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController) &&
            (identical(other.searchController, searchController) ||
                other.searchController == searchController) &&
            (identical(other.focusNode, focusNode) ||
                other.focusNode == focusNode) &&
            (identical(other.lastLocation, lastLocation) ||
                other.lastLocation == lastLocation));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    scrollController,
    searchController,
    focusNode,
    lastLocation,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    required final DraggableScrollableController scrollController,
    required final TextEditingController searchController,
    required final FocusNode focusNode,
    final CitySuggestion? lastLocation,
  }) = _$HomeStateImpl;

  @override
  DraggableScrollableController get scrollController;
  @override
  TextEditingController get searchController;
  @override
  FocusNode get focusNode;
  @override
  CitySuggestion? get lastLocation;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
