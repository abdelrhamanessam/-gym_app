// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_set_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutSetGroup _$WorkoutSetGroupFromJson(Map<String, dynamic> json) {
  return _WorkoutSetGroup.fromJson(json);
}

/// @nodoc
mixin _$WorkoutSetGroup {
  String get exerciseId => throw _privateConstructorUsedError;
  String get exerciseName => throw _privateConstructorUsedError;
  List<WorkoutSet> get sets => throw _privateConstructorUsedError;
  int get restSeconds => throw _privateConstructorUsedError;

  /// Serializes this WorkoutSetGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutSetGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutSetGroupCopyWith<WorkoutSetGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSetGroupCopyWith<$Res> {
  factory $WorkoutSetGroupCopyWith(
          WorkoutSetGroup value, $Res Function(WorkoutSetGroup) then) =
      _$WorkoutSetGroupCopyWithImpl<$Res, WorkoutSetGroup>;
  @useResult
  $Res call(
      {String exerciseId,
      String exerciseName,
      List<WorkoutSet> sets,
      int restSeconds});
}

/// @nodoc
class _$WorkoutSetGroupCopyWithImpl<$Res, $Val extends WorkoutSetGroup>
    implements $WorkoutSetGroupCopyWith<$Res> {
  _$WorkoutSetGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutSetGroup
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
              as List<WorkoutSet>,
      restSeconds: null == restSeconds
          ? _value.restSeconds
          : restSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutSetGroupImplCopyWith<$Res>
    implements $WorkoutSetGroupCopyWith<$Res> {
  factory _$$WorkoutSetGroupImplCopyWith(_$WorkoutSetGroupImpl value,
          $Res Function(_$WorkoutSetGroupImpl) then) =
      __$$WorkoutSetGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String exerciseId,
      String exerciseName,
      List<WorkoutSet> sets,
      int restSeconds});
}

/// @nodoc
class __$$WorkoutSetGroupImplCopyWithImpl<$Res>
    extends _$WorkoutSetGroupCopyWithImpl<$Res, _$WorkoutSetGroupImpl>
    implements _$$WorkoutSetGroupImplCopyWith<$Res> {
  __$$WorkoutSetGroupImplCopyWithImpl(
      _$WorkoutSetGroupImpl _value, $Res Function(_$WorkoutSetGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutSetGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? sets = null,
    Object? restSeconds = null,
  }) {
    return _then(_$WorkoutSetGroupImpl(
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
              as List<WorkoutSet>,
      restSeconds: null == restSeconds
          ? _value.restSeconds
          : restSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutSetGroupImpl implements _WorkoutSetGroup {
  const _$WorkoutSetGroupImpl(
      {required this.exerciseId,
      required this.exerciseName,
      required final List<WorkoutSet> sets,
      this.restSeconds = 60})
      : _sets = sets;

  factory _$WorkoutSetGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutSetGroupImplFromJson(json);

  @override
  final String exerciseId;
  @override
  final String exerciseName;
  final List<WorkoutSet> _sets;
  @override
  List<WorkoutSet> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  @JsonKey()
  final int restSeconds;

  @override
  String toString() {
    return 'WorkoutSetGroup(exerciseId: $exerciseId, exerciseName: $exerciseName, sets: $sets, restSeconds: $restSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutSetGroupImpl &&
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

  /// Create a copy of WorkoutSetGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutSetGroupImplCopyWith<_$WorkoutSetGroupImpl> get copyWith =>
      __$$WorkoutSetGroupImplCopyWithImpl<_$WorkoutSetGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutSetGroupImplToJson(
      this,
    );
  }
}

abstract class _WorkoutSetGroup implements WorkoutSetGroup {
  const factory _WorkoutSetGroup(
      {required final String exerciseId,
      required final String exerciseName,
      required final List<WorkoutSet> sets,
      final int restSeconds}) = _$WorkoutSetGroupImpl;

  factory _WorkoutSetGroup.fromJson(Map<String, dynamic> json) =
      _$WorkoutSetGroupImpl.fromJson;

  @override
  String get exerciseId;
  @override
  String get exerciseName;
  @override
  List<WorkoutSet> get sets;
  @override
  int get restSeconds;

  /// Create a copy of WorkoutSetGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutSetGroupImplCopyWith<_$WorkoutSetGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
