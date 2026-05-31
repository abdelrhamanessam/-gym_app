// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_goals.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NutritionGoals _$NutritionGoalsFromJson(Map<String, dynamic> json) {
  return _NutritionGoals.fromJson(json);
}

/// @nodoc
mixin _$NutritionGoals {
  int get dailyCalories => throw _privateConstructorUsedError;
  int get dailyProtein => throw _privateConstructorUsedError;
  int get dailyCarbs => throw _privateConstructorUsedError;
  int get dailyFat => throw _privateConstructorUsedError;
  double get dailyWaterMl => throw _privateConstructorUsedError;

  /// Serializes this NutritionGoals to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutritionGoals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionGoalsCopyWith<NutritionGoals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionGoalsCopyWith<$Res> {
  factory $NutritionGoalsCopyWith(
          NutritionGoals value, $Res Function(NutritionGoals) then) =
      _$NutritionGoalsCopyWithImpl<$Res, NutritionGoals>;
  @useResult
  $Res call(
      {int dailyCalories,
      int dailyProtein,
      int dailyCarbs,
      int dailyFat,
      double dailyWaterMl});
}

/// @nodoc
class _$NutritionGoalsCopyWithImpl<$Res, $Val extends NutritionGoals>
    implements $NutritionGoalsCopyWith<$Res> {
  _$NutritionGoalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionGoals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyCalories = null,
    Object? dailyProtein = null,
    Object? dailyCarbs = null,
    Object? dailyFat = null,
    Object? dailyWaterMl = null,
  }) {
    return _then(_value.copyWith(
      dailyCalories: null == dailyCalories
          ? _value.dailyCalories
          : dailyCalories // ignore: cast_nullable_to_non_nullable
              as int,
      dailyProtein: null == dailyProtein
          ? _value.dailyProtein
          : dailyProtein // ignore: cast_nullable_to_non_nullable
              as int,
      dailyCarbs: null == dailyCarbs
          ? _value.dailyCarbs
          : dailyCarbs // ignore: cast_nullable_to_non_nullable
              as int,
      dailyFat: null == dailyFat
          ? _value.dailyFat
          : dailyFat // ignore: cast_nullable_to_non_nullable
              as int,
      dailyWaterMl: null == dailyWaterMl
          ? _value.dailyWaterMl
          : dailyWaterMl // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutritionGoalsImplCopyWith<$Res>
    implements $NutritionGoalsCopyWith<$Res> {
  factory _$$NutritionGoalsImplCopyWith(_$NutritionGoalsImpl value,
          $Res Function(_$NutritionGoalsImpl) then) =
      __$$NutritionGoalsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int dailyCalories,
      int dailyProtein,
      int dailyCarbs,
      int dailyFat,
      double dailyWaterMl});
}

/// @nodoc
class __$$NutritionGoalsImplCopyWithImpl<$Res>
    extends _$NutritionGoalsCopyWithImpl<$Res, _$NutritionGoalsImpl>
    implements _$$NutritionGoalsImplCopyWith<$Res> {
  __$$NutritionGoalsImplCopyWithImpl(
      _$NutritionGoalsImpl _value, $Res Function(_$NutritionGoalsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionGoals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyCalories = null,
    Object? dailyProtein = null,
    Object? dailyCarbs = null,
    Object? dailyFat = null,
    Object? dailyWaterMl = null,
  }) {
    return _then(_$NutritionGoalsImpl(
      dailyCalories: null == dailyCalories
          ? _value.dailyCalories
          : dailyCalories // ignore: cast_nullable_to_non_nullable
              as int,
      dailyProtein: null == dailyProtein
          ? _value.dailyProtein
          : dailyProtein // ignore: cast_nullable_to_non_nullable
              as int,
      dailyCarbs: null == dailyCarbs
          ? _value.dailyCarbs
          : dailyCarbs // ignore: cast_nullable_to_non_nullable
              as int,
      dailyFat: null == dailyFat
          ? _value.dailyFat
          : dailyFat // ignore: cast_nullable_to_non_nullable
              as int,
      dailyWaterMl: null == dailyWaterMl
          ? _value.dailyWaterMl
          : dailyWaterMl // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionGoalsImpl implements _NutritionGoals {
  const _$NutritionGoalsImpl(
      {required this.dailyCalories,
      required this.dailyProtein,
      required this.dailyCarbs,
      required this.dailyFat,
      required this.dailyWaterMl});

  factory _$NutritionGoalsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionGoalsImplFromJson(json);

  @override
  final int dailyCalories;
  @override
  final int dailyProtein;
  @override
  final int dailyCarbs;
  @override
  final int dailyFat;
  @override
  final double dailyWaterMl;

  @override
  String toString() {
    return 'NutritionGoals(dailyCalories: $dailyCalories, dailyProtein: $dailyProtein, dailyCarbs: $dailyCarbs, dailyFat: $dailyFat, dailyWaterMl: $dailyWaterMl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionGoalsImpl &&
            (identical(other.dailyCalories, dailyCalories) ||
                other.dailyCalories == dailyCalories) &&
            (identical(other.dailyProtein, dailyProtein) ||
                other.dailyProtein == dailyProtein) &&
            (identical(other.dailyCarbs, dailyCarbs) ||
                other.dailyCarbs == dailyCarbs) &&
            (identical(other.dailyFat, dailyFat) ||
                other.dailyFat == dailyFat) &&
            (identical(other.dailyWaterMl, dailyWaterMl) ||
                other.dailyWaterMl == dailyWaterMl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dailyCalories, dailyProtein,
      dailyCarbs, dailyFat, dailyWaterMl);

  /// Create a copy of NutritionGoals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionGoalsImplCopyWith<_$NutritionGoalsImpl> get copyWith =>
      __$$NutritionGoalsImplCopyWithImpl<_$NutritionGoalsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionGoalsImplToJson(
      this,
    );
  }
}

abstract class _NutritionGoals implements NutritionGoals {
  const factory _NutritionGoals(
      {required final int dailyCalories,
      required final int dailyProtein,
      required final int dailyCarbs,
      required final int dailyFat,
      required final double dailyWaterMl}) = _$NutritionGoalsImpl;

  factory _NutritionGoals.fromJson(Map<String, dynamic> json) =
      _$NutritionGoalsImpl.fromJson;

  @override
  int get dailyCalories;
  @override
  int get dailyProtein;
  @override
  int get dailyCarbs;
  @override
  int get dailyFat;
  @override
  double get dailyWaterMl;

  /// Create a copy of NutritionGoals
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionGoalsImplCopyWith<_$NutritionGoalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
