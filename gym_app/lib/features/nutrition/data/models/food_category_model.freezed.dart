// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodCategoryModel _$FoodCategoryModelFromJson(Map<String, dynamic> json) {
  return _FoodCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$FoodCategoryModel {
  String get categoryId => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  List<String> get subcategories => throw _privateConstructorUsedError;

  /// Serializes this FoodCategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodCategoryModelCopyWith<FoodCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCategoryModelCopyWith<$Res> {
  factory $FoodCategoryModelCopyWith(
          FoodCategoryModel value, $Res Function(FoodCategoryModel) then) =
      _$FoodCategoryModelCopyWithImpl<$Res, FoodCategoryModel>;
  @useResult
  $Res call(
      {String categoryId,
      String nameEn,
      String nameAr,
      String? icon,
      List<String> subcategories});
}

/// @nodoc
class _$FoodCategoryModelCopyWithImpl<$Res, $Val extends FoodCategoryModel>
    implements $FoodCategoryModelCopyWith<$Res> {
  _$FoodCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? icon = freezed,
    Object? subcategories = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      subcategories: null == subcategories
          ? _value.subcategories
          : subcategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodCategoryModelImplCopyWith<$Res>
    implements $FoodCategoryModelCopyWith<$Res> {
  factory _$$FoodCategoryModelImplCopyWith(_$FoodCategoryModelImpl value,
          $Res Function(_$FoodCategoryModelImpl) then) =
      __$$FoodCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryId,
      String nameEn,
      String nameAr,
      String? icon,
      List<String> subcategories});
}

/// @nodoc
class __$$FoodCategoryModelImplCopyWithImpl<$Res>
    extends _$FoodCategoryModelCopyWithImpl<$Res, _$FoodCategoryModelImpl>
    implements _$$FoodCategoryModelImplCopyWith<$Res> {
  __$$FoodCategoryModelImplCopyWithImpl(_$FoodCategoryModelImpl _value,
      $Res Function(_$FoodCategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? icon = freezed,
    Object? subcategories = null,
  }) {
    return _then(_$FoodCategoryModelImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      nameEn: null == nameEn
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameAr: null == nameAr
          ? _value.nameAr
          : nameAr // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      subcategories: null == subcategories
          ? _value._subcategories
          : subcategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodCategoryModelImpl implements _FoodCategoryModel {
  const _$FoodCategoryModelImpl(
      {required this.categoryId,
      required this.nameEn,
      required this.nameAr,
      this.icon,
      final List<String> subcategories = const []})
      : _subcategories = subcategories;

  factory _$FoodCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodCategoryModelImplFromJson(json);

  @override
  final String categoryId;
  @override
  final String nameEn;
  @override
  final String nameAr;
  @override
  final String? icon;
  final List<String> _subcategories;
  @override
  @JsonKey()
  List<String> get subcategories {
    if (_subcategories is EqualUnmodifiableListView) return _subcategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subcategories);
  }

  @override
  String toString() {
    return 'FoodCategoryModel(categoryId: $categoryId, nameEn: $nameEn, nameAr: $nameAr, icon: $icon, subcategories: $subcategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodCategoryModelImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality()
                .equals(other._subcategories, _subcategories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId, nameEn, nameAr, icon,
      const DeepCollectionEquality().hash(_subcategories));

  /// Create a copy of FoodCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodCategoryModelImplCopyWith<_$FoodCategoryModelImpl> get copyWith =>
      __$$FoodCategoryModelImplCopyWithImpl<_$FoodCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _FoodCategoryModel implements FoodCategoryModel {
  const factory _FoodCategoryModel(
      {required final String categoryId,
      required final String nameEn,
      required final String nameAr,
      final String? icon,
      final List<String> subcategories}) = _$FoodCategoryModelImpl;

  factory _FoodCategoryModel.fromJson(Map<String, dynamic> json) =
      _$FoodCategoryModelImpl.fromJson;

  @override
  String get categoryId;
  @override
  String get nameEn;
  @override
  String get nameAr;
  @override
  String? get icon;
  @override
  List<String> get subcategories;

  /// Create a copy of FoodCategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodCategoryModelImplCopyWith<_$FoodCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
