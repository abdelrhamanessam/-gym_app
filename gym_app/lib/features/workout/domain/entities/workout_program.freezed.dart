// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutProgram _$WorkoutProgramFromJson(Map<String, dynamic> json) {
  return _WorkoutProgram.fromJson(json);
}

/// @nodoc
mixin _$WorkoutProgram {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Difficulty get difficulty => throw _privateConstructorUsedError;
  Goal get goal => throw _privateConstructorUsedError;
  int get durationWeeks => throw _privateConstructorUsedError;
  int get sessionsPerWeek => throw _privateConstructorUsedError;
  List<WorkoutTemplate> get templates => throw _privateConstructorUsedError;
  bool get isBuiltIn => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this WorkoutProgram to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutProgramCopyWith<WorkoutProgram> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutProgramCopyWith<$Res> {
  factory $WorkoutProgramCopyWith(
          WorkoutProgram value, $Res Function(WorkoutProgram) then) =
      _$WorkoutProgramCopyWithImpl<$Res, WorkoutProgram>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      Difficulty difficulty,
      Goal goal,
      int durationWeeks,
      int sessionsPerWeek,
      List<WorkoutTemplate> templates,
      bool isBuiltIn,
      DateTime createdAt});
}

/// @nodoc
class _$WorkoutProgramCopyWithImpl<$Res, $Val extends WorkoutProgram>
    implements $WorkoutProgramCopyWith<$Res> {
  _$WorkoutProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? difficulty = null,
    Object? goal = null,
    Object? durationWeeks = null,
    Object? sessionsPerWeek = null,
    Object? templates = null,
    Object? isBuiltIn = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as Goal,
      durationWeeks: null == durationWeeks
          ? _value.durationWeeks
          : durationWeeks // ignore: cast_nullable_to_non_nullable
              as int,
      sessionsPerWeek: null == sessionsPerWeek
          ? _value.sessionsPerWeek
          : sessionsPerWeek // ignore: cast_nullable_to_non_nullable
              as int,
      templates: null == templates
          ? _value.templates
          : templates // ignore: cast_nullable_to_non_nullable
              as List<WorkoutTemplate>,
      isBuiltIn: null == isBuiltIn
          ? _value.isBuiltIn
          : isBuiltIn // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutProgramImplCopyWith<$Res>
    implements $WorkoutProgramCopyWith<$Res> {
  factory _$$WorkoutProgramImplCopyWith(_$WorkoutProgramImpl value,
          $Res Function(_$WorkoutProgramImpl) then) =
      __$$WorkoutProgramImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      Difficulty difficulty,
      Goal goal,
      int durationWeeks,
      int sessionsPerWeek,
      List<WorkoutTemplate> templates,
      bool isBuiltIn,
      DateTime createdAt});
}

/// @nodoc
class __$$WorkoutProgramImplCopyWithImpl<$Res>
    extends _$WorkoutProgramCopyWithImpl<$Res, _$WorkoutProgramImpl>
    implements _$$WorkoutProgramImplCopyWith<$Res> {
  __$$WorkoutProgramImplCopyWithImpl(
      _$WorkoutProgramImpl _value, $Res Function(_$WorkoutProgramImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? difficulty = null,
    Object? goal = null,
    Object? durationWeeks = null,
    Object? sessionsPerWeek = null,
    Object? templates = null,
    Object? isBuiltIn = null,
    Object? createdAt = null,
  }) {
    return _then(_$WorkoutProgramImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as Goal,
      durationWeeks: null == durationWeeks
          ? _value.durationWeeks
          : durationWeeks // ignore: cast_nullable_to_non_nullable
              as int,
      sessionsPerWeek: null == sessionsPerWeek
          ? _value.sessionsPerWeek
          : sessionsPerWeek // ignore: cast_nullable_to_non_nullable
              as int,
      templates: null == templates
          ? _value._templates
          : templates // ignore: cast_nullable_to_non_nullable
              as List<WorkoutTemplate>,
      isBuiltIn: null == isBuiltIn
          ? _value.isBuiltIn
          : isBuiltIn // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkoutProgramImpl implements _WorkoutProgram {
  const _$WorkoutProgramImpl(
      {required this.id,
      required this.name,
      this.description,
      this.difficulty = Difficulty.intermediate,
      this.goal = Goal.muscleGain,
      this.durationWeeks = 4,
      this.sessionsPerWeek = 4,
      final List<WorkoutTemplate> templates = const [],
      this.isBuiltIn = false,
      required this.createdAt})
      : _templates = templates;

  factory _$WorkoutProgramImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutProgramImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey()
  final Difficulty difficulty;
  @override
  @JsonKey()
  final Goal goal;
  @override
  @JsonKey()
  final int durationWeeks;
  @override
  @JsonKey()
  final int sessionsPerWeek;
  final List<WorkoutTemplate> _templates;
  @override
  @JsonKey()
  List<WorkoutTemplate> get templates {
    if (_templates is EqualUnmodifiableListView) return _templates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_templates);
  }

  @override
  @JsonKey()
  final bool isBuiltIn;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'WorkoutProgram(id: $id, name: $name, description: $description, difficulty: $difficulty, goal: $goal, durationWeeks: $durationWeeks, sessionsPerWeek: $sessionsPerWeek, templates: $templates, isBuiltIn: $isBuiltIn, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutProgramImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.goal, goal) || other.goal == goal) &&
            (identical(other.durationWeeks, durationWeeks) ||
                other.durationWeeks == durationWeeks) &&
            (identical(other.sessionsPerWeek, sessionsPerWeek) ||
                other.sessionsPerWeek == sessionsPerWeek) &&
            const DeepCollectionEquality()
                .equals(other._templates, _templates) &&
            (identical(other.isBuiltIn, isBuiltIn) ||
                other.isBuiltIn == isBuiltIn) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      difficulty,
      goal,
      durationWeeks,
      sessionsPerWeek,
      const DeepCollectionEquality().hash(_templates),
      isBuiltIn,
      createdAt);

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutProgramImplCopyWith<_$WorkoutProgramImpl> get copyWith =>
      __$$WorkoutProgramImplCopyWithImpl<_$WorkoutProgramImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutProgramImplToJson(
      this,
    );
  }
}

abstract class _WorkoutProgram implements WorkoutProgram {
  const factory _WorkoutProgram(
      {required final String id,
      required final String name,
      final String? description,
      final Difficulty difficulty,
      final Goal goal,
      final int durationWeeks,
      final int sessionsPerWeek,
      final List<WorkoutTemplate> templates,
      final bool isBuiltIn,
      required final DateTime createdAt}) = _$WorkoutProgramImpl;

  factory _WorkoutProgram.fromJson(Map<String, dynamic> json) =
      _$WorkoutProgramImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  Difficulty get difficulty;
  @override
  Goal get goal;
  @override
  int get durationWeeks;
  @override
  int get sessionsPerWeek;
  @override
  List<WorkoutTemplate> get templates;
  @override
  bool get isBuiltIn;
  @override
  DateTime get createdAt;

  /// Create a copy of WorkoutProgram
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutProgramImplCopyWith<_$WorkoutProgramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
