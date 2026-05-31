import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/gamification_repository_impl.dart';
import '../../domain/entities/user_xp.dart';
import '../../domain/entities/achievement.dart';
import '../../domain/entities/user_achievement.dart';

part 'gamification_providers.g.dart';

@riverpod
class UserXp extends _$UserXp {
  @override
  Future<UserXp?> build(String userId) async {
    final repo = ref.watch(gamificationRepositoryProvider);
    return repo.getUserXp(userId);
  }
}

@riverpod
class Achievements extends _$Achievements {
  @override
  Future<List<Achievement>> build() async {
    final repo = ref.watch(gamificationRepositoryProvider);
    return repo.getAchievements();
  }
}

@riverpod
class UserAchievements extends _$UserAchievements {
  @override
  Future<List<UserAchievement>> build(String userId) async {
    final repo = ref.watch(gamificationRepositoryProvider);
    return repo.getUserAchievements(userId);
  }
}

@riverpod
class Leaderboard extends _$Leaderboard {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    final repo = ref.watch(gamificationRepositoryProvider);
    return repo.getLeaderboard();
  }
}

@riverpod
class CheckAchievements extends _$CheckAchievements {
  @override
  Future<List<Achievement>> build(String userId) async {
    final repo = ref.watch(gamificationRepositoryProvider);
    return repo.checkAndUnlockAchievements(userId);
  }
}
