// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TemplateExercise _$TemplateExerciseFromJson(Map<String, dynamic> json) {
  return _TemplateExercise.fromJson(json);
}

/// @nodoc
mixin _$TemplateExercise {
  String get exerciseId => throw _privateConstructorUsedError;
  String get exerciseName => throw _privateConstructorUsedError;
  int get targetSets => throw _privateConstructorUsedError;
  int get targetReps => throw _privateConstructorUsedError;
  int get restSeconds => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  /// Serializes this TemplateExercise to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TemplateExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TemplateExerciseCopyWith<TemplateExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateExerciseCopyWith<$Res> {
  factory $TemplateExerciseCopyWith(
          TemplateExercise value, $Res Function(TemplateExercise) then) =
      _$TemplateExerciseCopyWithImpl<$Res, TemplateExercise>;
  @useResult
  $Res call(
      {String exerciseId,
      String exerciseName,
      int targetSets,
      int targetReps,
      int restSeconds,
      int order});
}

/// @nodoc
class _$TemplateExerciseCopyWithImpl<$Res, $Val extends TemplateExercise>
    implements $TemplateExerciseCopyWith<$Res> {
  _$TemplateExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TemplateExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? targetSets = null,
    Object? targetReps = null,
    Object? restSeconds = null,
    Object? order = null,
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
      targetSets: null == targetSets
          ? _value.targetSets
          : targetSets // ignore: cast_nullable_to_non_nullable
              as int,
      targetReps: null == targetReps
          ? _value.targetReps
          : targetReps // ignore: cast_nullable_to_non_nullable
              as int,
      restSeconds: null == restSeconds
          ? _value.restSeconds
          : restSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateExerciseImplCopyWith<$Res>
    implements $TemplateExerciseCopyWith<$Res> {
  factory _$$TemplateExerciseImplCopyWith(_$TemplateExerciseImpl value,
          $Res Function(_$TemplateExerciseImpl) then) =
      __$$TemplateExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String exerciseId,
      String exerciseName,
      int targetSets,
      int targetReps,
      int restSeconds,
      int order});
}

/// @nodoc
class __$$TemplateExerciseImplCopyWithImpl<$Res>
    extends _$TemplateExerciseCopyWithImpl<$Res, _$TemplateExerciseImpl>
    implements _$$TemplateExerciseImplCopyWith<$Res> {
  __$$TemplateExerciseImplCopyWithImpl(_$TemplateExerciseImpl _value,
      $Res Function(_$TemplateExerciseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TemplateExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseId = null,
    Object? exerciseName = null,
    Object? targetSets = null,
    Object? targetReps = null,
    Object? restSeconds = null,
    Object? order = null,
  }) {
    return _then(_$TemplateExerciseImpl(
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseName: null == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      targetSets: null == targetSets
          ? _value.targetSets
          : targetSets // ignore: cast_nullable_to_non_nullable
              as int,
      targetReps: null == targetReps
          ? _value.targetReps
          : targetReps // ignore: cast_nullable_to_non_nullable
              as int,
      restSeconds: null == restSeconds
          ? _value.restSeconds
          : restSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TemplateExerciseImpl implements _TemplateExercise {
  const _$TemplateExerciseImpl(
      {required this.exerciseId,
      required this.exerciseName,
      this.targetSets = 3,
      this.targetReps = 10,
      this.restSeconds = 60,
      required this.order});

  factory _$TemplateExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TemplateExerciseImplFromJson(json);

  @override
  final String exerciseId;
  @override
  final String exerciseName;
  @override
  @JsonKey()
  final int targetSets;
  @override
  @JsonKey()
  final int targetReps;
  @override
  @JsonKey()
  final int restSeconds;
  @override
  final int order;

  @override
  String toString() {
    return 'TemplateExercise(exerciseId: $exerciseId, exerciseName: $exerciseName, targetSets: $targetSets, targetReps: $targetReps, restSeconds: $restSeconds, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateExerciseImpl &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.targetSets, targetSets) ||
                other.targetSets == targetSets) &&
            (identical(other.targetReps, targetReps) ||
                other.targetReps == targetReps) &&
            (identical(other.restSeconds, restSeconds) ||
                other.restSeconds == restSeconds) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, exerciseId, exerciseName,
      targetSets, targetReps, restSeconds, order);

  /// Create a copy of TemplateExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateExerciseImplCopyWith<_$TemplateExerciseImpl> get copyWith =>
      __$$TemplateExerciseImplCopyWithImpl<_$TemplateExerciseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TemplateExerciseImplToJson(
      this,
    );
  }
}

abstract class _TemplateExercise implements TemplateExercise {
  const factory _TemplateExercise(
      {required final String exerciseId,
      required final String exerciseName,
      final int targetSets,
      final int targetReps,
      final int restSeconds,
      required final int order}) = _$TemplateExerciseImpl;

  factory _TemplateExercise.fromJson(Map<String, dynamic> json) =
      _$TemplateExerciseImpl.fromJson;

  @override
  String get exerciseId;
  @override
  String get exerciseName;
  @override
  int get targetSets;
  @override
  int get targetReps;
  @override
  int get restSeconds;
  @override
  int get order;

  /// Create a copy of TemplateExercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TemplateExerciseImplCopyWith<_$TemplateExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
