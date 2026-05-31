// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProgressPhoto _$ProgressPhotoFromJson(Map<String, dynamic> json) {
  return _ProgressPhoto.fromJson(json);
}

/// @nodoc
mixin _$ProgressPhoto {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get frontUrl => throw _privateConstructorUsedError;
  String? get sideUrl => throw _privateConstructorUsedError;
  String? get backUrl => throw _privateConstructorUsedError;

  /// Serializes this ProgressPhoto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgressPhotoCopyWith<ProgressPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressPhotoCopyWith<$Res> {
  factory $ProgressPhotoCopyWith(
          ProgressPhoto value, $Res Function(ProgressPhoto) then) =
      _$ProgressPhotoCopyWithImpl<$Res, ProgressPhoto>;
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime date,
      String? frontUrl,
      String? sideUrl,
      String? backUrl});
}

/// @nodoc
class _$ProgressPhotoCopyWithImpl<$Res, $Val extends ProgressPhoto>
    implements $ProgressPhotoCopyWith<$Res> {
  _$ProgressPhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? frontUrl = freezed,
    Object? sideUrl = freezed,
    Object? backUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      frontUrl: freezed == frontUrl
          ? _value.frontUrl
          : frontUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sideUrl: freezed == sideUrl
          ? _value.sideUrl
          : sideUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      backUrl: freezed == backUrl
          ? _value.backUrl
          : backUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressPhotoImplCopyWith<$Res>
    implements $ProgressPhotoCopyWith<$Res> {
  factory _$$ProgressPhotoImplCopyWith(
          _$ProgressPhotoImpl value, $Res Function(_$ProgressPhotoImpl) then) =
      __$$ProgressPhotoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime date,
      String? frontUrl,
      String? sideUrl,
      String? backUrl});
}

/// @nodoc
class __$$ProgressPhotoImplCopyWithImpl<$Res>
    extends _$ProgressPhotoCopyWithImpl<$Res, _$ProgressPhotoImpl>
    implements _$$ProgressPhotoImplCopyWith<$Res> {
  __$$ProgressPhotoImplCopyWithImpl(
      _$ProgressPhotoImpl _value, $Res Function(_$ProgressPhotoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? frontUrl = freezed,
    Object? sideUrl = freezed,
    Object? backUrl = freezed,
  }) {
    return _then(_$ProgressPhotoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      frontUrl: freezed == frontUrl
          ? _value.frontUrl
          : frontUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sideUrl: freezed == sideUrl
          ? _value.sideUrl
          : sideUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      backUrl: freezed == backUrl
          ? _value.backUrl
          : backUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressPhotoImpl implements _ProgressPhoto {
  const _$ProgressPhotoImpl(
      {required this.id,
      required this.userId,
      required this.date,
      this.frontUrl,
      this.sideUrl,
      this.backUrl});

  factory _$ProgressPhotoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressPhotoImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime date;
  @override
  final String? frontUrl;
  @override
  final String? sideUrl;
  @override
  final String? backUrl;

  @override
  String toString() {
    return 'ProgressPhoto(id: $id, userId: $userId, date: $date, frontUrl: $frontUrl, sideUrl: $sideUrl, backUrl: $backUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressPhotoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.frontUrl, frontUrl) ||
                other.frontUrl == frontUrl) &&
            (identical(other.sideUrl, sideUrl) || other.sideUrl == sideUrl) &&
            (identical(other.backUrl, backUrl) || other.backUrl == backUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, date, frontUrl, sideUrl, backUrl);

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressPhotoImplCopyWith<_$ProgressPhotoImpl> get copyWith =>
      __$$ProgressPhotoImplCopyWithImpl<_$ProgressPhotoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressPhotoImplToJson(
      this,
    );
  }
}

abstract class _ProgressPhoto implements ProgressPhoto {
  const factory _ProgressPhoto(
      {required final String id,
      required final String userId,
      required final DateTime date,
      final String? frontUrl,
      final String? sideUrl,
      final String? backUrl}) = _$ProgressPhotoImpl;

  factory _ProgressPhoto.fromJson(Map<String, dynamic> json) =
      _$ProgressPhotoImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get date;
  @override
  String? get frontUrl;
  @override
  String? get sideUrl;
  @override
  String? get backUrl;

  /// Create a copy of ProgressPhoto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgressPhotoImplCopyWith<_$ProgressPhotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
