import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

enum ActivityLevel {
  @JsonValue('sedentary')
  sedentary,
  @JsonValue('light')
  light,
  @JsonValue('moderate')
  moderate,
  @JsonValue('active')
  active,
  @JsonValue('veryActive')
  veryActive,
}

enum FitnessGoal {
  @JsonValue('fatLoss')
  fatLoss,
  @JsonValue('muscleGain')
  muscleGain,
  @JsonValue('recomposition')
  recomposition,
  @JsonValue('maintain')
  maintain,
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String email,
    required String name,
    @Default(25) int age,
    @Default('male') String gender,
    @Default(175.0) double heightCm,
    @Default(70.0) double weightKg,
    @Default(15.0) double bodyFatPercent,
    @Default(ActivityLevel.moderate) ActivityLevel activityLevel,
    @Default(FitnessGoal.maintain) FitnessGoal fitnessGoal,
    String? photoUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
