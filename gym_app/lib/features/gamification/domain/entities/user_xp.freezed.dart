// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_xp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserXp _$UserXpFromJson(Map<String, dynamic> json) {
  return _UserXp.fromJson(json);
}

/// @nodoc
mixin _$UserXp {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get totalXp => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get streakDays => throw _privateConstructorUsedError;
  int get longestStreak => throw _privateConstructorUsedError;
  DateTime? get lastWorkoutDate => throw _privateConstructorUsedError;
  DateTime? get lastFoodLogDate => throw _privateConstructorUsedError;

  /// Serializes this UserXp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserXp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserXpCopyWith<UserXp> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserXpCopyWith<$Res> {
  factory $UserXpCopyWith(UserXp value, $Res Function(UserXp) then) =
      _$UserXpCopyWithImpl<$Res, UserXp>;
  @useResult
  $Res call(
      {String id,
      String userId,
      int totalXp,
      int level,
      int streakDays,
      int longestStreak,
      DateTime? lastWorkoutDate,
      DateTime? lastFoodLogDate});
}

/// @nodoc
class _$UserXpCopyWithImpl<$Res, $Val extends UserXp>
    implements $UserXpCopyWith<$Res> {
  _$UserXpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserXp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? totalXp = null,
    Object? level = null,
    Object? streakDays = null,
    Object? longestStreak = null,
    Object? lastWorkoutDate = freezed,
    Object? lastFoodLogDate = freezed,
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
      totalXp: null == totalXp
          ? _value.totalXp
          : totalXp // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      lastWorkoutDate: freezed == lastWorkoutDate
          ? _value.lastWorkoutDate
          : lastWorkoutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastFoodLogDate: freezed == lastFoodLogDate
          ? _value.lastFoodLogDate
          : lastFoodLogDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserXpImplCopyWith<$Res> implements $UserXpCopyWith<$Res> {
  factory _$$UserXpImplCopyWith(
          _$UserXpImpl value, $Res Function(_$UserXpImpl) then) =
      __$$UserXpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      int totalXp,
      int level,
      int streakDays,
      int longestStreak,
      DateTime? lastWorkoutDate,
      DateTime? lastFoodLogDate});
}

/// @nodoc
class __$$UserXpImplCopyWithImpl<$Res>
    extends _$UserXpCopyWithImpl<$Res, _$UserXpImpl>
    implements _$$UserXpImplCopyWith<$Res> {
  __$$UserXpImplCopyWithImpl(
      _$UserXpImpl _value, $Res Function(_$UserXpImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserXp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? totalXp = null,
    Object? level = null,
    Object? streakDays = null,
    Object? longestStreak = null,
    Object? lastWorkoutDate = freezed,
    Object? lastFoodLogDate = freezed,
  }) {
    return _then(_$UserXpImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalXp: null == totalXp
          ? _value.totalXp
          : totalXp // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      streakDays: null == streakDays
          ? _value.streakDays
          : streakDays // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      lastWorkoutDate: freezed == lastWorkoutDate
          ? _value.lastWorkoutDate
          : lastWorkoutDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastFoodLogDate: freezed == lastFoodLogDate
          ? _value.lastFoodLogDate
          : lastFoodLogDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserXpImpl implements _UserXp {
  const _$UserXpImpl(
      {required this.id,
      required this.userId,
      this.totalXp = 0,
      this.level = 1,
      this.streakDays = 0,
      this.longestStreak = 0,
      this.lastWorkoutDate,
      this.lastFoodLogDate});

  factory _$UserXpImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserXpImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  @JsonKey()
  final int totalXp;
  @override
  @JsonKey()
  final int level;
  @override
  @JsonKey()
  final int streakDays;
  @override
  @JsonKey()
  final int longestStreak;
  @override
  final DateTime? lastWorkoutDate;
  @override
  final DateTime? lastFoodLogDate;

  @override
  String toString() {
    return 'UserXp(id: $id, userId: $userId, totalXp: $totalXp, level: $level, streakDays: $streakDays, longestStreak: $longestStreak, lastWorkoutDate: $lastWorkoutDate, lastFoodLogDate: $lastFoodLogDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserXpImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalXp, totalXp) || other.totalXp == totalXp) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak) &&
            (identical(other.lastWorkoutDate, lastWorkoutDate) ||
                other.lastWorkoutDate == lastWorkoutDate) &&
            (identical(other.lastFoodLogDate, lastFoodLogDate) ||
                other.lastFoodLogDate == lastFoodLogDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, totalXp, level,
      streakDays, longestStreak, lastWorkoutDate, lastFoodLogDate);

  /// Create a copy of UserXp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserXpImplCopyWith<_$UserXpImpl> get copyWith =>
      __$$UserXpImplCopyWithImpl<_$UserXpImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserXpImplToJson(
      this,
    );
  }
}

abstract class _UserXp implements UserXp {
  const factory _UserXp(
      {required final String id,
      required final String userId,
      final int totalXp,
      final int level,
      final int streakDays,
      final int longestStreak,
      final DateTime? lastWorkoutDate,
      final DateTime? lastFoodLogDate}) = _$UserXpImpl;

  factory _UserXp.fromJson(Map<String, dynamic> json) = _$UserXpImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  int get totalXp;
  @override
  int get level;
  @override
  int get streakDays;
  @override
  int get longestStreak;
  @override
  DateTime? get lastWorkoutDate;
  @override
  DateTime? get lastFoodLogDate;

  /// Create a copy of UserXp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserXpImplCopyWith<_$UserXpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
