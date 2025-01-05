// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genkit_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GenkitResponse {
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Create a copy of GenkitResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenkitResponseCopyWith<GenkitResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenkitResponseCopyWith<$Res> {
  factory $GenkitResponseCopyWith(
          GenkitResponse value, $Res Function(GenkitResponse) then) =
      _$GenkitResponseCopyWithImpl<$Res, GenkitResponse>;
  @useResult
  $Res call({String description, String image});
}

/// @nodoc
class _$GenkitResponseCopyWithImpl<$Res, $Val extends GenkitResponse>
    implements $GenkitResponseCopyWith<$Res> {
  _$GenkitResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenkitResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenkitResponseImplCopyWith<$Res>
    implements $GenkitResponseCopyWith<$Res> {
  factory _$$GenkitResponseImplCopyWith(_$GenkitResponseImpl value,
          $Res Function(_$GenkitResponseImpl) then) =
      __$$GenkitResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String image});
}

/// @nodoc
class __$$GenkitResponseImplCopyWithImpl<$Res>
    extends _$GenkitResponseCopyWithImpl<$Res, _$GenkitResponseImpl>
    implements _$$GenkitResponseImplCopyWith<$Res> {
  __$$GenkitResponseImplCopyWithImpl(
      _$GenkitResponseImpl _value, $Res Function(_$GenkitResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenkitResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_$GenkitResponseImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GenkitResponseImpl implements _GenkitResponse {
  const _$GenkitResponseImpl({required this.description, required this.image});

  @override
  final String description;
  @override
  final String image;

  @override
  String toString() {
    return 'GenkitResponse(description: $description, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenkitResponseImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, image);

  /// Create a copy of GenkitResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenkitResponseImplCopyWith<_$GenkitResponseImpl> get copyWith =>
      __$$GenkitResponseImplCopyWithImpl<_$GenkitResponseImpl>(
          this, _$identity);
}

abstract class _GenkitResponse implements GenkitResponse {
  const factory _GenkitResponse(
      {required final String description,
      required final String image}) = _$GenkitResponseImpl;

  @override
  String get description;
  @override
  String get image;

  /// Create a copy of GenkitResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenkitResponseImplCopyWith<_$GenkitResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
