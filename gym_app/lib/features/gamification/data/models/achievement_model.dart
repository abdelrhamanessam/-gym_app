import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/achievement.dart';

extension AchievementModel on Achievement {
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'iconName': iconName,
      'xpReward': xpReward,
      'criteria': criteria,
      'isHidden': isHidden,
    };
  }

  static Achievement fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Achievement(
      id: doc.id,
      name: data['name'] as String? ?? '',
      description: data['description'] as String? ?? '',
      iconName: data['iconName'] as String? ?? '',
      xpReward: data['xpReward'] as int? ?? 0,
      criteria: Map<String, dynamic>.from(data['criteria'] as Map? ?? {}),
      isHidden: data['isHidden'] as bool? ?? false,
    );
  }
}
