// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_program_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkoutProgramModel _$WorkoutProgramModelFromJson(Map<String, dynamic> json) {
  return _WorkoutProgramModel.fromJson(json);
}

/// @nodoc
mixin _$WorkoutProgramModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  String get goal => throw _privateConstructorUsedError;
  int get durationWeeks => throw _privateConstructorUsedError;
  int get sessionsPerWeek => throw _privateConstructorUsedError;
  List<WorkoutTemplateModel> get templates =>
      throw _privateConstructorUsedError;
  bool get isBuiltIn => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this WorkoutProgramModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkoutProgramModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkoutProgramModelCopyWith<WorkoutProgramModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutProgramModelCopyWith<$Res> {
  factory $WorkoutProgramModelCopyWith(
          WorkoutProgramModel value, $Res Function(WorkoutProgramModel) then) =
      _$WorkoutProgramModelCopyWithImpl<$Res, WorkoutProgramModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String difficulty,
      String goal,
      int durationWeeks,
      int sessionsPerWeek,
      List<WorkoutTemplateModel> templates,
      bool isBuiltIn,
      String createdAt});
}

/// @nodoc
class _$WorkoutProgramModelCopyWithImpl<$Res, $Val extends WorkoutProgramModel>
    implements $WorkoutProgramModelCopyWith<$Res> {
  _$WorkoutProgramModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkoutProgramModel
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
              as String,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
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
              as List<WorkoutTemplateModel>,
      isBuiltIn: null == isBuiltIn
          ? _value.isBuiltIn
          : isBuiltIn // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkoutProgramModelImplCopyWith<$Res>
    implements $WorkoutProgramModelCopyWith<$Res> {
  factory _$$WorkoutProgramModelImplCopyWith(_$WorkoutProgramModelImpl value,
          $Res Function(_$WorkoutProgramModelImpl) then) =
      __$$WorkoutProgramModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String difficulty,
      String goal,
      int durationWeeks,
      int sessionsPerWeek,
      List<WorkoutTemplateModel> templates,
      bool isBuiltIn,
      String createdAt});
}

/// @nodoc
class __$$WorkoutProgramModelImplCopyWithImpl<$Res>
    extends _$WorkoutProgramModelCopyWithImpl<$Res, _$WorkoutProgramModelImpl>
    implements _$$WorkoutProgramModelImplCopyWith<$Res> {
  __$$WorkoutProgramModelImplCopyWithImpl(_$WorkoutProgramModelImpl _value,
      $Res Function(_$WorkoutProgramModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkoutProgramModel
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
    return _then(_$WorkoutProgramModelImpl(
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
              as String,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
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
              as List<WorkoutTemplateModel>,
      isBuiltIn: null == isBuiltIn
          ? _value.isBuiltIn
          : isBuiltIn // ignore: cast_nullable_to_non_nullable
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
class _$WorkoutProgramModelImpl implements _WorkoutProgramModel {
  const _$WorkoutProgramModelImpl(
      {required this.id,
      required this.name,
      this.description,
      this.difficulty = 'intermediate',
      this.goal = 'muscleGain',
      this.durationWeeks = 4,
      this.sessionsPerWeek = 4,
      final List<WorkoutTemplateModel> templates = const [],
      this.isBuiltIn = false,
      required this.createdAt})
      : _templates = templates;

  factory _$WorkoutProgramModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkoutProgramModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey()
  final String difficulty;
  @override
  @JsonKey()
  final String goal;
  @override
  @JsonKey()
  final int durationWeeks;
  @override
  @JsonKey()
  final int sessionsPerWeek;
  final List<WorkoutTemplateModel> _templates;
  @override
  @JsonKey()
  List<WorkoutTemplateModel> get templates {
    if (_templates is EqualUnmodifiableListView) return _templates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_templates);
  }

  @override
  @JsonKey()
  final bool isBuiltIn;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'WorkoutProgramModel(id: $id, name: $name, description: $description, difficulty: $difficulty, goal: $goal, durationWeeks: $durationWeeks, sessionsPerWeek: $sessionsPerWeek, templates: $templates, isBuiltIn: $isBuiltIn, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkoutProgramModelImpl &&
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

  /// Create a copy of WorkoutProgramModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkoutProgramModelImplCopyWith<_$WorkoutProgramModelImpl> get copyWith =>
      __$$WorkoutProgramModelImplCopyWithImpl<_$WorkoutProgramModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkoutProgramModelImplToJson(
      this,
    );
  }
}

abstract class _WorkoutProgramModel implements WorkoutProgramModel {
  const factory _WorkoutProgramModel(
      {required final String id,
      required final String name,
      final String? description,
      final String difficulty,
      final String goal,
      final int durationWeeks,
      final int sessionsPerWeek,
      final List<WorkoutTemplateModel> templates,
      final bool isBuiltIn,
      required final String createdAt}) = _$WorkoutProgramModelImpl;

  factory _WorkoutProgramModel.fromJson(Map<String, dynamic> json) =
      _$WorkoutProgramModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String get difficulty;
  @override
  String get goal;
  @override
  int get durationWeeks;
  @override
  int get sessionsPerWeek;
  @override
  List<WorkoutTemplateModel> get templates;
  @override
  bool get isBuiltIn;
  @override
  String get createdAt;

  /// Create a copy of WorkoutProgramModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkoutProgramModelImplCopyWith<_$WorkoutProgramModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
