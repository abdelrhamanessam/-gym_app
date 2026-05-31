// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodItemImpl _$$FoodItemImplFromJson(Map<String, dynamic> json) =>
    _$FoodItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      servingSizeG: (json['servingSizeG'] as num).toDouble(),
      calories: (json['calories'] as num).toDouble(),
      proteinG: (json['proteinG'] as num).toDouble(),
      carbsG: (json['carbsG'] as num).toDouble(),
      fatG: (json['fatG'] as num).toDouble(),
      fiberG: (json['fiberG'] as num?)?.toDouble() ?? 0,
      sugarG: (json['sugarG'] as num?)?.toDouble() ?? 0,
      barcode: json['barcode'] as String?,
      source: $enumDecodeNullable(_$FoodSourceEnumMap, json['source']) ??
          FoodSource.custom,
      imageUrl: json['imageUrl'] as String?,
      verified: json['verified'] as bool? ?? false,
    );

Map<String, dynamic> _$$FoodItemImplToJson(_$FoodItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'category': instance.category,
      'servingSizeG': instance.servingSizeG,
      'calories': instance.calories,
      'proteinG': instance.proteinG,
      'carbsG': instance.carbsG,
      'fatG': instance.fatG,
      'fiberG': instance.fiberG,
      'sugarG': instance.sugarG,
      'barcode': instance.barcode,
      'source': _$FoodSourceEnumMap[instance.source]!,
      'imageUrl': instance.imageUrl,
      'verified': instance.verified,
    };

const _$FoodSourceEnumMap = {
  FoodSource.usda: 'usda',
  FoodSource.openfoodfacts: 'openfoodfacts',
  FoodSource.egyptian: 'egyptian',
  FoodSource.custom: 'custom',
  FoodSource.ai: 'ai',
};
