// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'body_goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BodyGoal _$BodyGoalFromJson(Map<String, dynamic> json) {
  return _BodyGoal.fromJson(json);
}

/// @nodoc
mixin _$BodyGoal {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  double? get targetWeightKg => throw _privateConstructorUsedError;
  double? get targetBodyFatPercent => throw _privateConstructorUsedError;
  double get startWeightKg => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get targetDate => throw _privateConstructorUsedError;
  GoalType get goal => throw _privateConstructorUsedError;

  /// Serializes this BodyGoal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BodyGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BodyGoalCopyWith<BodyGoal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyGoalCopyWith<$Res> {
  factory $BodyGoalCopyWith(BodyGoal value, $Res Function(BodyGoal) then) =
      _$BodyGoalCopyWithImpl<$Res, BodyGoal>;
  @useResult
  $Res call(
      {String id,
      String userId,
      double? targetWeightKg,
      double? targetBodyFatPercent,
      double startWeightKg,
      DateTime startDate,
      DateTime? targetDate,
      GoalType goal});
}

/// @nodoc
class _$BodyGoalCopyWithImpl<$Res, $Val extends BodyGoal>
    implements $BodyGoalCopyWith<$Res> {
  _$BodyGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BodyGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? targetWeightKg = freezed,
    Object? targetBodyFatPercent = freezed,
    Object? startWeightKg = null,
    Object? startDate = null,
    Object? targetDate = freezed,
    Object? goal = null,
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
      targetWeightKg: freezed == targetWeightKg
          ? _value.targetWeightKg
          : targetWeightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      targetBodyFatPercent: freezed == targetBodyFatPercent
          ? _value.targetBodyFatPercent
          : targetBodyFatPercent // ignore: cast_nullable_to_non_nullable
              as double?,
      startWeightKg: null == startWeightKg
          ? _value.startWeightKg
          : startWeightKg // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetDate: freezed == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as GoalType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BodyGoalImplCopyWith<$Res>
    implements $BodyGoalCopyWith<$Res> {
  factory _$$BodyGoalImplCopyWith(
          _$BodyGoalImpl value, $Res Function(_$BodyGoalImpl) then) =
      __$$BodyGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      double? targetWeightKg,
      double? targetBodyFatPercent,
      double startWeightKg,
      DateTime startDate,
      DateTime? targetDate,
      GoalType goal});
}

/// @nodoc
class __$$BodyGoalImplCopyWithImpl<$Res>
    extends _$BodyGoalCopyWithImpl<$Res, _$BodyGoalImpl>
    implements _$$BodyGoalImplCopyWith<$Res> {
  __$$BodyGoalImplCopyWithImpl(
      _$BodyGoalImpl _value, $Res Function(_$BodyGoalImpl) _then)
      : super(_value, _then);

  /// Create a copy of BodyGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? targetWeightKg = freezed,
    Object? targetBodyFatPercent = freezed,
    Object? startWeightKg = null,
    Object? startDate = null,
    Object? targetDate = freezed,
    Object? goal = null,
  }) {
    return _then(_$BodyGoalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      targetWeightKg: freezed == targetWeightKg
          ? _value.targetWeightKg
          : targetWeightKg // ignore: cast_nullable_to_non_nullable
              as double?,
      targetBodyFatPercent: freezed == targetBodyFatPercent
          ? _value.targetBodyFatPercent
          : targetBodyFatPercent // ignore: cast_nullable_to_non_nullable
              as double?,
      startWeightKg: null == startWeightKg
          ? _value.startWeightKg
          : startWeightKg // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetDate: freezed == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as GoalType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BodyGoalImpl implements _BodyGoal {
  const _$BodyGoalImpl(
      {required this.id,
      required this.userId,
      this.targetWeightKg,
      this.targetBodyFatPercent,
      required this.startWeightKg,
      required this.startDate,
      this.targetDate,
      required this.goal});

  factory _$BodyGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$BodyGoalImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final double? targetWeightKg;
  @override
  final double? targetBodyFatPercent;
  @override
  final double startWeightKg;
  @override
  final DateTime startDate;
  @override
  final DateTime? targetDate;
  @override
  final GoalType goal;

  @override
  String toString() {
    return 'BodyGoal(id: $id, userId: $userId, targetWeightKg: $targetWeightKg, targetBodyFatPercent: $targetBodyFatPercent, startWeightKg: $startWeightKg, startDate: $startDate, targetDate: $targetDate, goal: $goal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyGoalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.targetWeightKg, targetWeightKg) ||
                other.targetWeightKg == targetWeightKg) &&
            (identical(other.targetBodyFatPercent, targetBodyFatPercent) ||
                other.targetBodyFatPercent == targetBodyFatPercent) &&
            (identical(other.startWeightKg, startWeightKg) ||
                other.startWeightKg == startWeightKg) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate) &&
            (identical(other.goal, goal) || other.goal == goal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, targetWeightKg,
      targetBodyFatPercent, startWeightKg, startDate, targetDate, goal);

  /// Create a copy of BodyGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BodyGoalImplCopyWith<_$BodyGoalImpl> get copyWith =>
      __$$BodyGoalImplCopyWithImpl<_$BodyGoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BodyGoalImplToJson(
      this,
    );
  }
}

abstract class _BodyGoal implements BodyGoal {
  const factory _BodyGoal(
      {required final String id,
      required final String userId,
      final double? targetWeightKg,
      final double? targetBodyFatPercent,
      required final double startWeightKg,
      required final DateTime startDate,
      final DateTime? targetDate,
      required final GoalType goal}) = _$BodyGoalImpl;

  factory _BodyGoal.fromJson(Map<String, dynamic> json) =
      _$BodyGoalImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  double? get targetWeightKg;
  @override
  double? get targetBodyFatPercent;
  @override
  double get startWeightKg;
  @override
  DateTime get startDate;
  @override
  DateTime? get targetDate;
  @override
  GoalType get goal;

  /// Create a copy of BodyGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BodyGoalImplCopyWith<_$BodyGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
