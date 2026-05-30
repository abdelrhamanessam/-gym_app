import '../entities/user_xp.dart';
import '../entities/achievement.dart';
import '../entities/user_achievement.dart';

abstract class GamificationRepository {
  Future<UserXp?> getUserXp(String userId);
  Future<void> updateUserXp(UserXp userXp);
  Future<int> addXp(String userId, int amount, String reason);
  Future<List<Achievement>> getAchievements();
  Future<List<UserAchievement>> getUserAchievements(String userId);
  Future<List<Achievement>> checkAndUnlockAchievements(String userId);
  Future<List<Map<String, dynamic>>> getLeaderboard();
}
