import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/widgets/loading_widget.dart';
import 'package:gym_app/core/widgets/error_widget.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout_program.dart';
import '../../domain/entities/workout_template.dart';
import '../providers/workout_providers.dart';

class WorkoutProgramsScreen extends ConsumerWidget {
  const WorkoutProgramsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programsAsync = ref.watch(workoutProgramsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Programs'),
      ),
      body: programsAsync.when(
        loading: () => const LoadingScreen(),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(workoutProgramsProvider),
        ),
        data: (programs) {
          if (programs.isEmpty) {
            return const EmptyStateWidget(
              icon: Icons.library_books_rounded,
              title: 'No Programs',
              message: 'Built-in programs coming soon!',
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: programs.length,
            itemBuilder: (context, index) {
              final program = programs[index];
              return _ProgramCard(
                program: program,
                onTap: () => context.push(
                  '/workout/program/${program.id}',
                  extra: program,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _ProgramCard extends StatelessWidget {
  final WorkoutProgram program;
  final VoidCallback onTap;

  const _ProgramCard({required this.program, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.card,
              AppColors.surface,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.library_books_rounded,
                    color: AppColors.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        program.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      if (program.description != null &&
                          program.description!.isNotEmpty)
                        Text(
                          program.description!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                            fontFamily: 'Poppins',
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _ProgramStat(
                  icon: Icons.calendar_today_rounded,
                  value: '${program.durationWeeks} weeks',
                ),
                const SizedBox(width: 16),
                _ProgramStat(
                  icon: Icons.repeat_rounded,
                  value: '${program.sessionsPerWeek}/week',
                ),
                const Spacer(),
                _GoalBadge(goal: program.goal),
              ],
            ),
            const SizedBox(height: 10),
            _DifficultyBadge(difficulty: program.difficulty),
          ],
        ),
      ),
    );
  }
}

class _ProgramStat extends StatelessWidget {
  final IconData icon;
  final String value;

  const _ProgramStat({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.textHint),
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textHint,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}

class _GoalBadge extends StatelessWidget {
  final Goal goal;

  const _GoalBadge({required this.goal});

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (goal) {
      Goal.muscleGain => ('Muscle Gain', AppColors.primary),
      Goal.fatLoss => ('Fat Loss', AppColors.warning),
      Goal.strength => ('Strength', AppColors.error),
      Goal.endurance => ('Endurance', AppColors.info),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}

class _DifficultyBadge extends StatelessWidget {
  final Difficulty difficulty;

  const _DifficultyBadge({required this.difficulty});

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (difficulty) {
      Difficulty.beginner => ('Beginner', AppColors.success),
      Difficulty.intermediate => ('Intermediate', AppColors.warning),
      Difficulty.advanced => ('Advanced', AppColors.error),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
