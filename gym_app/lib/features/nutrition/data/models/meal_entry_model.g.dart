// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealEntryModelImpl _$$MealEntryModelImplFromJson(Map<String, dynamic> json) =>
    _$MealEntryModelImpl(
      mealId: json['mealId'] as String,
      userId: json['userId'] as String,
      date: timestampFromJson(json['date']),
      mealType: json['mealType'] as String,
      foods: (json['foods'] as List<dynamic>?)
              ?.map(
                  (e) => MealFoodItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalCalories: (json['totalCalories'] as num?)?.toDouble() ?? 0,
      totalProtein: (json['totalProtein'] as num?)?.toDouble() ?? 0,
      totalCarbs: (json['totalCarbs'] as num?)?.toDouble() ?? 0,
      totalFat: (json['totalFat'] as num?)?.toDouble() ?? 0,
      imageUrl: json['imageUrl'] as String?,
      notes: json['notes'] as String?,
      createdAt: timestampFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$MealEntryModelImplToJson(
        _$MealEntryModelImpl instance) =>
    <String, dynamic>{
      'mealId': instance.mealId,
      'userId': instance.userId,
      'date': timestampToJson(instance.date),
      'mealType': instance.mealType,
      'foods': instance.foods,
      'totalCalories': instance.totalCalories,
      'totalProtein': instance.totalProtein,
      'totalCarbs': instance.totalCarbs,
      'totalFat': instance.totalFat,
      'imageUrl': instance.imageUrl,
      'notes': instance.notes,
      'createdAt': timestampToJson(instance.createdAt),
    };
