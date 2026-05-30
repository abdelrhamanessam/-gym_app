import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    required String userId,
    required String email,
    required String name,
    @Default(25) int age,
    @Default('male') String gender,
    @Default(175.0) double heightCm,
    @Default(70.0) double weightKg,
    @Default(15.0) double bodyFatPercent,
    @Default('moderate') String activityLevel,
    @Default('maintain') String fitnessGoal,
    String? photoUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  factory UserProfileModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserProfileModel.fromJson({
      ...data,
      'userId': doc.id,
    });
  }

  Map<String, dynamic> toFirestore() {
    final json = toJson();
    json.remove('userId');
    json['createdAt'] = Timestamp.fromDate(createdAt);
    json['updatedAt'] = Timestamp.fromDate(updatedAt);
    return json;
  }
}
