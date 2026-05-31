// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_goals_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NutritionGoalsModel _$NutritionGoalsModelFromJson(Map<String, dynamic> json) {
  return _NutritionGoalsModel.fromJson(json);
}

/// @nodoc
mixin _$NutritionGoalsModel {
  int get dailyCalories => throw _privateConstructorUsedError;
  int get dailyProtein => throw _privateConstructorUsedError;
  int get dailyCarbs => throw _privateConstructorUsedError;
  int get dailyFat => throw _privateConstructorUsedError;
  double get dailyWaterMl => throw _privateConstructorUsedError;

  /// Serializes this NutritionGoalsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutritionGoalsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionGoalsModelCopyWith<NutritionGoalsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionGoalsModelCopyWith<$Res> {
  factory $NutritionGoalsModelCopyWith(
          NutritionGoalsModel value, $Res Function(NutritionGoalsModel) then) =
      _$NutritionGoalsModelCopyWithImpl<$Res, NutritionGoalsModel>;
  @useResult
  $Res call(
      {int dailyCalories,
      int dailyProtein,
      int dailyCarbs,
      int dailyFat,
      double dailyWaterMl});
}

/// @nodoc
class _$NutritionGoalsModelCopyWithImpl<$Res, $Val extends NutritionGoalsModel>
    implements $NutritionGoalsModelCopyWith<$Res> {
  _$NutritionGoalsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionGoalsModel
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
abstract class _$$NutritionGoalsModelImplCopyWith<$Res>
    implements $NutritionGoalsModelCopyWith<$Res> {
  factory _$$NutritionGoalsModelImplCopyWith(_$NutritionGoalsModelImpl value,
          $Res Function(_$NutritionGoalsModelImpl) then) =
      __$$NutritionGoalsModelImplCopyWithImpl<$Res>;
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
class __$$NutritionGoalsModelImplCopyWithImpl<$Res>
    extends _$NutritionGoalsModelCopyWithImpl<$Res, _$NutritionGoalsModelImpl>
    implements _$$NutritionGoalsModelImplCopyWith<$Res> {
  __$$NutritionGoalsModelImplCopyWithImpl(_$NutritionGoalsModelImpl _value,
      $Res Function(_$NutritionGoalsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionGoalsModel
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
    return _then(_$NutritionGoalsModelImpl(
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
class _$NutritionGoalsModelImpl implements _NutritionGoalsModel {
  const _$NutritionGoalsModelImpl(
      {required this.dailyCalories,
      required this.dailyProtein,
      required this.dailyCarbs,
      required this.dailyFat,
      required this.dailyWaterMl});

  factory _$NutritionGoalsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionGoalsModelImplFromJson(json);

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
    return 'NutritionGoalsModel(dailyCalories: $dailyCalories, dailyProtein: $dailyProtein, dailyCarbs: $dailyCarbs, dailyFat: $dailyFat, dailyWaterMl: $dailyWaterMl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionGoalsModelImpl &&
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

  /// Create a copy of NutritionGoalsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionGoalsModelImplCopyWith<_$NutritionGoalsModelImpl> get copyWith =>
      __$$NutritionGoalsModelImplCopyWithImpl<_$NutritionGoalsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionGoalsModelImplToJson(
      this,
    );
  }
}

abstract class _NutritionGoalsModel implements NutritionGoalsModel {
  const factory _NutritionGoalsModel(
      {required final int dailyCalories,
      required final int dailyProtein,
      required final int dailyCarbs,
      required final int dailyFat,
      required final double dailyWaterMl}) = _$NutritionGoalsModelImpl;

  factory _NutritionGoalsModel.fromJson(Map<String, dynamic> json) =
      _$NutritionGoalsModelImpl.fromJson;

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

  /// Create a copy of NutritionGoalsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionGoalsModelImplCopyWith<_$NutritionGoalsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
