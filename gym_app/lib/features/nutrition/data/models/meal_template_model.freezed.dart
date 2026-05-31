// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealTemplateModel _$MealTemplateModelFromJson(Map<String, dynamic> json) {
  return _MealTemplateModel.fromJson(json);
}

/// @nodoc
mixin _$MealTemplateModel {
  String get templateId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get mealType => throw _privateConstructorUsedError;
  List<MealTemplateFoodModel> get foods => throw _privateConstructorUsedError;
  double get totalCalories => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MealTemplateModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealTemplateModelCopyWith<MealTemplateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealTemplateModelCopyWith<$Res> {
  factory $MealTemplateModelCopyWith(
          MealTemplateModel value, $Res Function(MealTemplateModel) then) =
      _$MealTemplateModelCopyWithImpl<$Res, MealTemplateModel>;
  @useResult
  $Res call(
      {String templateId,
      String userId,
      String name,
      String mealType,
      List<MealTemplateFoodModel> foods,
      double totalCalories,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp createdAt});
}

/// @nodoc
class _$MealTemplateModelCopyWithImpl<$Res, $Val extends MealTemplateModel>
    implements $MealTemplateModelCopyWith<$Res> {
  _$MealTemplateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? userId = null,
    Object? name = null,
    Object? mealType = null,
    Object? foods = null,
    Object? totalCalories = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
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
              as List<MealTemplateFoodModel>,
      totalCalories: null == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealTemplateModelImplCopyWith<$Res>
    implements $MealTemplateModelCopyWith<$Res> {
  factory _$$MealTemplateModelImplCopyWith(_$MealTemplateModelImpl value,
          $Res Function(_$MealTemplateModelImpl) then) =
      __$$MealTemplateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String templateId,
      String userId,
      String name,
      String mealType,
      List<MealTemplateFoodModel> foods,
      double totalCalories,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      Timestamp createdAt});
}

/// @nodoc
class __$$MealTemplateModelImplCopyWithImpl<$Res>
    extends _$MealTemplateModelCopyWithImpl<$Res, _$MealTemplateModelImpl>
    implements _$$MealTemplateModelImplCopyWith<$Res> {
  __$$MealTemplateModelImplCopyWithImpl(_$MealTemplateModelImpl _value,
      $Res Function(_$MealTemplateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? templateId = null,
    Object? userId = null,
    Object? name = null,
    Object? mealType = null,
    Object? foods = null,
    Object? totalCalories = null,
    Object? createdAt = null,
  }) {
    return _then(_$MealTemplateModelImpl(
      templateId: null == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
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
              as List<MealTemplateFoodModel>,
      totalCalories: null == totalCalories
          ? _value.totalCalories
          : totalCalories // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealTemplateModelImpl implements _MealTemplateModel {
  const _$MealTemplateModelImpl(
      {required this.templateId,
      required this.userId,
      required this.name,
      required this.mealType,
      final List<MealTemplateFoodModel> foods = const [],
      this.totalCalories = 0,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required this.createdAt})
      : _foods = foods;

  factory _$MealTemplateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealTemplateModelImplFromJson(json);

  @override
  final String templateId;
  @override
  final String userId;
  @override
  final String name;
  @override
  final String mealType;
  final List<MealTemplateFoodModel> _foods;
  @override
  @JsonKey()
  List<MealTemplateFoodModel> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  @override
  @JsonKey()
  final double totalCalories;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  final Timestamp createdAt;

  @override
  String toString() {
    return 'MealTemplateModel(templateId: $templateId, userId: $userId, name: $name, mealType: $mealType, foods: $foods, totalCalories: $totalCalories, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealTemplateModelImpl &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      templateId,
      userId,
      name,
      mealType,
      const DeepCollectionEquality().hash(_foods),
      totalCalories,
      createdAt);

  /// Create a copy of MealTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealTemplateModelImplCopyWith<_$MealTemplateModelImpl> get copyWith =>
      __$$MealTemplateModelImplCopyWithImpl<_$MealTemplateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealTemplateModelImplToJson(
      this,
    );
  }
}

abstract class _MealTemplateModel implements MealTemplateModel {
  const factory _MealTemplateModel(
      {required final String templateId,
      required final String userId,
      required final String name,
      required final String mealType,
      final List<MealTemplateFoodModel> foods,
      final double totalCalories,
      @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
      required final Timestamp createdAt}) = _$MealTemplateModelImpl;

  factory _MealTemplateModel.fromJson(Map<String, dynamic> json) =
      _$MealTemplateModelImpl.fromJson;

  @override
  String get templateId;
  @override
  String get userId;
  @override
  String get name;
  @override
  String get mealType;
  @override
  List<MealTemplateFoodModel> get foods;
  @override
  double get totalCalories;
  @override
  @JsonKey(fromJson: timestampFromJson, toJson: timestampToJson)
  Timestamp get createdAt;

  /// Create a copy of MealTemplateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealTemplateModelImplCopyWith<_$MealTemplateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MealTemplateFoodModel _$MealTemplateFoodModelFromJson(
    Map<String, dynamic> json) {
  return _MealTemplateFoodModel.fromJson(json);
}

/// @nodoc
mixin _$MealTemplateFoodModel {
  String get foodId => throw _privateConstructorUsedError;
  String get foodName => throw _privateConstructorUsedError;
  double get quantityG => throw _privateConstructorUsedError;

  /// Serializes this MealTemplateFoodModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealTemplateFoodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealTemplateFoodModelCopyWith<MealTemplateFoodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealTemplateFoodModelCopyWith<$Res> {
  factory $MealTemplateFoodModelCopyWith(MealTemplateFoodModel value,
          $Res Function(MealTemplateFoodModel) then) =
      _$MealTemplateFoodModelCopyWithImpl<$Res, MealTemplateFoodModel>;
  @useResult
  $Res call({String foodId, String foodName, double quantityG});
}

/// @nodoc
class _$MealTemplateFoodModelCopyWithImpl<$Res,
        $Val extends MealTemplateFoodModel>
    implements $MealTemplateFoodModelCopyWith<$Res> {
  _$MealTemplateFoodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealTemplateFoodModel
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
abstract class _$$MealTemplateFoodModelImplCopyWith<$Res>
    implements $MealTemplateFoodModelCopyWith<$Res> {
  factory _$$MealTemplateFoodModelImplCopyWith(
          _$MealTemplateFoodModelImpl value,
          $Res Function(_$MealTemplateFoodModelImpl) then) =
      __$$MealTemplateFoodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String foodId, String foodName, double quantityG});
}

/// @nodoc
class __$$MealTemplateFoodModelImplCopyWithImpl<$Res>
    extends _$MealTemplateFoodModelCopyWithImpl<$Res,
        _$MealTemplateFoodModelImpl>
    implements _$$MealTemplateFoodModelImplCopyWith<$Res> {
  __$$MealTemplateFoodModelImplCopyWithImpl(_$MealTemplateFoodModelImpl _value,
      $Res Function(_$MealTemplateFoodModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealTemplateFoodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodId = null,
    Object? foodName = null,
    Object? quantityG = null,
  }) {
    return _then(_$MealTemplateFoodModelImpl(
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
class _$MealTemplateFoodModelImpl implements _MealTemplateFoodModel {
  const _$MealTemplateFoodModelImpl(
      {required this.foodId, required this.foodName, required this.quantityG});

  factory _$MealTemplateFoodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealTemplateFoodModelImplFromJson(json);

  @override
  final String foodId;
  @override
  final String foodName;
  @override
  final double quantityG;

  @override
  String toString() {
    return 'MealTemplateFoodModel(foodId: $foodId, foodName: $foodName, quantityG: $quantityG)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealTemplateFoodModelImpl &&
            (identical(other.foodId, foodId) || other.foodId == foodId) &&
            (identical(other.foodName, foodName) ||
                other.foodName == foodName) &&
            (identical(other.quantityG, quantityG) ||
                other.quantityG == quantityG));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, foodId, foodName, quantityG);

  /// Create a copy of MealTemplateFoodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealTemplateFoodModelImplCopyWith<_$MealTemplateFoodModelImpl>
      get copyWith => __$$MealTemplateFoodModelImplCopyWithImpl<
          _$MealTemplateFoodModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealTemplateFoodModelImplToJson(
      this,
    );
  }
}

abstract class _MealTemplateFoodModel implements MealTemplateFoodModel {
  const factory _MealTemplateFoodModel(
      {required final String foodId,
      required final String foodName,
      required final double quantityG}) = _$MealTemplateFoodModelImpl;

  factory _MealTemplateFoodModel.fromJson(Map<String, dynamic> json) =
      _$MealTemplateFoodModelImpl.fromJson;

  @override
  String get foodId;
  @override
  String get foodName;
  @override
  double get quantityG;

  /// Create a copy of MealTemplateFoodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealTemplateFoodModelImplCopyWith<_$MealTemplateFoodModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
