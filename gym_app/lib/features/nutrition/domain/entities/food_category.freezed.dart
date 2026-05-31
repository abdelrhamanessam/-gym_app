// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodCategory _$FoodCategoryFromJson(Map<String, dynamic> json) {
  return _FoodCategory.fromJson(json);
}

/// @nodoc
mixin _$FoodCategory {
  String get id => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  List<String> get subcategories => throw _privateConstructorUsedError;

  /// Serializes this FoodCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodCategoryCopyWith<FoodCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCategoryCopyWith<$Res> {
  factory $FoodCategoryCopyWith(
          FoodCategory value, $Res Function(FoodCategory) then) =
      _$FoodCategoryCopyWithImpl<$Res, FoodCategory>;
  @useResult
  $Res call(
      {String id,
      String nameEn,
      String nameAr,
      String? icon,
      List<String> subcategories});
}

/// @nodoc
class _$FoodCategoryCopyWithImpl<$Res, $Val extends FoodCategory>
    implements $FoodCategoryCopyWith<$Res> {
  _$FoodCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? icon = freezed,
    Object? subcategories = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
abstract class _$$FoodCategoryImplCopyWith<$Res>
    implements $FoodCategoryCopyWith<$Res> {
  factory _$$FoodCategoryImplCopyWith(
          _$FoodCategoryImpl value, $Res Function(_$FoodCategoryImpl) then) =
      __$$FoodCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nameEn,
      String nameAr,
      String? icon,
      List<String> subcategories});
}

/// @nodoc
class __$$FoodCategoryImplCopyWithImpl<$Res>
    extends _$FoodCategoryCopyWithImpl<$Res, _$FoodCategoryImpl>
    implements _$$FoodCategoryImplCopyWith<$Res> {
  __$$FoodCategoryImplCopyWithImpl(
      _$FoodCategoryImpl _value, $Res Function(_$FoodCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? icon = freezed,
    Object? subcategories = null,
  }) {
    return _then(_$FoodCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$FoodCategoryImpl implements _FoodCategory {
  const _$FoodCategoryImpl(
      {required this.id,
      required this.nameEn,
      required this.nameAr,
      this.icon,
      final List<String> subcategories = const []})
      : _subcategories = subcategories;

  factory _$FoodCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodCategoryImplFromJson(json);

  @override
  final String id;
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
    return 'FoodCategory(id: $id, nameEn: $nameEn, nameAr: $nameAr, icon: $icon, subcategories: $subcategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.nameAr, nameAr) || other.nameAr == nameAr) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality()
                .equals(other._subcategories, _subcategories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameEn, nameAr, icon,
      const DeepCollectionEquality().hash(_subcategories));

  /// Create a copy of FoodCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodCategoryImplCopyWith<_$FoodCategoryImpl> get copyWith =>
      __$$FoodCategoryImplCopyWithImpl<_$FoodCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodCategoryImplToJson(
      this,
    );
  }
}

abstract class _FoodCategory implements FoodCategory {
  const factory _FoodCategory(
      {required final String id,
      required final String nameEn,
      required final String nameAr,
      final String? icon,
      final List<String> subcategories}) = _$FoodCategoryImpl;

  factory _FoodCategory.fromJson(Map<String, dynamic> json) =
      _$FoodCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get nameEn;
  @override
  String get nameAr;
  @override
  String? get icon;
  @override
  List<String> get subcategories;

  /// Create a copy of FoodCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodCategoryImplCopyWith<_$FoodCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
