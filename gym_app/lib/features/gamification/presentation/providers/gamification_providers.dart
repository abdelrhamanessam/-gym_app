import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/gamification_repository_impl.dart';
import '../../domain/entities/user_xp.dart';
import '../../domain/entities/achievement.dart';
import '../../domain/entities/user_achievement.dart';

part 'gamification_providers.g.dart';

@riverpod
class UserXpProvider extends _$UserXpProvider {
  @override
  Future<UserXp?> build(String userId) async {
    final repo = ref.watch(gamificationRepositoryProvider);
    return repo.getUserXp(userId);
  }
}

@riverpod
class AchievementsProvider extends _$AchievementsProvider {
  @override
  Future<List<Achievement>> build() async {
    final repo = ref.watch(gamificationRepositoryProvider);
    return repo.getAchievements();
  }
}

@riverpod
class UserAchievementsProvider extends _$UserAchievementsProvider {
  @override
  Future<List<UserAchievement>> build(String userId) async {
    final repo = ref.watch(gamificationRepositoryProvider);
    return repo.getUserAchievements(userId);
  }
}

@riverpod
class LeaderboardProvider extends _$LeaderboardProvider {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    final repo = ref.watch(gamificationRepositoryProvider);
    return repo.getLeaderboard();
  }
}

@riverpod
class CheckAchievementsProvider extends _$CheckAchievementsProvider {
  @override
  Future<List<Achievement>> build(String userId) async {
    final repo = ref.watch(gamificationRepositoryProvider);
    return repo.checkAndUnlockAchievements(userId);
  }
}
