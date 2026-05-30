import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/error_widget.dart';
import '../../domain/entities/exercise.dart';
import '../providers/workout_providers.dart';

class ExerciseDetailScreen extends ConsumerWidget {
  final String id;

  const ExerciseDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseAsync = ref.watch(exerciseDetailProvider(id));

    return exerciseAsync.when(
      loading: () => const Scaffold(
        backgroundColor: AppColors.background,
        body: LoadingScreen(),
      ),
      error: (e, _) => Scaffold(
        backgroundColor: AppColors.background,
        body: AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(exerciseDetailProvider(id)),
        ),
      ),
      data: (exercise) {
        if (exercise == null) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: const AppErrorWidget(message: 'Exercise not found'),
          );
        }
        return _ExerciseDetailContent(exercise: exercise);
      },
    );
  }
}

class _ExerciseDetailContent extends StatelessWidget {
  final Exercise exercise;

  const _ExerciseDetailContent({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(exercise.name),
      ),
      body: ListView(
        children: [
          if (exercise.imageUrl != null)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(24)),
              child: CachedNetworkImage(
                imageUrl: exercise.imageUrl!,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  height: 220,
                  color: AppColors.surfaceLight,
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                errorWidget: (_, __, ___) => Container(
                  height: 220,
                  color: AppColors.surfaceLight,
                  child: const Icon(
                    Icons.fitness_center_rounded,
                    color: AppColors.textHint,
                    size: 64,
                  ),
                ),
              ),
            )
          else
            Container(
              height: 120,
              color: AppColors.surfaceLight,
              child: const Center(
                child: Icon(
                  Icons.fitness_center_rounded,
                  color: AppColors.textHint,
                  size: 64,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _InfoChip(
                      icon: Icons.fitness_center_rounded,
                      label: exercise.muscleGroup.name[0].toUpperCase() +
                          exercise.muscleGroup.name.substring(1),
                    ),
                    const SizedBox(width: 8),
                    _DifficultyBadge(difficulty: exercise.difficulty),
                    if (exercise.isCardio) ...[
                      const SizedBox(width: 8),
                      const _InfoChip(
                        icon: Icons.directions_run_rounded,
                        label: 'Cardio',
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 24),
                if (exercise.equipment.isNotEmpty) ...[
                  const Text(
                    'Equipment Needed',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: exercise.equipment
                        .map((e) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: AppColors.border.withOpacity(0.3)),
                              ),
                              child: Text(
                                e,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textPrimary,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                ],
                const Text(
                  'Instructions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 12),
                ...exercise.instructions.asMap().entries.map((entry) {
                  final idx = entry.key + 1;
                  final instruction = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '$idx',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            instruction,
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: AppColors.textPrimary,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                if (exercise.commonMistakes.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  const Text(
                    'Common Mistakes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...exercise.commonMistakes.map((mistake) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.warning_amber_rounded,
                                color: AppColors.warning, size: 20),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                mistake,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textPrimary,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.primary),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
              fontFamily: 'Poppins',
            ),
          ),
        ],
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: color,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
