// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchievementImpl _$$AchievementImplFromJson(Map<String, dynamic> json) =>
    _$AchievementImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      iconName: json['iconName'] as String,
      xpReward: (json['xpReward'] as num?)?.toInt() ?? 0,
      criteria: json['criteria'] as Map<String, dynamic>,
      isHidden: json['isHidden'] as bool? ?? false,
    );

Map<String, dynamic> _$$AchievementImplToJson(_$AchievementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'iconName': instance.iconName,
      'xpReward': instance.xpReward,
      'criteria': instance.criteria,
      'isHidden': instance.isHidden,
    };
