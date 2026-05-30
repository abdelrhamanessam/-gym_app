import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/achievement.dart';

class AchievementCard extends StatelessWidget {
  final Achievement achievement;
  final bool isUnlocked;
  final DateTime? unlockedAt;
  final VoidCallback? onTap;

  const AchievementCard({
    super.key,
    required this.achievement,
    this.isUnlocked = false,
    this.unlockedAt,
    this.onTap,
  });

  IconData _getIcon() {
    switch (achievement.iconName) {
      case 'first_workout':
        return Icons.fitness_center_rounded;
      case 'streak':
        return Icons.local_fire_department_rounded;
      case 'workouts':
        return Icons.repeat_rounded;
      case 'weight_loss':
        return Icons.monitor_weight_rounded;
      case 'muscle_gain':
        return Icons.auto_awesome_rounded;
      case 'nutrition':
        return Icons.restaurant_rounded;
      default:
        return Icons.emoji_events_rounded;
    }
  }

  Color _getIconColor() {
    if (achievement.isHidden && !isUnlocked) return AppColors.disabled;
    return isUnlocked ? AppColors.warning : AppColors.textHint;
  }

  @override
  Widget build(BuildContext context) {
    final isVisible = !achievement.isHidden || isUnlocked;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: isUnlocked
                ? const LinearGradient(
                    colors: [
                      Color(0x332A2A2A),
                      Color(0x3300E676),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isUnlocked
                      ? AppColors.warning.withOpacity(0.15)
                      : AppColors.surfaceLight,
                ),
                child: Icon(
                  isVisible ? _getIcon() : Icons.lock_rounded,
                  color: _getIconColor(),
                  size: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isVisible ? achievement.name : '???',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isUnlocked
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                  fontFamily: 'Poppins',
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (isUnlocked && unlockedAt != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    '${unlockedAt!.month}/${unlockedAt!.day}',
                    style: const TextStyle(
                      fontSize: 9,
                      color: AppColors.textHint,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
