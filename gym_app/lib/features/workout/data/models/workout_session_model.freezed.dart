// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutSessionModel _$WorkoutSessionModelFromJson(Map<String, dynamic> json) {
  return _WorkoutSessionModel.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSessionModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  List<WorkoutSetGroupModel> get exercises =>
      throw _privateConstructorUsedError;
  double get totalVolumeKg => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this WorkoutSessionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSessionModelCopyWith<WorkoutSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSessionModelCopyWith<$Res> {
  factory $WorkoutSessionModelCopyWith(
          WorkoutSessionModel value, $Res Function(WorkoutSessionModel) then) =
      _$WorkoutSessionModelCopyWithImpl<$Res, WorkoutSessionModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String date,
      String name,
      int durationMinutes,
      List<WorkoutSetGroupModel> exercises,
      double totalVolumeKg,
      String? notes,
      bool isCompleted,
      String createdAt});
}

/// @nodoc
class _$WorkoutSessionModelCopyWithImpl<$Res, $Val extends WorkoutSessionModel>
    implements $WorkoutSessionModelCopyWith<$Res> {
  _$WorkoutSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? name = null,
    Object? durationMinutes = null,
    Object? exercises = null,
    Object? totalVolumeKg = null,
    Object? notes = freezed,
    Object? isCompleted = null,
    Object? createdAt = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSetGroupModel>,
      totalVolumeKg: null == totalVolumeKg
          ? _value.totalVolumeKg
          : totalVolumeKg // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutSessionModelImplCopyWith<$Res>
    implements $WorkoutSessionModelCopyWith<$Res> {
  factory _$$WorkoutSessionModelImplCopyWith(_$WorkoutSessionModelImpl value,
          $Res Function(_$WorkoutSessionModelImpl) then) =
      __$$WorkoutSessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String date,
      String name,
      int durationMinutes,
      List<WorkoutSetGroupModel> exercises,
      double totalVolumeKg,
      String? notes,
      bool isCompleted,
      String createdAt});
}

/// @nodoc
class __$$WorkoutSessionModelImplCopyWithImpl<$Res>
    extends _$WorkoutSessionModelCopyWithImpl<$Res, _$WorkoutSessionModelImpl>
    implements _$$WorkoutSessionModelImplCopyWith<$Res> {
  __$$WorkoutSessionModelImplCopyWithImpl(_$WorkoutSessionModelImpl _value,
      $Res Function(_$WorkoutSessionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? name = null,
    Object? durationMinutes = null,
    Object? exercises = null,
    Object? totalVolumeKg = null,
    Object? notes = freezed,
    Object? isCompleted = null,
    Object? createdAt = null,
  }) {
    return _then(_$WorkoutSessionModelImpl(
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSetGroupModel>,
      totalVolumeKg: null == totalVolumeKg
          ? _value.totalVolumeKg
          : totalVolumeKg // ignore: cast_nullable_to_non_nullable
              as double,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSessionModelImpl implements _WorkoutSessionModel {
  const _$WorkoutSessionModelImpl(
      {required this.id,
      required this.userId,
      required this.date,
      required this.name,
      this.durationMinutes = 0,
      final List<WorkoutSetGroupModel> exercises = const [],
      this.totalVolumeKg = 0.0,
      this.notes,
      this.isCompleted = false,
      required this.createdAt})
      : _exercises = exercises;

  factory _$WorkoutSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSessionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String date;
  @override
  final String name;
  @override
  @JsonKey()
  final int durationMinutes;
  final List<WorkoutSetGroupModel> _exercises;
  @override
  @JsonKey()
  List<WorkoutSetGroupModel> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  @JsonKey()
  final double totalVolumeKg;
  @override
  final String? notes;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'WorkoutSessionModel(id: $id, userId: $userId, date: $date, name: $name, durationMinutes: $durationMinutes, exercises: $exercises, totalVolumeKg: $totalVolumeKg, notes: $notes, isCompleted: $isCompleted, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSessionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises) &&
            (identical(other.totalVolumeKg, totalVolumeKg) ||
                other.totalVolumeKg == totalVolumeKg) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      date,
      name,
      durationMinutes,
      const DeepCollectionEquality().hash(_exercises),
      totalVolumeKg,
      notes,
      isCompleted,
      createdAt);

  /// Create a copy of WorkoutSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSessionModelImplCopyWith<_$WorkoutSessionModelImpl> get copyWith =>
      __$$WorkoutSessionModelImplCopyWithImpl<_$WorkoutSessionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSessionModelImplToJson(
      this,
    );
  }
}

abstract class _WorkoutSessionModel implements WorkoutSessionModel {
  const factory _WorkoutSessionModel(
      {required final String id,
      required final String userId,
      required final String date,
      required final String name,
      final int durationMinutes,
      final List<WorkoutSetGroupModel> exercises,
      final double totalVolumeKg,
      final String? notes,
      final bool isCompleted,
      required final String createdAt}) = _$WorkoutSessionModelImpl;

  factory _WorkoutSessionModel.fromJson(Map<String, dynamic> json) =
      _$WorkoutSessionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get date;
  @override
  String get name;
  @override
  int get durationMinutes;
  @override
  List<WorkoutSetGroupModel> get exercises;
  @override
  double get totalVolumeKg;
  @override
  String? get notes;
  @override
  bool get isCompleted;
  @override
  String get createdAt;

  /// Create a copy of WorkoutSessionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSessionModelImplCopyWith<_$WorkoutSessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
