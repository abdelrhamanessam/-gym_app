// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_achievement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAchievement _$UserAchievementFromJson(Map<String, dynamic> json) {
  return _UserAchievement.fromJson(json);
}

/// @nodoc
mixin _$UserAchievement {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get achievementId => throw _privateConstructorUsedError;
  String get achievementName => throw _privateConstructorUsedError;
  DateTime get unlockedAt => throw _privateConstructorUsedError;
  int get xpAwarded => throw _privateConstructorUsedError;

  /// Serializes this UserAchievement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAchievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAchievementCopyWith<UserAchievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAchievementCopyWith<$Res> {
  factory $UserAchievementCopyWith(
          UserAchievement value, $Res Function(UserAchievement) then) =
      _$UserAchievementCopyWithImpl<$Res, UserAchievement>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String achievementId,
      String achievementName,
      DateTime unlockedAt,
      int xpAwarded});
}

/// @nodoc
class _$UserAchievementCopyWithImpl<$Res, $Val extends UserAchievement>
    implements $UserAchievementCopyWith<$Res> {
  _$UserAchievementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAchievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? achievementId = null,
    Object? achievementName = null,
    Object? unlockedAt = null,
    Object? xpAwarded = null,
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
      achievementId: null == achievementId
          ? _value.achievementId
          : achievementId // ignore: cast_nullable_to_non_nullable
              as String,
      achievementName: null == achievementName
          ? _value.achievementName
          : achievementName // ignore: cast_nullable_to_non_nullable
              as String,
      unlockedAt: null == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      xpAwarded: null == xpAwarded
          ? _value.xpAwarded
          : xpAwarded // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAchievementImplCopyWith<$Res>
    implements $UserAchievementCopyWith<$Res> {
  factory _$$UserAchievementImplCopyWith(_$UserAchievementImpl value,
          $Res Function(_$UserAchievementImpl) then) =
      __$$UserAchievementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String achievementId,
      String achievementName,
      DateTime unlockedAt,
      int xpAwarded});
}

/// @nodoc
class __$$UserAchievementImplCopyWithImpl<$Res>
    extends _$UserAchievementCopyWithImpl<$Res, _$UserAchievementImpl>
    implements _$$UserAchievementImplCopyWith<$Res> {
  __$$UserAchievementImplCopyWithImpl(
      _$UserAchievementImpl _value, $Res Function(_$UserAchievementImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAchievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? achievementId = null,
    Object? achievementName = null,
    Object? unlockedAt = null,
    Object? xpAwarded = null,
  }) {
    return _then(_$UserAchievementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      achievementId: null == achievementId
          ? _value.achievementId
          : achievementId // ignore: cast_nullable_to_non_nullable
              as String,
      achievementName: null == achievementName
          ? _value.achievementName
          : achievementName // ignore: cast_nullable_to_non_nullable
              as String,
      unlockedAt: null == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      xpAwarded: null == xpAwarded
          ? _value.xpAwarded
          : xpAwarded // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAchievementImpl implements _UserAchievement {
  const _$UserAchievementImpl(
      {required this.id,
      required this.userId,
      required this.achievementId,
      required this.achievementName,
      required this.unlockedAt,
      this.xpAwarded = 0});

  factory _$UserAchievementImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAchievementImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String achievementId;
  @override
  final String achievementName;
  @override
  final DateTime unlockedAt;
  @override
  @JsonKey()
  final int xpAwarded;

  @override
  String toString() {
    return 'UserAchievement(id: $id, userId: $userId, achievementId: $achievementId, achievementName: $achievementName, unlockedAt: $unlockedAt, xpAwarded: $xpAwarded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAchievementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.achievementId, achievementId) ||
                other.achievementId == achievementId) &&
            (identical(other.achievementName, achievementName) ||
                other.achievementName == achievementName) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt) &&
            (identical(other.xpAwarded, xpAwarded) ||
                other.xpAwarded == xpAwarded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, achievementId,
      achievementName, unlockedAt, xpAwarded);

  /// Create a copy of UserAchievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAchievementImplCopyWith<_$UserAchievementImpl> get copyWith =>
      __$$UserAchievementImplCopyWithImpl<_$UserAchievementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAchievementImplToJson(
      this,
    );
  }
}

abstract class _UserAchievement implements UserAchievement {
  const factory _UserAchievement(
      {required final String id,
      required final String userId,
      required final String achievementId,
      required final String achievementName,
      required final DateTime unlockedAt,
      final int xpAwarded}) = _$UserAchievementImpl;

  factory _UserAchievement.fromJson(Map<String, dynamic> json) =
      _$UserAchievementImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get achievementId;
  @override
  String get achievementName;
  @override
  DateTime get unlockedAt;
  @override
  int get xpAwarded;

  /// Create a copy of UserAchievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAchievementImplCopyWith<_$UserAchievementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
