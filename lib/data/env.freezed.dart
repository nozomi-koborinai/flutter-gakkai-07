// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'env.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Env {
  String get genkitEndpoint => throw _privateConstructorUsedError;

  /// Create a copy of Env
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnvCopyWith<Env> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvCopyWith<$Res> {
  factory $EnvCopyWith(Env value, $Res Function(Env) then) =
      _$EnvCopyWithImpl<$Res, Env>;
  @useResult
  $Res call({String genkitEndpoint});
}

/// @nodoc
class _$EnvCopyWithImpl<$Res, $Val extends Env> implements $EnvCopyWith<$Res> {
  _$EnvCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Env
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genkitEndpoint = null,
  }) {
    return _then(_value.copyWith(
      genkitEndpoint: null == genkitEndpoint
          ? _value.genkitEndpoint
          : genkitEndpoint // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnvImplCopyWith<$Res> implements $EnvCopyWith<$Res> {
  factory _$$EnvImplCopyWith(_$EnvImpl value, $Res Function(_$EnvImpl) then) =
      __$$EnvImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String genkitEndpoint});
}

/// @nodoc
class __$$EnvImplCopyWithImpl<$Res> extends _$EnvCopyWithImpl<$Res, _$EnvImpl>
    implements _$$EnvImplCopyWith<$Res> {
  __$$EnvImplCopyWithImpl(_$EnvImpl _value, $Res Function(_$EnvImpl) _then)
      : super(_value, _then);

  /// Create a copy of Env
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genkitEndpoint = null,
  }) {
    return _then(_$EnvImpl(
      genkitEndpoint: null == genkitEndpoint
          ? _value.genkitEndpoint
          : genkitEndpoint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EnvImpl extends _Env {
  const _$EnvImpl({required this.genkitEndpoint}) : super._();

  @override
  final String genkitEndpoint;

  @override
  String toString() {
    return 'Env(genkitEndpoint: $genkitEndpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnvImpl &&
            (identical(other.genkitEndpoint, genkitEndpoint) ||
                other.genkitEndpoint == genkitEndpoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, genkitEndpoint);

  /// Create a copy of Env
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnvImplCopyWith<_$EnvImpl> get copyWith =>
      __$$EnvImplCopyWithImpl<_$EnvImpl>(this, _$identity);
}

abstract class _Env extends Env {
  const factory _Env({required final String genkitEndpoint}) = _$EnvImpl;
  const _Env._() : super._();

  @override
  String get genkitEndpoint;

  /// Create a copy of Env
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnvImplCopyWith<_$EnvImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
