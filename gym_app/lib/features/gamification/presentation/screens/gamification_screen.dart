import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/date_utils.dart';
import '../../domain/entities/user_xp.dart' as xp_calc;
import '../providers/gamification_providers.dart';
import '../widgets/level_badge.dart';
import '../widgets/xp_flyout.dart';
import '../widgets/achievement_card.dart';

class GamificationScreen extends ConsumerWidget {
  final String userId;

  const GamificationScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userXpAsync = ref.watch(userXpProvider(userId));
    final achievementsAsync = ref.watch(achievementsProvider);
    final userAchievementsAsync = ref.watch(userAchievementsProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gamification'),
        actions: [
          IconButton(
            icon: const Icon(Icons.emoji_events_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            userXpAsync.when(
              data: (userXp) {
                if (userXp == null) {
                  return const Center(child: Text('No XP data yet'));
                }
                final progress = xp_calc.xpInCurrentLevel(userXp.totalXp);
                final needed = xp_calc.xpToNextLevel(userXp.totalXp);
                final percentage = needed > 0 ? progress / needed : 0.0;

                return Column(
                  children: [
                    XpFlyout(
                      amount: 50,
                      reason: 'workout',
                      child: LevelBadge(level: userXp.level),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Level ${userXp.level}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
                                '$progress / $needed XP',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textSecondary,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: percentage.clamp(0.0, 1.0),
                              backgroundColor: AppColors.primary.withOpacity(0.12),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.primary,
                              ),
                              minHeight: 10,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Icon(
                                Icons.local_fire_department_rounded,
                                color: AppColors.warning,
                                size: 28,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${userXp.streakDays} day streak',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent XP',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    fontFamily: 'Poppins',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _xpEntry('Workout completed', 50, DateTime.now().subtract(const Duration(hours: 2))),
                    const Divider(color: AppColors.divider),
                    _xpEntry('Food logged', 10, DateTime.now().subtract(const Duration(hours: 5))),
                    const Divider(color: AppColors.divider),
                    _xpEntry('Achievement: First Workout', 100, DateTime.now().subtract(const Duration(days: 1))),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Achievements',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    fontFamily: 'Poppins',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See All'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            achievementsAsync.when(
              data: (achievements) {
                final unlocked = userAchievementsAsync.valueOrNull ?? [];
                final unlockedIds = unlocked.map((u) => u.achievementId).toSet();
                final unlockedMap = {
                  for (final u in unlocked) u.achievementId: u,
                };

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: achievements.length > 8 ? 8 : achievements.length,
                  itemBuilder: (context, index) {
                    final ach = achievements[index];
                    final isUnlocked = unlockedIds.contains(ach.id);
                    final ua = unlockedMap[ach.id];
                    return AchievementCard(
                      achievement: ach,
                      isUnlocked: isUnlocked,
                      unlockedAt: ua?.unlockedAt,
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _xpEntry(String title, int xp, DateTime time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.stars_rounded,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  DateUtilsExt.timeAgo(time),
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textHint,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '+$xp XP',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
