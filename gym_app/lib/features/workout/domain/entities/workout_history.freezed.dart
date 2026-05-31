// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutHistory _$WorkoutHistoryFromJson(Map<String, dynamic> json) {
  return _WorkoutHistory.fromJson(json);
}

/// @nodoc
mixin _$WorkoutHistory {
  String get id => throw _privateConstructorUsedError;
  String get workoutSessionId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get exerciseName => throw _privateConstructorUsedError;
  MuscleGroup get muscleGroup => throw _privateConstructorUsedError;
  List<WorkoutSet> get sets => throw _privateConstructorUsedError;
  double get volumeKg => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this WorkoutHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutHistoryCopyWith<WorkoutHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutHistoryCopyWith<$Res> {
  factory $WorkoutHistoryCopyWith(
          WorkoutHistory value, $Res Function(WorkoutHistory) then) =
      _$WorkoutHistoryCopyWithImpl<$Res, WorkoutHistory>;
  @useResult
  $Res call(
      {String id,
      String workoutSessionId,
      DateTime date,
      String exerciseName,
      MuscleGroup muscleGroup,
      List<WorkoutSet> sets,
      double volumeKg,
      DateTime createdAt});
}

/// @nodoc
class _$WorkoutHistoryCopyWithImpl<$Res, $Val extends WorkoutHistory>
    implements $WorkoutHistoryCopyWith<$Res> {
  _$WorkoutHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workoutSessionId = null,
    Object? date = null,
    Object? exerciseName = null,
    Object? muscleGroup = null,
    Object? sets = null,
    Object? volumeKg = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workoutSessionId: null == workoutSessionId
          ? _value.workoutSessionId
          : workoutSessionId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exerciseName: null == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      muscleGroup: null == muscleGroup
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as MuscleGroup,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSet>,
      volumeKg: null == volumeKg
          ? _value.volumeKg
          : volumeKg // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutHistoryImplCopyWith<$Res>
    implements $WorkoutHistoryCopyWith<$Res> {
  factory _$$WorkoutHistoryImplCopyWith(_$WorkoutHistoryImpl value,
          $Res Function(_$WorkoutHistoryImpl) then) =
      __$$WorkoutHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String workoutSessionId,
      DateTime date,
      String exerciseName,
      MuscleGroup muscleGroup,
      List<WorkoutSet> sets,
      double volumeKg,
      DateTime createdAt});
}

/// @nodoc
class __$$WorkoutHistoryImplCopyWithImpl<$Res>
    extends _$WorkoutHistoryCopyWithImpl<$Res, _$WorkoutHistoryImpl>
    implements _$$WorkoutHistoryImplCopyWith<$Res> {
  __$$WorkoutHistoryImplCopyWithImpl(
      _$WorkoutHistoryImpl _value, $Res Function(_$WorkoutHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workoutSessionId = null,
    Object? date = null,
    Object? exerciseName = null,
    Object? muscleGroup = null,
    Object? sets = null,
    Object? volumeKg = null,
    Object? createdAt = null,
  }) {
    return _then(_$WorkoutHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      workoutSessionId: null == workoutSessionId
          ? _value.workoutSessionId
          : workoutSessionId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exerciseName: null == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      muscleGroup: null == muscleGroup
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as MuscleGroup,
      sets: null == sets
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSet>,
      volumeKg: null == volumeKg
          ? _value.volumeKg
          : volumeKg // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutHistoryImpl implements _WorkoutHistory {
  const _$WorkoutHistoryImpl(
      {required this.id,
      required this.workoutSessionId,
      required this.date,
      required this.exerciseName,
      required this.muscleGroup,
      required final List<WorkoutSet> sets,
      this.volumeKg = 0.0,
      required this.createdAt})
      : _sets = sets;

  factory _$WorkoutHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutHistoryImplFromJson(json);

  @override
  final String id;
  @override
  final String workoutSessionId;
  @override
  final DateTime date;
  @override
  final String exerciseName;
  @override
  final MuscleGroup muscleGroup;
  final List<WorkoutSet> _sets;
  @override
  List<WorkoutSet> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  @JsonKey()
  final double volumeKg;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'WorkoutHistory(id: $id, workoutSessionId: $workoutSessionId, date: $date, exerciseName: $exerciseName, muscleGroup: $muscleGroup, sets: $sets, volumeKg: $volumeKg, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workoutSessionId, workoutSessionId) ||
                other.workoutSessionId == workoutSessionId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.muscleGroup, muscleGroup) ||
                other.muscleGroup == muscleGroup) &&
            const DeepCollectionEquality().equals(other._sets, _sets) &&
            (identical(other.volumeKg, volumeKg) ||
                other.volumeKg == volumeKg) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      workoutSessionId,
      date,
      exerciseName,
      muscleGroup,
      const DeepCollectionEquality().hash(_sets),
      volumeKg,
      createdAt);

  /// Create a copy of WorkoutHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutHistoryImplCopyWith<_$WorkoutHistoryImpl> get copyWith =>
      __$$WorkoutHistoryImplCopyWithImpl<_$WorkoutHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutHistoryImplToJson(
      this,
    );
  }
}

abstract class _WorkoutHistory implements WorkoutHistory {
  const factory _WorkoutHistory(
      {required final String id,
      required final String workoutSessionId,
      required final DateTime date,
      required final String exerciseName,
      required final MuscleGroup muscleGroup,
      required final List<WorkoutSet> sets,
      final double volumeKg,
      required final DateTime createdAt}) = _$WorkoutHistoryImpl;

  factory _WorkoutHistory.fromJson(Map<String, dynamic> json) =
      _$WorkoutHistoryImpl.fromJson;

  @override
  String get id;
  @override
  String get workoutSessionId;
  @override
  DateTime get date;
  @override
  String get exerciseName;
  @override
  MuscleGroup get muscleGroup;
  @override
  List<WorkoutSet> get sets;
  @override
  double get volumeKg;
  @override
  DateTime get createdAt;

  /// Create a copy of WorkoutHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutHistoryImplCopyWith<_$WorkoutHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
