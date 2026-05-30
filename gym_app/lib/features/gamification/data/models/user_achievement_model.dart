import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user_achievement.dart';

extension UserAchievementModel on UserAchievement {
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'achievementId': achievementId,
      'achievementName': achievementName,
      'unlockedAt': unlockedAt.toIso8601String(),
      'xpAwarded': xpAwarded,
    };
  }

  static UserAchievement fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserAchievement(
      id: doc.id,
      userId: data['userId'] as String? ?? '',
      achievementId: data['achievementId'] as String? ?? '',
      achievementName: data['achievementName'] as String? ?? '',
      unlockedAt: DateTime.parse(data['unlockedAt'] as String),
      xpAwarded: data['xpAwarded'] as int? ?? 0,
    );
  }
}
