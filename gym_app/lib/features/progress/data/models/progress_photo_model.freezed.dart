// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_photo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProgressPhotoModel _$ProgressPhotoModelFromJson(Map<String, dynamic> json) {
  return _ProgressPhotoModel.fromJson(json);
}

/// @nodoc
mixin _$ProgressPhotoModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String? get frontUrl => throw _privateConstructorUsedError;
  String? get sideUrl => throw _privateConstructorUsedError;
  String? get backUrl => throw _privateConstructorUsedError;

  /// Serializes this ProgressPhotoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProgressPhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgressPhotoModelCopyWith<ProgressPhotoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressPhotoModelCopyWith<$Res> {
  factory $ProgressPhotoModelCopyWith(
          ProgressPhotoModel value, $Res Function(ProgressPhotoModel) then) =
      _$ProgressPhotoModelCopyWithImpl<$Res, ProgressPhotoModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String date,
      String? frontUrl,
      String? sideUrl,
      String? backUrl});
}

/// @nodoc
class _$ProgressPhotoModelCopyWithImpl<$Res, $Val extends ProgressPhotoModel>
    implements $ProgressPhotoModelCopyWith<$Res> {
  _$ProgressPhotoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgressPhotoModel
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
              as String,
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
abstract class _$$ProgressPhotoModelImplCopyWith<$Res>
    implements $ProgressPhotoModelCopyWith<$Res> {
  factory _$$ProgressPhotoModelImplCopyWith(_$ProgressPhotoModelImpl value,
          $Res Function(_$ProgressPhotoModelImpl) then) =
      __$$ProgressPhotoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String date,
      String? frontUrl,
      String? sideUrl,
      String? backUrl});
}

/// @nodoc
class __$$ProgressPhotoModelImplCopyWithImpl<$Res>
    extends _$ProgressPhotoModelCopyWithImpl<$Res, _$ProgressPhotoModelImpl>
    implements _$$ProgressPhotoModelImplCopyWith<$Res> {
  __$$ProgressPhotoModelImplCopyWithImpl(_$ProgressPhotoModelImpl _value,
      $Res Function(_$ProgressPhotoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgressPhotoModel
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
    return _then(_$ProgressPhotoModelImpl(
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
              as String,
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
class _$ProgressPhotoModelImpl implements _ProgressPhotoModel {
  const _$ProgressPhotoModelImpl(
      {required this.id,
      required this.userId,
      required this.date,
      this.frontUrl,
      this.sideUrl,
      this.backUrl});

  factory _$ProgressPhotoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressPhotoModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String date;
  @override
  final String? frontUrl;
  @override
  final String? sideUrl;
  @override
  final String? backUrl;

  @override
  String toString() {
    return 'ProgressPhotoModel(id: $id, userId: $userId, date: $date, frontUrl: $frontUrl, sideUrl: $sideUrl, backUrl: $backUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressPhotoModelImpl &&
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

  /// Create a copy of ProgressPhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressPhotoModelImplCopyWith<_$ProgressPhotoModelImpl> get copyWith =>
      __$$ProgressPhotoModelImplCopyWithImpl<_$ProgressPhotoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressPhotoModelImplToJson(
      this,
    );
  }
}

abstract class _ProgressPhotoModel implements ProgressPhotoModel {
  const factory _ProgressPhotoModel(
      {required final String id,
      required final String userId,
      required final String date,
      final String? frontUrl,
      final String? sideUrl,
      final String? backUrl}) = _$ProgressPhotoModelImpl;

  factory _ProgressPhotoModel.fromJson(Map<String, dynamic> json) =
      _$ProgressPhotoModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get date;
  @override
  String? get frontUrl;
  @override
  String? get sideUrl;
  @override
  String? get backUrl;

  /// Create a copy of ProgressPhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgressPhotoModelImplCopyWith<_$ProgressPhotoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
