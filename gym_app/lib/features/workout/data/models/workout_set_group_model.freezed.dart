// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_set_group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutSetGroupModel _$WorkoutSetGroupModelFromJson(Map<String, dynamic> json) {
  return _WorkoutSetGroupModel.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSetGroupModel {
  String get exerciseId => throw _privateConstructorUsedError;
  String get exerciseName => throw _privateConstructorUsedError;
  List<WorkoutSetModel> get sets => throw _privateConstructorUsedError;
  int get restSeconds => throw _privateConstructorUsedError;

  /// Serializes this WorkoutSetGroupModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSetGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSetGroupModelCopyWith<WorkoutSetGroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSetGroupModelCopyWith<$Res> {
  factory $WorkoutSetGroupModelCopyWith(WorkoutSetGroupModel value,
          $Res Function(WorkoutSetGroupModel) then) =
      _$WorkoutSetGroupModelCopyWithImpl<$Res, WorkoutSetGroupModel>;
  @useResult
  $Res call(
      {String exerciseId,
      String exerciseName,
      List<WorkoutSetModel> sets,
      int restSeconds});
}

/// @nodoc
class _$WorkoutSetGroupModelCopyWithImpl<$Res,
        $Val extends WorkoutSetGroupModel>
    implements $WorkoutSetGroupModelCopyWith<$Res> {
  _$WorkoutSetGroupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSetGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? sets = null,
    Object? restSeconds = null,
  }) {
    return _then(_value.copyWith(
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseName: null == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSetModel>,
      restSeconds: null == restSeconds
          ? _value.restSeconds
          : restSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutSetGroupModelImplCopyWith<$Res>
    implements $WorkoutSetGroupModelCopyWith<$Res> {
  factory _$$WorkoutSetGroupModelImplCopyWith(_$WorkoutSetGroupModelImpl value,
          $Res Function(_$WorkoutSetGroupModelImpl) then) =
      __$$WorkoutSetGroupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String exerciseId,
      String exerciseName,
      List<WorkoutSetModel> sets,
      int restSeconds});
}

/// @nodoc
class __$$WorkoutSetGroupModelImplCopyWithImpl<$Res>
    extends _$WorkoutSetGroupModelCopyWithImpl<$Res, _$WorkoutSetGroupModelImpl>
    implements _$$WorkoutSetGroupModelImplCopyWith<$Res> {
  __$$WorkoutSetGroupModelImplCopyWithImpl(_$WorkoutSetGroupModelImpl _value,
      $Res Function(_$WorkoutSetGroupModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutSetGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? sets = null,
    Object? restSeconds = null,
  }) {
    return _then(_$WorkoutSetGroupModelImpl(
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseName: null == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSetModel>,
      restSeconds: null == restSeconds
          ? _value.restSeconds
          : restSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSetGroupModelImpl implements _WorkoutSetGroupModel {
  const _$WorkoutSetGroupModelImpl(
      {required this.exerciseId,
      required this.exerciseName,
      required final List<WorkoutSetModel> sets,
      this.restSeconds = 60})
      : _sets = sets;

  factory _$WorkoutSetGroupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSetGroupModelImplFromJson(json);

  @override
  final String exerciseId;
  @override
  final String exerciseName;
  final List<WorkoutSetModel> _sets;
  @override
  List<WorkoutSetModel> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  @JsonKey()
  final int restSeconds;

  @override
  String toString() {
    return 'WorkoutSetGroupModel(exerciseId: $exerciseId, exerciseName: $exerciseName, sets: $sets, restSeconds: $restSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSetGroupModelImpl &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            const DeepCollectionEquality().equals(other._sets, _sets) &&
            (identical(other.restSeconds, restSeconds) ||
                other.restSeconds == restSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, exerciseId, exerciseName,
      const DeepCollectionEquality().hash(_sets), restSeconds);

  /// Create a copy of WorkoutSetGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSetGroupModelImplCopyWith<_$WorkoutSetGroupModelImpl>
      get copyWith =>
          __$$WorkoutSetGroupModelImplCopyWithImpl<_$WorkoutSetGroupModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSetGroupModelImplToJson(
      this,
    );
  }
}

abstract class _WorkoutSetGroupModel implements WorkoutSetGroupModel {
  const factory _WorkoutSetGroupModel(
      {required final String exerciseId,
      required final String exerciseName,
      required final List<WorkoutSetModel> sets,
      final int restSeconds}) = _$WorkoutSetGroupModelImpl;

  factory _WorkoutSetGroupModel.fromJson(Map<String, dynamic> json) =
      _$WorkoutSetGroupModelImpl.fromJson;

  @override
  String get exerciseId;
  @override
  String get exerciseName;
  @override
  List<WorkoutSetModel> get sets;
  @override
  int get restSeconds;

  /// Create a copy of WorkoutSetGroupModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSetGroupModelImplCopyWith<_$WorkoutSetGroupModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
