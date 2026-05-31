// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealTemplate _$MealTemplateFromJson(Map<String, dynamic> json) {
  return _MealTemplate.fromJson(json);
}

/// @nodoc
mixin _$MealTemplate {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get mealType => throw _privateConstructorUsedError;
  List<MealTemplateFood> get foods => throw _privateConstructorUsedError;
  double get totalCalories => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MealTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealTemplateCopyWith<MealTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealTemplateCopyWith<$Res> {
  factory $MealTemplateCopyWith(
          MealTemplate value, $Res Function(MealTemplate) then) =
      _$MealTemplateCopyWithImpl<$Res, MealTemplate>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String mealType,
      List<MealTemplateFood> foods,
      double totalCalories,
      DateTime createdAt});
}

/// @nodoc
class _$MealTemplateCopyWithImpl<$Res, $Val extends MealTemplate>
    implements $MealTemplateCopyWith<$Res> {
  _$MealTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? mealType = null,
    Object? foods = null,
    Object? totalCalories = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String,
      foods: null == foods
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<MealTemplateFood>,
      totalCalories: null == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealTemplateImplCopyWith<$Res>
    implements $MealTemplateCopyWith<$Res> {
  factory _$$MealTemplateImplCopyWith(
          _$MealTemplateImpl value, $Res Function(_$MealTemplateImpl) then) =
      __$$MealTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String mealType,
      List<MealTemplateFood> foods,
      double totalCalories,
      DateTime createdAt});
}

/// @nodoc
class __$$MealTemplateImplCopyWithImpl<$Res>
    extends _$MealTemplateCopyWithImpl<$Res, _$MealTemplateImpl>
    implements _$$MealTemplateImplCopyWith<$Res> {
  __$$MealTemplateImplCopyWithImpl(
      _$MealTemplateImpl _value, $Res Function(_$MealTemplateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? mealType = null,
    Object? foods = null,
    Object? totalCalories = null,
    Object? createdAt = null,
  }) {
    return _then(_$MealTemplateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mealType: null == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String,
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<MealTemplateFood>,
      totalCalories: null == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealTemplateImpl implements _MealTemplate {
  const _$MealTemplateImpl(
      {required this.id,
      required this.userId,
      required this.name,
      required this.mealType,
      final List<MealTemplateFood> foods = const [],
      this.totalCalories = 0,
      required this.createdAt})
      : _foods = foods;

  factory _$MealTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealTemplateImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String name;
  @override
  final String mealType;
  final List<MealTemplateFood> _foods;
  @override
  @JsonKey()
  List<MealTemplateFood> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  @override
  @JsonKey()
  final double totalCalories;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'MealTemplate(id: $id, userId: $userId, name: $name, mealType: $mealType, foods: $foods, totalCalories: $totalCalories, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType) &&
            const DeepCollectionEquality().equals(other._foods, _foods) &&
            (identical(other.totalCalories, totalCalories) ||
                other.totalCalories == totalCalories) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, name, mealType,
      const DeepCollectionEquality().hash(_foods), totalCalories, createdAt);

  /// Create a copy of MealTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealTemplateImplCopyWith<_$MealTemplateImpl> get copyWith =>
      __$$MealTemplateImplCopyWithImpl<_$MealTemplateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealTemplateImplToJson(
      this,
    );
  }
}

abstract class _MealTemplate implements MealTemplate {
  const factory _MealTemplate(
      {required final String id,
      required final String userId,
      required final String name,
      required final String mealType,
      final List<MealTemplateFood> foods,
      final double totalCalories,
      required final DateTime createdAt}) = _$MealTemplateImpl;

  factory _MealTemplate.fromJson(Map<String, dynamic> json) =
      _$MealTemplateImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get name;
  @override
  String get mealType;
  @override
  List<MealTemplateFood> get foods;
  @override
  double get totalCalories;
  @override
  DateTime get createdAt;

  /// Create a copy of MealTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealTemplateImplCopyWith<_$MealTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MealTemplateFood _$MealTemplateFoodFromJson(Map<String, dynamic> json) {
  return _MealTemplateFood.fromJson(json);
}

/// @nodoc
mixin _$MealTemplateFood {
  String get foodId => throw _privateConstructorUsedError;
  String get foodName => throw _privateConstructorUsedError;
  double get quantityG => throw _privateConstructorUsedError;

  /// Serializes this MealTemplateFood to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealTemplateFood
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealTemplateFoodCopyWith<MealTemplateFood> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealTemplateFoodCopyWith<$Res> {
  factory $MealTemplateFoodCopyWith(
          MealTemplateFood value, $Res Function(MealTemplateFood) then) =
      _$MealTemplateFoodCopyWithImpl<$Res, MealTemplateFood>;
  @useResult
  $Res call({String foodId, String foodName, double quantityG});
}

/// @nodoc
class _$MealTemplateFoodCopyWithImpl<$Res, $Val extends MealTemplateFood>
    implements $MealTemplateFoodCopyWith<$Res> {
  _$MealTemplateFoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealTemplateFood
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodId = null,
    Object? foodName = null,
    Object? quantityG = null,
  }) {
    return _then(_value.copyWith(
      foodId: null == foodId
          ? _value.foodId
          : foodId // ignore: cast_nullable_to_non_nullable
              as String,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      quantityG: null == quantityG
          ? _value.quantityG
          : quantityG // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealTemplateFoodImplCopyWith<$Res>
    implements $MealTemplateFoodCopyWith<$Res> {
  factory _$$MealTemplateFoodImplCopyWith(_$MealTemplateFoodImpl value,
          $Res Function(_$MealTemplateFoodImpl) then) =
      __$$MealTemplateFoodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String foodId, String foodName, double quantityG});
}

/// @nodoc
class __$$MealTemplateFoodImplCopyWithImpl<$Res>
    extends _$MealTemplateFoodCopyWithImpl<$Res, _$MealTemplateFoodImpl>
    implements _$$MealTemplateFoodImplCopyWith<$Res> {
  __$$MealTemplateFoodImplCopyWithImpl(_$MealTemplateFoodImpl _value,
      $Res Function(_$MealTemplateFoodImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealTemplateFood
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodId = null,
    Object? foodName = null,
    Object? quantityG = null,
  }) {
    return _then(_$MealTemplateFoodImpl(
      foodId: null == foodId
          ? _value.foodId
          : foodId // ignore: cast_nullable_to_non_nullable
              as String,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      quantityG: null == quantityG
          ? _value.quantityG
          : quantityG // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealTemplateFoodImpl implements _MealTemplateFood {
  const _$MealTemplateFoodImpl(
      {required this.foodId, required this.foodName, required this.quantityG});

  factory _$MealTemplateFoodImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealTemplateFoodImplFromJson(json);

  @override
  final String foodId;
  @override
  final String foodName;
  @override
  final double quantityG;

  @override
  String toString() {
    return 'MealTemplateFood(foodId: $foodId, foodName: $foodName, quantityG: $quantityG)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealTemplateFoodImpl &&
            (identical(other.foodId, foodId) || other.foodId == foodId) &&
            (identical(other.foodName, foodName) ||
                other.foodName == foodName) &&
            (identical(other.quantityG, quantityG) ||
                other.quantityG == quantityG));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, foodId, foodName, quantityG);

  /// Create a copy of MealTemplateFood
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealTemplateFoodImplCopyWith<_$MealTemplateFoodImpl> get copyWith =>
      __$$MealTemplateFoodImplCopyWithImpl<_$MealTemplateFoodImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealTemplateFoodImplToJson(
      this,
    );
  }
}

abstract class _MealTemplateFood implements MealTemplateFood {
  const factory _MealTemplateFood(
      {required final String foodId,
      required final String foodName,
      required final double quantityG}) = _$MealTemplateFoodImpl;

  factory _MealTemplateFood.fromJson(Map<String, dynamic> json) =
      _$MealTemplateFoodImpl.fromJson;

  @override
  String get foodId;
  @override
  String get foodName;
  @override
  double get quantityG;

  /// Create a copy of MealTemplateFood
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealTemplateFoodImplCopyWith<_$MealTemplateFoodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
