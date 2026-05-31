// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAchievementImpl _$$UserAchievementImplFromJson(
        Map<String, dynamic> json) =>
    _$UserAchievementImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      achievementId: json['achievementId'] as String,
      achievementName: json['achievementName'] as String,
      unlockedAt: DateTime.parse(json['unlockedAt'] as String),
      xpAwarded: (json['xpAwarded'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserAchievementImplToJson(
        _$UserAchievementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'achievementId': instance.achievementId,
      'achievementName': instance.achievementName,
      'unlockedAt': instance.unlockedAt.toIso8601String(),
      'xpAwarded': instance.xpAwarded,
    };
