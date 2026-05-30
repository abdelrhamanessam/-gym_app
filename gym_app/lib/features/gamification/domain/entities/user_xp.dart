import 'dart:math';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_xp.freezed.dart';
part 'user_xp.g.dart';

@freezed
class UserXp with _$UserXp {
  const factory UserXp({
    required String id,
    required String userId,
    @Default(0) int totalXp,
    @Default(1) int level,
    @Default(0) int streakDays,
    @Default(0) int longestStreak,
    DateTime? lastWorkoutDate,
    DateTime? lastFoodLogDate,
  }) = _UserXp;

  factory UserXp.fromJson(Map<String, dynamic> json) =>
      _$UserXpFromJson(json);
}

int calculateLevel(int totalXp) {
  return (sqrt(100 * (2 * totalXp) + 25) + 50) ~/ 100;
}

int xpForLevel(int level) {
  return ((level * level * 100) - (level * 100)) ~/ 2;
}

int xpToNextLevel(int totalXp) {
  final currentLevel = calculateLevel(totalXp);
  final nextLevel = currentLevel + 1;
  final xpForCurrent = xpForLevel(currentLevel);
  final xpForNext = xpForLevel(nextLevel);
  return xpForNext - xpForCurrent;
}

int xpInCurrentLevel(int totalXp) {
  final currentLevel = calculateLevel(totalXp);
  final xpForCurrent = xpForLevel(currentLevel);
  return totalXp - xpForCurrent;
}
