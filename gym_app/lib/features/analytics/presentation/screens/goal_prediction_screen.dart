import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/analytics_providers.dart';

class GoalPredictionScreen extends ConsumerWidget {
  const GoalPredictionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalAsync = ref.watch(goalPredictionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Goal Prediction'),
      ),
      body: goalAsync.when(
        data: (goal) {
          final isOnTrack = goal.estimatedCompletionDate.isBefore(goal.targetDate) ||
              goal.estimatedCompletionDate.isAtSameMomentAs(goal.targetDate);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primary,
                              width: 6,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${goal.progressPercent.toStringAsFixed(0)}%',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                color: AppColors.primary,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _weightColumn('Current', goal.currentWeight, AppColors.warning),
                            Container(
                              height: 40,
                              width: 1,
                              color: AppColors.divider,
                            ),
                            _weightColumn('Target', goal.goalWeight, AppColors.primary),
                          ],
                        ),
                        const SizedBox(height: 24),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: (goal.progressPercent / 100).clamp(0.0, 1.0),
                            backgroundColor: AppColors.primary.withOpacity(0.12),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.primary,
                            ),
                            minHeight: 10,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isOnTrack
                                ? AppColors.success.withOpacity(0.12)
                                : AppColors.warning.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                isOnTrack
                                    ? Icons.check_circle_rounded
                                    : Icons.info_rounded,
                                color: isOnTrack
                                    ? AppColors.success
                                    : AppColors.warning,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                isOnTrack ? 'On Track' : 'Adjust Needed',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: isOnTrack
                                      ? AppColors.success
                                      : AppColors.warning,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Timeline',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 16),
                        _timelineRow(
                          'Target Date',
                          '${goal.targetDate.month}/${goal.targetDate.day}/${goal.targetDate.year}',
                          Icons.flag_rounded,
                          AppColors.primary,
                        ),
                        const Divider(color: AppColors.divider),
                        _timelineRow(
                          'Estimated Completion',
                          '${goal.estimatedCompletionDate.month}/${goal.estimatedCompletionDate.day}/${goal.estimatedCompletionDate.year}',
                          Icons.calendar_today_rounded,
                          isOnTrack ? AppColors.success : AppColors.warning,
                        ),
                        const Divider(color: AppColors.divider),
                        _timelineRow(
                          'Weeks Remaining',
                          '${goal.weeksRemaining} weeks',
                          Icons.timer_rounded,
                          AppColors.info,
                        ),
                        const Divider(color: AppColors.divider),
                        _timelineRow(
                          'Daily Calorie Target',
                          '${goal.dailyCalorieTarget} kcal',
                          Icons.restaurant_rounded,
                          AppColors.secondary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Widget _weightColumn(String label, double weight, Color color) {
    return Column(
      children: [
        Text(
          '${weight.toStringAsFixed(1)} kg',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: color,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textSecondary,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget _timelineRow(String label, String value, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
