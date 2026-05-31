// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_food_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealFoodItemModel _$MealFoodItemModelFromJson(Map<String, dynamic> json) {
  return _MealFoodItemModel.fromJson(json);
}

/// @nodoc
mixin _$MealFoodItemModel {
  FoodItemModel get foodItem => throw _privateConstructorUsedError;
  double get quantityG => throw _privateConstructorUsedError;

  /// Serializes this MealFoodItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealFoodItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealFoodItemModelCopyWith<MealFoodItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealFoodItemModelCopyWith<$Res> {
  factory $MealFoodItemModelCopyWith(
          MealFoodItemModel value, $Res Function(MealFoodItemModel) then) =
      _$MealFoodItemModelCopyWithImpl<$Res, MealFoodItemModel>;
  @useResult
  $Res call({FoodItemModel foodItem, double quantityG});

  $FoodItemModelCopyWith<$Res> get foodItem;
}

/// @nodoc
class _$MealFoodItemModelCopyWithImpl<$Res, $Val extends MealFoodItemModel>
    implements $MealFoodItemModelCopyWith<$Res> {
  _$MealFoodItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealFoodItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodItem = null,
    Object? quantityG = null,
  }) {
    return _then(_value.copyWith(
      foodItem: null == foodItem
          ? _value.foodItem
          : foodItem // ignore: cast_nullable_to_non_nullable
              as FoodItemModel,
      quantityG: null == quantityG
          ? _value.quantityG
          : quantityG // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of MealFoodItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FoodItemModelCopyWith<$Res> get foodItem {
    return $FoodItemModelCopyWith<$Res>(_value.foodItem, (value) {
      return _then(_value.copyWith(foodItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MealFoodItemModelImplCopyWith<$Res>
    implements $MealFoodItemModelCopyWith<$Res> {
  factory _$$MealFoodItemModelImplCopyWith(_$MealFoodItemModelImpl value,
          $Res Function(_$MealFoodItemModelImpl) then) =
      __$$MealFoodItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FoodItemModel foodItem, double quantityG});

  @override
  $FoodItemModelCopyWith<$Res> get foodItem;
}

/// @nodoc
class __$$MealFoodItemModelImplCopyWithImpl<$Res>
    extends _$MealFoodItemModelCopyWithImpl<$Res, _$MealFoodItemModelImpl>
    implements _$$MealFoodItemModelImplCopyWith<$Res> {
  __$$MealFoodItemModelImplCopyWithImpl(_$MealFoodItemModelImpl _value,
      $Res Function(_$MealFoodItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealFoodItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodItem = null,
    Object? quantityG = null,
  }) {
    return _then(_$MealFoodItemModelImpl(
      foodItem: null == foodItem
          ? _value.foodItem
          : foodItem // ignore: cast_nullable_to_non_nullable
              as FoodItemModel,
      quantityG: null == quantityG
          ? _value.quantityG
          : quantityG // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealFoodItemModelImpl implements _MealFoodItemModel {
  const _$MealFoodItemModelImpl(
      {required this.foodItem, required this.quantityG});

  factory _$MealFoodItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealFoodItemModelImplFromJson(json);

  @override
  final FoodItemModel foodItem;
  @override
  final double quantityG;

  @override
  String toString() {
    return 'MealFoodItemModel(foodItem: $foodItem, quantityG: $quantityG)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealFoodItemModelImpl &&
            (identical(other.foodItem, foodItem) ||
                other.foodItem == foodItem) &&
            (identical(other.quantityG, quantityG) ||
                other.quantityG == quantityG));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, foodItem, quantityG);

  /// Create a copy of MealFoodItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealFoodItemModelImplCopyWith<_$MealFoodItemModelImpl> get copyWith =>
      __$$MealFoodItemModelImplCopyWithImpl<_$MealFoodItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealFoodItemModelImplToJson(
      this,
    );
  }
}

abstract class _MealFoodItemModel implements MealFoodItemModel {
  const factory _MealFoodItemModel(
      {required final FoodItemModel foodItem,
      required final double quantityG}) = _$MealFoodItemModelImpl;

  factory _MealFoodItemModel.fromJson(Map<String, dynamic> json) =
      _$MealFoodItemModelImpl.fromJson;

  @override
  FoodItemModel get foodItem;
  @override
  double get quantityG;

  /// Create a copy of MealFoodItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealFoodItemModelImplCopyWith<_$MealFoodItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
