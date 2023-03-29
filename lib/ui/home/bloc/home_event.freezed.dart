// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InitTrackingLocation {
  Function get trackingLocationError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InitTrackingLocationCopyWith<InitTrackingLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitTrackingLocationCopyWith<$Res> {
  factory $InitTrackingLocationCopyWith(InitTrackingLocation value,
          $Res Function(InitTrackingLocation) then) =
      _$InitTrackingLocationCopyWithImpl<$Res, InitTrackingLocation>;
  @useResult
  $Res call({Function trackingLocationError});
}

/// @nodoc
class _$InitTrackingLocationCopyWithImpl<$Res,
        $Val extends InitTrackingLocation>
    implements $InitTrackingLocationCopyWith<$Res> {
  _$InitTrackingLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackingLocationError = null,
  }) {
    return _then(_value.copyWith(
      trackingLocationError: null == trackingLocationError
          ? _value.trackingLocationError
          : trackingLocationError // ignore: cast_nullable_to_non_nullable
              as Function,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitTrackingLocationCopyWith<$Res>
    implements $InitTrackingLocationCopyWith<$Res> {
  factory _$$_InitTrackingLocationCopyWith(_$_InitTrackingLocation value,
          $Res Function(_$_InitTrackingLocation) then) =
      __$$_InitTrackingLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Function trackingLocationError});
}

/// @nodoc
class __$$_InitTrackingLocationCopyWithImpl<$Res>
    extends _$InitTrackingLocationCopyWithImpl<$Res, _$_InitTrackingLocation>
    implements _$$_InitTrackingLocationCopyWith<$Res> {
  __$$_InitTrackingLocationCopyWithImpl(_$_InitTrackingLocation _value,
      $Res Function(_$_InitTrackingLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trackingLocationError = null,
  }) {
    return _then(_$_InitTrackingLocation(
      trackingLocationError: null == trackingLocationError
          ? _value.trackingLocationError
          : trackingLocationError // ignore: cast_nullable_to_non_nullable
              as Function,
    ));
  }
}

/// @nodoc

class _$_InitTrackingLocation implements _InitTrackingLocation {
  const _$_InitTrackingLocation({required this.trackingLocationError});

  @override
  final Function trackingLocationError;

  @override
  String toString() {
    return 'InitTrackingLocation(trackingLocationError: $trackingLocationError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitTrackingLocation &&
            (identical(other.trackingLocationError, trackingLocationError) ||
                other.trackingLocationError == trackingLocationError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, trackingLocationError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitTrackingLocationCopyWith<_$_InitTrackingLocation> get copyWith =>
      __$$_InitTrackingLocationCopyWithImpl<_$_InitTrackingLocation>(
          this, _$identity);
}

abstract class _InitTrackingLocation implements InitTrackingLocation {
  const factory _InitTrackingLocation(
          {required final Function trackingLocationError}) =
      _$_InitTrackingLocation;

  @override
  Function get trackingLocationError;
  @override
  @JsonKey(ignore: true)
  _$$_InitTrackingLocationCopyWith<_$_InitTrackingLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
