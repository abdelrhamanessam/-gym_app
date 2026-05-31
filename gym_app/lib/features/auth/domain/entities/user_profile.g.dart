// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      age: (json['age'] as num?)?.toInt() ?? 25,
      gender: json['gender'] as String? ?? 'male',
      heightCm: (json['heightCm'] as num?)?.toDouble() ?? 175.0,
      weightKg: (json['weightKg'] as num?)?.toDouble() ?? 70.0,
      bodyFatPercent: (json['bodyFatPercent'] as num?)?.toDouble() ?? 15.0,
      activityLevel:
          $enumDecodeNullable(_$ActivityLevelEnumMap, json['activityLevel']) ??
              ActivityLevel.moderate,
      fitnessGoal:
          $enumDecodeNullable(_$FitnessGoalEnumMap, json['fitnessGoal']) ??
              FitnessGoal.maintain,
      photoUrl: json['photoUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
      'heightCm': instance.heightCm,
      'weightKg': instance.weightKg,
      'bodyFatPercent': instance.bodyFatPercent,
      'activityLevel': _$ActivityLevelEnumMap[instance.activityLevel]!,
      'fitnessGoal': _$FitnessGoalEnumMap[instance.fitnessGoal]!,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ActivityLevelEnumMap = {
  ActivityLevel.sedentary: 'sedentary',
  ActivityLevel.light: 'light',
  ActivityLevel.moderate: 'moderate',
  ActivityLevel.active: 'active',
  ActivityLevel.veryActive: 'veryActive',
};

const _$FitnessGoalEnumMap = {
  FitnessGoal.fatLoss: 'fatLoss',
  FitnessGoal.muscleGain: 'muscleGain',
  FitnessGoal.recomposition: 'recomposition',
  FitnessGoal.maintain: 'maintain',
};
