import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/progress_card.dart';
import '../providers/gamification_providers.dart';
import '../widgets/achievement_card.dart';

class AchievementsScreen extends ConsumerWidget {
  final String userId;

  const AchievementsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievementsAsync = ref.watch(achievementsProvider);
    final userAchievementsAsync = ref.watch(userAchievementsProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
      ),
      body: achievementsAsync.when(
        data: (achievements) {
          final unlocked = userAchievementsAsync.valueOrNull ?? [];
          final unlockedIds = unlocked.map((u) => u.achievementId).toSet();
          final unlockedMap = {
            for (final u in unlocked) u.achievementId: u,
          };
          final unlockedCount = unlockedIds.length;

          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.warning,
                      AppColors.secondary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.emoji_events_rounded,
                      color: Colors.white,
                      size: 48,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$unlockedCount / ${achievements.length}',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const Text(
                          'Achievements Unlocked',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: achievements.length,
                  itemBuilder: (context, index) {
                    final ach = achievements[index];
                    final isUnlocked = unlockedIds.contains(ach.id);
                    final ua = unlockedMap[ach.id];

                    if (ach.isHidden && !isUnlocked) return const SizedBox.shrink();

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isUnlocked
                                ? AppColors.warning.withOpacity(0.15)
                                : AppColors.surfaceLight,
                          ),
                          child: Icon(
                            Icons.emoji_events_rounded,
                            color: isUnlocked
                                ? AppColors.warning
                                : AppColors.disabled,
                            size: 28,
                          ),
                        ),
                        title: Text(
                          ach.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isUnlocked
                                ? AppColors.textPrimary
                                : AppColors.textSecondary,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        subtitle: Text(
                          ach.description,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textHint,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        trailing: isUnlocked
                            ? const Icon(
                                Icons.check_circle_rounded,
                                color: AppColors.success,
                              )
                            : const Icon(
                                Icons.lock_rounded,
                                color: AppColors.disabled,
                              ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
