// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_xp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserXpImpl _$$UserXpImplFromJson(Map<String, dynamic> json) => _$UserXpImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      totalXp: (json['totalXp'] as num?)?.toInt() ?? 0,
      level: (json['level'] as num?)?.toInt() ?? 1,
      streakDays: (json['streakDays'] as num?)?.toInt() ?? 0,
      longestStreak: (json['longestStreak'] as num?)?.toInt() ?? 0,
      lastWorkoutDate: json['lastWorkoutDate'] == null
          ? null
          : DateTime.parse(json['lastWorkoutDate'] as String),
      lastFoodLogDate: json['lastFoodLogDate'] == null
          ? null
          : DateTime.parse(json['lastFoodLogDate'] as String),
    );

Map<String, dynamic> _$$UserXpImplToJson(_$UserXpImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'totalXp': instance.totalXp,
      'level': instance.level,
      'streakDays': instance.streakDays,
      'longestStreak': instance.longestStreak,
      'lastWorkoutDate': instance.lastWorkoutDate?.toIso8601String(),
      'lastFoodLogDate': instance.lastFoodLogDate?.toIso8601String(),
    };
