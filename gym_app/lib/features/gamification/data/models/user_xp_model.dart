import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/user_xp.dart';

extension UserXpModel on UserXp {
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'totalXp': totalXp,
      'level': level,
      'streakDays': streakDays,
      'longestStreak': longestStreak,
      'lastWorkoutDate': lastWorkoutDate?.toIso8601String(),
      'lastFoodLogDate': lastFoodLogDate?.toIso8601String(),
    };
  }

  static UserXp fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserXp(
      id: doc.id,
      userId: data['userId'] as String? ?? '',
      totalXp: data['totalXp'] as int? ?? 0,
      level: data['level'] as int? ?? 1,
      streakDays: data['streakDays'] as int? ?? 0,
      longestStreak: data['longestStreak'] as int? ?? 0,
      lastWorkoutDate: data['lastWorkoutDate'] != null
          ? DateTime.parse(data['lastWorkoutDate'] as String)
          : null,
      lastFoodLogDate: data['lastFoodLogDate'] != null
          ? DateTime.parse(data['lastFoodLogDate'] as String)
          : null,
    );
  }
}
