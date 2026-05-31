// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodLogModelImpl _$$FoodLogModelImplFromJson(Map<String, dynamic> json) =>
    _$FoodLogModelImpl(
      logId: json['logId'] as String,
      userId: json['userId'] as String,
      foodItem:
          FoodItemModel.fromJson(json['foodItem'] as Map<String, dynamic>),
      quantityG: (json['quantityG'] as num).toDouble(),
      mealType: json['mealType'] as String,
      date: timestampFromJson(json['date']),
      createdAt: timestampFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$FoodLogModelImplToJson(_$FoodLogModelImpl instance) =>
    <String, dynamic>{
      'logId': instance.logId,
      'userId': instance.userId,
      'foodItem': instance.foodItem,
      'quantityG': instance.quantityG,
      'mealType': instance.mealType,
      'date': timestampToJson(instance.date),
      'createdAt': timestampToJson(instance.createdAt),
    };
