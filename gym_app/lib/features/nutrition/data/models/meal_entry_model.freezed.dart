// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealEntryModel _$MealEntryModelFromJson(Map<String, dynamic> json) {
  return _MealEntryModel.fromJson(json);
}

/// @nodoc
mixin _$MealEntryModel {
  String get mealId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp get date => throw _privateConstructorUsedError;
  String get mealType => throw _privateConstructorUsedError;
  List<MealFoodItemModel> get foods => throw _privateConstructorUsedError;
  double get totalCalories => throw _privateConstructorUsedError;
  double get totalProtein => throw _privateConstructorUsedError;
  double get totalCarbs => throw _privateConstructorUsedError;
  double get totalFat => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MealEntryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealEntryModelCopyWith<MealEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealEntryModelCopyWith<$Res> {
  factory $MealEntryModelCopyWith(
          MealEntryModel value, $Res Function(MealEntryModel) then) =
      _$MealEntryModelCopyWithImpl<$Res, MealEntryModel>;
  @useResult
  $Res call(
      {String mealId,
      String userId,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp date,
      String mealType,
      List<MealFoodItemModel> foods,
      double totalCalories,
      double totalProtein,
      double totalCarbs,
      double totalFat,
      String? imageUrl,
      String? notes,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp createdAt});
}

/// @nodoc
class _$MealEntryModelCopyWithImpl<$Res, $Val extends MealEntryModel>
    implements $MealEntryModelCopyWith<$Res> {
  _$MealEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealId = null,
    Object? userId = null,
    Object? date = null,
    Object? mealType = null,
    Object? foods = null,
    Object? totalCalories = null,
    Object? totalProtein = null,
    Object? totalCarbs = null,
    Object? totalFat = null,
    Object? imageUrl = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      mealId: null == mealId
          ? _value.mealId
          : mealId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String,
      foods: null == foods
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<MealFoodItemModel>,
      totalCalories: null == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as double,
      totalProtein: null == totalProtein
          ? _value.totalProtein
          : totalProtein // ignore: cast_nullable_to_non_nullable
              as double,
      totalCarbs: null == totalCarbs
          ? _value.totalCarbs
          : totalCarbs // ignore: cast_nullable_to_non_nullable
              as double,
      totalFat: null == totalFat
          ? _value.totalFat
          : totalFat // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealEntryModelImplCopyWith<$Res>
    implements $MealEntryModelCopyWith<$Res> {
  factory _$$MealEntryModelImplCopyWith(_$MealEntryModelImpl value,
          $Res Function(_$MealEntryModelImpl) then) =
      __$$MealEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mealId,
      String userId,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp date,
      String mealType,
      List<MealFoodItemModel> foods,
      double totalCalories,
      double totalProtein,
      double totalCarbs,
      double totalFat,
      String? imageUrl,
      String? notes,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp createdAt});
}

/// @nodoc
class __$$MealEntryModelImplCopyWithImpl<$Res>
    extends _$MealEntryModelCopyWithImpl<$Res, _$MealEntryModelImpl>
    implements _$$MealEntryModelImplCopyWith<$Res> {
  __$$MealEntryModelImplCopyWithImpl(
      _$MealEntryModelImpl _value, $Res Function(_$MealEntryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealId = null,
    Object? userId = null,
    Object? date = null,
    Object? mealType = null,
    Object? foods = null,
    Object? totalCalories = null,
    Object? totalProtein = null,
    Object? totalCarbs = null,
    Object? totalFat = null,
    Object? imageUrl = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$MealEntryModelImpl(
      mealId: null == mealId
          ? _value.mealId
          : mealId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String,
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<MealFoodItemModel>,
      totalCalories: null == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as double,
      totalProtein: null == totalProtein
          ? _value.totalProtein
          : totalProtein // ignore: cast_nullable_to_non_nullable
              as double,
      totalCarbs: null == totalCarbs
          ? _value.totalCarbs
          : totalCarbs // ignore: cast_nullable_to_non_nullable
              as double,
      totalFat: null == totalFat
          ? _value.totalFat
          : totalFat // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealEntryModelImpl implements _MealEntryModel {
  const _$MealEntryModelImpl(
      {required this.mealId,
      required this.userId,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required this.date,
      required this.mealType,
      final List<MealFoodItemModel> foods = const [],
      this.totalCalories = 0,
      this.totalProtein = 0,
      this.totalCarbs = 0,
      this.totalFat = 0,
      this.imageUrl,
      this.notes,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required this.createdAt})
      : _foods = foods;

  factory _$MealEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealEntryModelImplFromJson(json);

  @override
  final String mealId;
  @override
  final String userId;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  final Timestamp date;
  @override
  final String mealType;
  final List<MealFoodItemModel> _foods;
  @override
  @JsonKey()
  List<MealFoodItemModel> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  @override
  @JsonKey()
  final double totalCalories;
  @override
  @JsonKey()
  final double totalProtein;
  @override
  @JsonKey()
  final double totalCarbs;
  @override
  @JsonKey()
  final double totalFat;
  @override
  final String? imageUrl;
  @override
  final String? notes;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  final Timestamp createdAt;

  @override
  String toString() {
    return 'MealEntryModel(mealId: $mealId, userId: $userId, date: $date, mealType: $mealType, foods: $foods, totalCalories: $totalCalories, totalProtein: $totalProtein, totalCarbs: $totalCarbs, totalFat: $totalFat, imageUrl: $imageUrl, notes: $notes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealEntryModelImpl &&
            (identical(other.mealId, mealId) || other.mealId == mealId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType) &&
            const DeepCollectionEquality().equals(other._foods, _foods) &&
            (identical(other.totalCalories, totalCalories) ||
                other.totalCalories == totalCalories) &&
            (identical(other.totalProtein, totalProtein) ||
                other.totalProtein == totalProtein) &&
            (identical(other.totalCarbs, totalCarbs) ||
                other.totalCarbs == totalCarbs) &&
            (identical(other.totalFat, totalFat) ||
                other.totalFat == totalFat) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      mealId,
      userId,
      date,
      mealType,
      const DeepCollectionEquality().hash(_foods),
      totalCalories,
      totalProtein,
      totalCarbs,
      totalFat,
      imageUrl,
      notes,
      createdAt);

  /// Create a copy of MealEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealEntryModelImplCopyWith<_$MealEntryModelImpl> get copyWith =>
      __$$MealEntryModelImplCopyWithImpl<_$MealEntryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealEntryModelImplToJson(
      this,
    );
  }
}

abstract class _MealEntryModel implements MealEntryModel {
  const factory _MealEntryModel(
      {required final String mealId,
      required final String userId,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required final Timestamp date,
      required final String mealType,
      final List<MealFoodItemModel> foods,
      final double totalCalories,
      final double totalProtein,
      final double totalCarbs,
      final double totalFat,
      final String? imageUrl,
      final String? notes,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required final Timestamp createdAt}) = _$MealEntryModelImpl;

  factory _MealEntryModel.fromJson(Map<String, dynamic> json) =
      _$MealEntryModelImpl.fromJson;

  @override
  String get mealId;
  @override
  String get userId;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp get date;
  @override
  String get mealType;
  @override
  List<MealFoodItemModel> get foods;
  @override
  double get totalCalories;
  @override
  double get totalProtein;
  @override
  double get totalCarbs;
  @override
  double get totalFat;
  @override
  String? get imageUrl;
  @override
  String? get notes;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp get createdAt;

  /// Create a copy of MealEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealEntryModelImplCopyWith<_$MealEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
