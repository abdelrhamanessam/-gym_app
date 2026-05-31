// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodCategoryModelImpl _$$FoodCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FoodCategoryModelImpl(
      categoryId: json['categoryId'] as String,
      nameEn: json['nameEn'] as String,
      nameAr: json['nameAr'] as String,
      icon: json['icon'] as String?,
      subcategories: (json['subcategories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FoodCategoryModelImplToJson(
        _$FoodCategoryModelImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'icon': instance.icon,
      'subcategories': instance.subcategories,
    };
