// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodLog _$FoodLogFromJson(Map<String, dynamic> json) {
  return _FoodLog.fromJson(json);
}

/// @nodoc
mixin _$FoodLog {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  FoodItem get foodItem => throw _privateConstructorUsedError;
  double get quantityG => throw _privateConstructorUsedError;
  String get mealType => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FoodLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodLogCopyWith<FoodLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodLogCopyWith<$Res> {
  factory $FoodLogCopyWith(FoodLog value, $Res Function(FoodLog) then) =
      _$FoodLogCopyWithImpl<$Res, FoodLog>;
  @useResult
  $Res call(
      {String id,
      String userId,
      FoodItem foodItem,
      double quantityG,
      String mealType,
      DateTime date,
      DateTime createdAt});

  $FoodItemCopyWith<$Res> get foodItem;
}

/// @nodoc
class _$FoodLogCopyWithImpl<$Res, $Val extends FoodLog>
    implements $FoodLogCopyWith<$Res> {
  _$FoodLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? foodItem = null,
    Object? quantityG = null,
    Object? mealType = null,
    Object? date = null,
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
      foodItem: null == foodItem
          ? _value.foodItem
          : foodItem // ignore: cast_nullable_to_non_nullable
              as FoodItem,
      quantityG: null == quantityG
          ? _value.quantityG
          : quantityG // ignore: cast_nullable_to_non_nullable
              as double,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of FoodLog
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
abstract class _$$FoodLogImplCopyWith<$Res> implements $FoodLogCopyWith<$Res> {
  factory _$$FoodLogImplCopyWith(
          _$FoodLogImpl value, $Res Function(_$FoodLogImpl) then) =
      __$$FoodLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      FoodItem foodItem,
      double quantityG,
      String mealType,
      DateTime date,
      DateTime createdAt});

  @override
  $FoodItemCopyWith<$Res> get foodItem;
}

/// @nodoc
class __$$FoodLogImplCopyWithImpl<$Res>
    extends _$FoodLogCopyWithImpl<$Res, _$FoodLogImpl>
    implements _$$FoodLogImplCopyWith<$Res> {
  __$$FoodLogImplCopyWithImpl(
      _$FoodLogImpl _value, $Res Function(_$FoodLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? foodItem = null,
    Object? quantityG = null,
    Object? mealType = null,
    Object? date = null,
    Object? createdAt = null,
  }) {
    return _then(_$FoodLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      foodItem: null == foodItem
          ? _value.foodItem
          : foodItem // ignore: cast_nullable_to_non_nullable
              as FoodItem,
      quantityG: null == quantityG
          ? _value.quantityG
          : quantityG // ignore: cast_nullable_to_non_nullable
              as double,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodLogImpl implements _FoodLog {
  const _$FoodLogImpl(
      {required this.id,
      required this.userId,
      required this.foodItem,
      required this.quantityG,
      required this.mealType,
      required this.date,
      required this.createdAt});

  factory _$FoodLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodLogImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final FoodItem foodItem;
  @override
  final double quantityG;
  @override
  final String mealType;
  @override
  final DateTime date;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'FoodLog(id: $id, userId: $userId, foodItem: $foodItem, quantityG: $quantityG, mealType: $mealType, date: $date, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.foodItem, foodItem) ||
                other.foodItem == foodItem) &&
            (identical(other.quantityG, quantityG) ||
                other.quantityG == quantityG) &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, foodItem, quantityG, mealType, date, createdAt);

  /// Create a copy of FoodLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodLogImplCopyWith<_$FoodLogImpl> get copyWith =>
      __$$FoodLogImplCopyWithImpl<_$FoodLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodLogImplToJson(
      this,
    );
  }
}

abstract class _FoodLog implements FoodLog {
  const factory _FoodLog(
      {required final String id,
      required final String userId,
      required final FoodItem foodItem,
      required final double quantityG,
      required final String mealType,
      required final DateTime date,
      required final DateTime createdAt}) = _$FoodLogImpl;

  factory _FoodLog.fromJson(Map<String, dynamic> json) = _$FoodLogImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  FoodItem get foodItem;
  @override
  double get quantityG;
  @override
  String get mealType;
  @override
  DateTime get date;
  @override
  DateTime get createdAt;

  /// Create a copy of FoodLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodLogImplCopyWith<_$FoodLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
