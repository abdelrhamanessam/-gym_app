import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/constants/firebase_constants.dart';
import '../../domain/entities/user_xp.dart' as xp_calc;
import '../../domain/entities/achievement.dart';
import '../../domain/entities/user_achievement.dart';
import '../../domain/repositories/gamification_repository.dart';
import '../datasources/gamification_remote_datasource.dart';
import '../models/user_xp_model.dart';
import '../models/achievement_model.dart';
import '../models/user_achievement_model.dart';

part 'gamification_repository_impl.g.dart';

@riverpod
GamificationRepository gamificationRepository(
  GamificationRepositoryRef ref,
) {
  final dataSource = ref.watch(gamificationRemoteDataSourceProvider);
  return GamificationRepositoryImpl(dataSource: dataSource, ref: ref);
}

class GamificationRepositoryImpl implements GamificationRepository {
  final GamificationRemoteDataSource dataSource;
  final dynamic ref;

  GamificationRepositoryImpl({required this.dataSource, this.ref});

  @override
  Future<UserXp?> getUserXp(String userId) async {
    final doc = await dataSource.getUserXp(userId);
    if (doc == null) return null;
    return UserXpModel.fromFirestore(doc);
  }

  @override
  Future<void> updateUserXp(UserXp userXp) async {
    await dataSource.setUserXp(userXp.id, userXp.toFirestore());
  }

  @override
  Future<int> addXp(String userId, int amount, String reason) async {
    final existing = await getUserXp(userId);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    UserXp updated;
    if (existing == null) {
      final id = const Uuid().v4();
      updated = UserXp(
        id: id,
        userId: userId,
        totalXp: amount,
        level: xp_calc.calculateLevel(amount),
        streakDays: 1,
        longestStreak: 1,
        lastWorkoutDate: reason == 'workout' ? today : null,
        lastFoodLogDate: reason == 'food_log' ? today : null,
      );
      await dataSource.setUserXp(id, updated.toFirestore());
    } else {
      int streak = existing.streakDays;
      int longest = existing.longestStreak;

      if (reason == 'workout') {
        final last = existing.lastWorkoutDate;
        if (last != null) {
          final diff = today.difference(DateTime(last.year, last.month, last.day)).inDays;
          if (diff == 1) {
            streak += 1;
          } else if (diff > 1) {
            streak = 1;
          }
        } else {
          streak = 1;
        }
        if (streak > longest) longest = streak;
      }

      if (reason == 'food_log') {
        final last = existing.lastFoodLogDate;
        if (last != null) {
          final diff = today.difference(DateTime(last.year, last.month, last.day)).inDays;
          if (diff != 0) {
            streak += 1;
          }
        } else {
          streak = 1;
        }
        if (streak > longest) longest = streak;
      }

      final newTotalXp = existing.totalXp + amount;
      final newLevel = xp_calc.calculateLevel(newTotalXp);

      updated = existing.copyWith(
        totalXp: newTotalXp,
        level: newLevel,
        streakDays: streak,
        longestStreak: longest,
        lastWorkoutDate: reason == 'workout' ? today : existing.lastWorkoutDate,
        lastFoodLogDate: reason == 'food_log' ? today : existing.lastFoodLogDate,
      );
      await dataSource.setUserXp(existing.id, updated.toFirestore());
    }

    final newLevel = xp_calc.calculateLevel(updated.totalXp);
    return newLevel;
  }

  @override
  Future<List<Achievement>> getAchievements() async {
    final docs = await dataSource.getAchievements();
    return docs.map((doc) => AchievementModel.fromFirestore(doc)).toList();
  }

  @override
  Future<List<UserAchievement>> getUserAchievements(String userId) async {
    final docs = await dataSource.getUserAchievements(userId);
    return docs.map((doc) => UserAchievementModel.fromFirestore(doc)).toList();
  }

  @override
  Future<List<Achievement>> checkAndUnlockAchievements(String userId) async {
    final allAchievements = await getAchievements();
    final userAchievements = await getUserAchievements(userId);
    final userXp = await getUserXp(userId);

    if (userXp == null) return [];

    final unlockedIds = userAchievements.map((ua) => ua.achievementId).toSet();
    final newlyUnlocked = <Achievement>[];

    for (final achievement in allAchievements) {
      if (unlockedIds.contains(achievement.id)) continue;

      final criteria = achievement.criteria;
      bool shouldUnlock = false;

      final type = criteria['type'] as String?;

      if (type == 'firstWorkout') {
        shouldUnlock = userXp.lastWorkoutDate != null;
      } else if (type == 'streak7') {
        shouldUnlock = userXp.streakDays >= 7;
      } else if (type == 'streak30') {
        shouldUnlock = userXp.streakDays >= 30;
      } else if (type == 'workouts100') {
        final count = criteria['count'] as int? ?? 100;
        shouldUnlock = userXp.totalXp >= count * 50;
      } else if (type == 'lose5kg') {
        shouldUnlock = false;
      } else if (type == 'gain5kgMuscle') {
        shouldUnlock = false;
      } else if (type == 'foodLogs100') {
        shouldUnlock = userXp.lastFoodLogDate != null;
      }

      if (shouldUnlock) {
        final ua = UserAchievement(
          id: const Uuid().v4(),
          userId: userId,
          achievementId: achievement.id,
          achievementName: achievement.name,
          unlockedAt: DateTime.now(),
          xpAwarded: achievement.xpReward,
        );
        await dataSource.addUserAchievement(ua.toFirestore());
        if (achievement.xpReward > 0) {
          await addXp(userId, achievement.xpReward, 'achievement_${achievement.id}');
        }
        newlyUnlocked.add(achievement);
      }
    }

    return newlyUnlocked;
  }

  @override
  Future<List<Map<String, dynamic>>> getLeaderboard() async {
    final docs = await dataSource.getLeaderboard();
    final results = <Map<String, dynamic>>[];

    for (final doc in docs) {
      final data = doc.data() as Map<String, dynamic>;
      final userId = data['userId'] as String? ?? '';
      results.add({
        'userId': userId,
        'name': data['name'] as String? ?? 'Unknown',
        'xp': data['totalXp'] as int? ?? 0,
        'level': data['level'] as int? ?? 1,
      });
    }

    return results;
  }
}
