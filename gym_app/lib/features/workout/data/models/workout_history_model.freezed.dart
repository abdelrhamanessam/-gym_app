// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutHistoryModel _$WorkoutHistoryModelFromJson(Map<String, dynamic> json) {
  return _WorkoutHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$WorkoutHistoryModel {
  String get id => throw _privateConstructorUsedError;
  String get workoutSessionId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get exerciseName => throw _privateConstructorUsedError;
  String get muscleGroup => throw _privateConstructorUsedError;
  List<WorkoutSetModel> get sets => throw _privateConstructorUsedError;
  double get volumeKg => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this WorkoutHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutHistoryModelCopyWith<WorkoutHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutHistoryModelCopyWith<$Res> {
  factory $WorkoutHistoryModelCopyWith(
          WorkoutHistoryModel value, $Res Function(WorkoutHistoryModel) then) =
      _$WorkoutHistoryModelCopyWithImpl<$Res, WorkoutHistoryModel>;
  @useResult
  $Res call(
      {String id,
      String workoutSessionId,
      String date,
      String exerciseName,
      String muscleGroup,
      List<WorkoutSetModel> sets,
      double volumeKg,
      String createdAt});
}

/// @nodoc
class _$WorkoutHistoryModelCopyWithImpl<$Res, $Val extends WorkoutHistoryModel>
    implements $WorkoutHistoryModelCopyWith<$Res> {
  _$WorkoutHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutHistoryModel
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
              as String,
      exerciseName: null == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      muscleGroup: null == muscleGroup
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSetModel>,
      volumeKg: null == volumeKg
          ? _value.volumeKg
          : volumeKg // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutHistoryModelImplCopyWith<$Res>
    implements $WorkoutHistoryModelCopyWith<$Res> {
  factory _$$WorkoutHistoryModelImplCopyWith(_$WorkoutHistoryModelImpl value,
          $Res Function(_$WorkoutHistoryModelImpl) then) =
      __$$WorkoutHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String workoutSessionId,
      String date,
      String exerciseName,
      String muscleGroup,
      List<WorkoutSetModel> sets,
      double volumeKg,
      String createdAt});
}

/// @nodoc
class __$$WorkoutHistoryModelImplCopyWithImpl<$Res>
    extends _$WorkoutHistoryModelCopyWithImpl<$Res, _$WorkoutHistoryModelImpl>
    implements _$$WorkoutHistoryModelImplCopyWith<$Res> {
  __$$WorkoutHistoryModelImplCopyWithImpl(_$WorkoutHistoryModelImpl _value,
      $Res Function(_$WorkoutHistoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutHistoryModel
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
    return _then(_$WorkoutHistoryModelImpl(
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
              as String,
      exerciseName: null == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      muscleGroup: null == muscleGroup
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSetModel>,
      volumeKg: null == volumeKg
          ? _value.volumeKg
          : volumeKg // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutHistoryModelImpl implements _WorkoutHistoryModel {
  const _$WorkoutHistoryModelImpl(
      {required this.id,
      required this.workoutSessionId,
      required this.date,
      required this.exerciseName,
      required this.muscleGroup,
      required final List<WorkoutSetModel> sets,
      this.volumeKg = 0.0,
      required this.createdAt})
      : _sets = sets;

  factory _$WorkoutHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutHistoryModelImplFromJson(json);

  @override
  final String id;
  @override
  final String workoutSessionId;
  @override
  final String date;
  @override
  final String exerciseName;
  @override
  final String muscleGroup;
  final List<WorkoutSetModel> _sets;
  @override
  List<WorkoutSetModel> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  @JsonKey()
  final double volumeKg;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'WorkoutHistoryModel(id: $id, workoutSessionId: $workoutSessionId, date: $date, exerciseName: $exerciseName, muscleGroup: $muscleGroup, sets: $sets, volumeKg: $volumeKg, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutHistoryModelImpl &&
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

  /// Create a copy of WorkoutHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutHistoryModelImplCopyWith<_$WorkoutHistoryModelImpl> get copyWith =>
      __$$WorkoutHistoryModelImplCopyWithImpl<_$WorkoutHistoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _WorkoutHistoryModel implements WorkoutHistoryModel {
  const factory _WorkoutHistoryModel(
      {required final String id,
      required final String workoutSessionId,
      required final String date,
      required final String exerciseName,
      required final String muscleGroup,
      required final List<WorkoutSetModel> sets,
      final double volumeKg,
      required final String createdAt}) = _$WorkoutHistoryModelImpl;

  factory _WorkoutHistoryModel.fromJson(Map<String, dynamic> json) =
      _$WorkoutHistoryModelImpl.fromJson;

  @override
  String get id;
  @override
  String get workoutSessionId;
  @override
  String get date;
  @override
  String get exerciseName;
  @override
  String get muscleGroup;
  @override
  List<WorkoutSetModel> get sets;
  @override
  double get volumeKg;
  @override
  String get createdAt;

  /// Create a copy of WorkoutHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutHistoryModelImplCopyWith<_$WorkoutHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
