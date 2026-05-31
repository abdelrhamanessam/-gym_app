// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodLogModel _$FoodLogModelFromJson(Map<String, dynamic> json) {
  return _FoodLogModel.fromJson(json);
}

/// @nodoc
mixin _$FoodLogModel {
  String get logId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  FoodItemModel get foodItem => throw _privateConstructorUsedError;
  double get quantityG => throw _privateConstructorUsedError;
  String get mealType => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp get date => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FoodLogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodLogModelCopyWith<FoodLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodLogModelCopyWith<$Res> {
  factory $FoodLogModelCopyWith(
          FoodLogModel value, $Res Function(FoodLogModel) then) =
      _$FoodLogModelCopyWithImpl<$Res, FoodLogModel>;
  @useResult
  $Res call(
      {String logId,
      String userId,
      FoodItemModel foodItem,
      double quantityG,
      String mealType,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp date,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp createdAt});

  $FoodItemModelCopyWith<$Res> get foodItem;
}

/// @nodoc
class _$FoodLogModelCopyWithImpl<$Res, $Val extends FoodLogModel>
    implements $FoodLogModelCopyWith<$Res> {
  _$FoodLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logId = null,
    Object? userId = null,
    Object? foodItem = null,
    Object? quantityG = null,
    Object? mealType = null,
    Object? date = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      logId: null == logId
          ? _value.logId
          : logId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      foodItem: null == foodItem
          ? _value.foodItem
          : foodItem // ignore: cast_nullable_to_non_nullable
              as FoodItemModel,
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
              as Timestamp,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }

  /// Create a copy of FoodLogModel
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
abstract class _$$FoodLogModelImplCopyWith<$Res>
    implements $FoodLogModelCopyWith<$Res> {
  factory _$$FoodLogModelImplCopyWith(
          _$FoodLogModelImpl value, $Res Function(_$FoodLogModelImpl) then) =
      __$$FoodLogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String logId,
      String userId,
      FoodItemModel foodItem,
      double quantityG,
      String mealType,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp date,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp createdAt});

  @override
  $FoodItemModelCopyWith<$Res> get foodItem;
}

/// @nodoc
class __$$FoodLogModelImplCopyWithImpl<$Res>
    extends _$FoodLogModelCopyWithImpl<$Res, _$FoodLogModelImpl>
    implements _$$FoodLogModelImplCopyWith<$Res> {
  __$$FoodLogModelImplCopyWithImpl(
      _$FoodLogModelImpl _value, $Res Function(_$FoodLogModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logId = null,
    Object? userId = null,
    Object? foodItem = null,
    Object? quantityG = null,
    Object? mealType = null,
    Object? date = null,
    Object? createdAt = null,
  }) {
    return _then(_$FoodLogModelImpl(
      logId: null == logId
          ? _value.logId
          : logId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      foodItem: null == foodItem
          ? _value.foodItem
          : foodItem // ignore: cast_nullable_to_non_nullable
              as FoodItemModel,
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
              as Timestamp,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodLogModelImpl implements _FoodLogModel {
  const _$FoodLogModelImpl(
      {required this.logId,
      required this.userId,
      required this.foodItem,
      required this.quantityG,
      required this.mealType,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required this.date,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required this.createdAt});

  factory _$FoodLogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodLogModelImplFromJson(json);

  @override
  final String logId;
  @override
  final String userId;
  @override
  final FoodItemModel foodItem;
  @override
  final double quantityG;
  @override
  final String mealType;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  final Timestamp date;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  final Timestamp createdAt;

  @override
  String toString() {
    return 'FoodLogModel(logId: $logId, userId: $userId, foodItem: $foodItem, quantityG: $quantityG, mealType: $mealType, date: $date, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodLogModelImpl &&
            (identical(other.logId, logId) || other.logId == logId) &&
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
  int get hashCode => Object.hash(runtimeType, logId, userId, foodItem,
      quantityG, mealType, date, createdAt);

  /// Create a copy of FoodLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodLogModelImplCopyWith<_$FoodLogModelImpl> get copyWith =>
      __$$FoodLogModelImplCopyWithImpl<_$FoodLogModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodLogModelImplToJson(
      this,
    );
  }
}

abstract class _FoodLogModel implements FoodLogModel {
  const factory _FoodLogModel(
      {required final String logId,
      required final String userId,
      required final FoodItemModel foodItem,
      required final double quantityG,
      required final String mealType,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required final Timestamp date,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required final Timestamp createdAt}) = _$FoodLogModelImpl;

  factory _FoodLogModel.fromJson(Map<String, dynamic> json) =
      _$FoodLogModelImpl.fromJson;

  @override
  String get logId;
  @override
  String get userId;
  @override
  FoodItemModel get foodItem;
  @override
  double get quantityG;
  @override
  String get mealType;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp get date;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp get createdAt;

  /// Create a copy of FoodLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodLogModelImplCopyWith<_$FoodLogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
