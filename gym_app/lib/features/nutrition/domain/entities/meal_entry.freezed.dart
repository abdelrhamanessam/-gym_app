// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealEntry _$MealEntryFromJson(Map<String, dynamic> json) {
  return _MealEntry.fromJson(json);
}

/// @nodoc
mixin _$MealEntry {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  MealType get mealType => throw _privateConstructorUsedError;
  List<MealFoodItem> get foods => throw _privateConstructorUsedError;
  double get totalCalories => throw _privateConstructorUsedError;
  double get totalProtein => throw _privateConstructorUsedError;
  double get totalCarbs => throw _privateConstructorUsedError;
  double get totalFat => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MealEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealEntryCopyWith<MealEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealEntryCopyWith<$Res> {
  factory $MealEntryCopyWith(MealEntry value, $Res Function(MealEntry) then) =
      _$MealEntryCopyWithImpl<$Res, MealEntry>;
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime date,
      MealType mealType,
      List<MealFoodItem> foods,
      double totalCalories,
      double totalProtein,
      double totalCarbs,
      double totalFat,
      String? imageUrl,
      String? notes,
      DateTime createdAt});
}

/// @nodoc
class _$MealEntryCopyWithImpl<$Res, $Val extends MealEntry>
    implements $MealEntryCopyWith<$Res> {
  _$MealEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as MealType,
      foods: null == foods
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<MealFoodItem>,
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
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealEntryImplCopyWith<$Res>
    implements $MealEntryCopyWith<$Res> {
  factory _$$MealEntryImplCopyWith(
          _$MealEntryImpl value, $Res Function(_$MealEntryImpl) then) =
      __$$MealEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime date,
      MealType mealType,
      List<MealFoodItem> foods,
      double totalCalories,
      double totalProtein,
      double totalCarbs,
      double totalFat,
      String? imageUrl,
      String? notes,
      DateTime createdAt});
}

/// @nodoc
class __$$MealEntryImplCopyWithImpl<$Res>
    extends _$MealEntryCopyWithImpl<$Res, _$MealEntryImpl>
    implements _$$MealEntryImplCopyWith<$Res> {
  __$$MealEntryImplCopyWithImpl(
      _$MealEntryImpl _value, $Res Function(_$MealEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
    return _then(_$MealEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as MealType,
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<MealFoodItem>,
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
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealEntryImpl implements _MealEntry {
  const _$MealEntryImpl(
      {required this.id,
      required this.userId,
      required this.date,
      required this.mealType,
      final List<MealFoodItem> foods = const [],
      this.totalCalories = 0,
      this.totalProtein = 0,
      this.totalCarbs = 0,
      this.totalFat = 0,
      this.imageUrl,
      this.notes,
      required this.createdAt})
      : _foods = foods;

  factory _$MealEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime date;
  @override
  final MealType mealType;
  final List<MealFoodItem> _foods;
  @override
  @JsonKey()
  List<MealFoodItem> get foods {
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
  final DateTime createdAt;

  @override
  String toString() {
    return 'MealEntry(id: $id, userId: $userId, date: $date, mealType: $mealType, foods: $foods, totalCalories: $totalCalories, totalProtein: $totalProtein, totalCarbs: $totalCarbs, totalFat: $totalFat, imageUrl: $imageUrl, notes: $notes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
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
      id,
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

  /// Create a copy of MealEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealEntryImplCopyWith<_$MealEntryImpl> get copyWith =>
      __$$MealEntryImplCopyWithImpl<_$MealEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealEntryImplToJson(
      this,
    );
  }
}

abstract class _MealEntry implements MealEntry {
  const factory _MealEntry(
      {required final String id,
      required final String userId,
      required final DateTime date,
      required final MealType mealType,
      final List<MealFoodItem> foods,
      final double totalCalories,
      final double totalProtein,
      final double totalCarbs,
      final double totalFat,
      final String? imageUrl,
      final String? notes,
      required final DateTime createdAt}) = _$MealEntryImpl;

  factory _MealEntry.fromJson(Map<String, dynamic> json) =
      _$MealEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get date;
  @override
  MealType get mealType;
  @override
  List<MealFoodItem> get foods;
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
  DateTime get createdAt;

  /// Create a copy of MealEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealEntryImplCopyWith<_$MealEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
