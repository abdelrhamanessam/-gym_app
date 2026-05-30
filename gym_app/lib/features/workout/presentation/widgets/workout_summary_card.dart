import 'package:flutter/material.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import '../../domain/entities/workout_session.dart';
import '../../domain/entities/workout_set_group.dart';

class WorkoutSummaryCard extends StatelessWidget {
  final WorkoutSession session;

  const WorkoutSummaryCard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final totalSets =
        session.exercises.fold<int>(0, (sum, g) => sum + g.sets.length);
    final totalReps = session.exercises.fold<int>(
        0, (sum, g) => sum + g.sets.fold<int>(0, (s, set) => s + set.reps));

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.accent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            'Workout Complete!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.textOnPrimary,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            session.name,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textOnPrimary,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _StatItem(
                icon: Icons.timer_rounded,
                value: '${session.durationMinutes}',
                label: 'min',
              ),
              _StatItem(
                icon: Icons.fitness_center_rounded,
                value: session.totalVolumeKg.toStringAsFixed(0),
                label: 'kg volume',
              ),
              _StatItem(
                icon: Icons.repeat_rounded,
                value: '$totalSets',
                label: 'sets',
              ),
              _StatItem(
                icon: Icons.recycling_rounded,
                value: '$totalReps',
                label: 'reps',
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (session.exercises.isNotEmpty)
            ...session.exercises.map((group) => Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: _ExerciseSummaryRow(group: group),
                )),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white.withOpacity(0.9), size: 24),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.white.withOpacity(0.8),
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}

class _ExerciseSummaryRow extends StatelessWidget {
  final WorkoutSetGroup group;

  const _ExerciseSummaryRow({required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              group.exerciseName,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Text(
            '${group.sets.length} sets',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.8),
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
