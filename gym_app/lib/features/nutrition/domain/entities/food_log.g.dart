// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodLogImpl _$$FoodLogImplFromJson(Map<String, dynamic> json) =>
    _$FoodLogImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      foodItem: FoodItem.fromJson(json['foodItem'] as Map<String, dynamic>),
      quantityG: (json['quantityG'] as num).toDouble(),
      mealType: json['mealType'] as String,
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$FoodLogImplToJson(_$FoodLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'foodItem': instance.foodItem,
      'quantityG': instance.quantityG,
      'mealType': instance.mealType,
      'date': instance.date.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
