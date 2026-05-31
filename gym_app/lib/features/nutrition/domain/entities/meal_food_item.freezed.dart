// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_food_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealFoodItem _$MealFoodItemFromJson(Map<String, dynamic> json) {
  return _MealFoodItem.fromJson(json);
}

/// @nodoc
mixin _$MealFoodItem {
  FoodItem get foodItem => throw _privateConstructorUsedError;
  double get quantityG => throw _privateConstructorUsedError;

  /// Serializes this MealFoodItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealFoodItemCopyWith<MealFoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealFoodItemCopyWith<$Res> {
  factory $MealFoodItemCopyWith(
          MealFoodItem value, $Res Function(MealFoodItem) then) =
      _$MealFoodItemCopyWithImpl<$Res, MealFoodItem>;
  @useResult
  $Res call({FoodItem foodItem, double quantityG});

  $FoodItemCopyWith<$Res> get foodItem;
}

/// @nodoc
class _$MealFoodItemCopyWithImpl<$Res, $Val extends MealFoodItem>
    implements $MealFoodItemCopyWith<$Res> {
  _$MealFoodItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealFoodItem
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
              as FoodItem,
      quantityG: null == quantityG
          ? _value.quantityG
          : quantityG // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of MealFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FoodItemCopyWith<$Res> get foodItem {
    return $FoodItemCopyWith<$Res>(_value.foodItem, (value) {
      return _then(_value.copyWith(foodItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MealFoodItemImplCopyWith<$Res>
    implements $MealFoodItemCopyWith<$Res> {
  factory _$$MealFoodItemImplCopyWith(
          _$MealFoodItemImpl value, $Res Function(_$MealFoodItemImpl) then) =
      __$$MealFoodItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FoodItem foodItem, double quantityG});

  @override
  $FoodItemCopyWith<$Res> get foodItem;
}

/// @nodoc
class __$$MealFoodItemImplCopyWithImpl<$Res>
    extends _$MealFoodItemCopyWithImpl<$Res, _$MealFoodItemImpl>
    implements _$$MealFoodItemImplCopyWith<$Res> {
  __$$MealFoodItemImplCopyWithImpl(
      _$MealFoodItemImpl _value, $Res Function(_$MealFoodItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodItem = null,
    Object? quantityG = null,
  }) {
    return _then(_$MealFoodItemImpl(
      foodItem: null == foodItem
          ? _value.foodItem
          : foodItem // ignore: cast_nullable_to_non_nullable
              as FoodItem,
      quantityG: null == quantityG
          ? _value.quantityG
          : quantityG // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealFoodItemImpl extends _MealFoodItem {
  const _$MealFoodItemImpl({required this.foodItem, required this.quantityG})
      : super._();

  factory _$MealFoodItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealFoodItemImplFromJson(json);

  @override
  final FoodItem foodItem;
  @override
  final double quantityG;

  @override
  String toString() {
    return 'MealFoodItem(foodItem: $foodItem, quantityG: $quantityG)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealFoodItemImpl &&
            (identical(other.foodItem, foodItem) ||
                other.foodItem == foodItem) &&
            (identical(other.quantityG, quantityG) ||
                other.quantityG == quantityG));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, foodItem, quantityG);

  /// Create a copy of MealFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealFoodItemImplCopyWith<_$MealFoodItemImpl> get copyWith =>
      __$$MealFoodItemImplCopyWithImpl<_$MealFoodItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealFoodItemImplToJson(
      this,
    );
  }
}

abstract class _MealFoodItem extends MealFoodItem {
  const factory _MealFoodItem(
      {required final FoodItem foodItem,
      required final double quantityG}) = _$MealFoodItemImpl;
  const _MealFoodItem._() : super._();

  factory _MealFoodItem.fromJson(Map<String, dynamic> json) =
      _$MealFoodItemImpl.fromJson;

  @override
  FoodItem get foodItem;
  @override
  double get quantityG;

  /// Create a copy of MealFoodItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealFoodItemImplCopyWith<_$MealFoodItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
