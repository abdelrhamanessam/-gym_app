import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/widgets/loading_widget.dart';
import 'package:gym_app/core/widgets/error_widget.dart';
import '../../domain/entities/workout_set_group.dart';
import '../../domain/entities/workout_template.dart';
import '../providers/workout_providers.dart';

class WorkoutTemplatesScreen extends ConsumerWidget {
  const WorkoutTemplatesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templatesAsync = ref.watch(workoutTemplatesProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Templates'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/workout/template/create'),
        icon: const Icon(Icons.add_rounded),
        label: const Text('New Template'),
      ),
      body: templatesAsync.when(
        loading: () => const LoadingScreen(),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(workoutTemplatesProvider),
        ),
        data: (templates) {
          if (templates.isEmpty) {
            return EmptyStateWidget(
              icon: Icons.auto_stories_rounded,
              title: 'No Templates',
              message: 'Create a workout template to save time.',
              action: ElevatedButton.icon(
                onPressed: () => context.push('/workout/template/create'),
                icon: const Icon(Icons.add_rounded),
                label: const Text('Create Template'),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
            itemCount: templates.length,
            itemBuilder: (context, index) {
              final template = templates[index];
              return _TemplateCard(
                template: template,
                onTap: () => _startWorkoutFromTemplate(context, ref, template),
                onEdit: () => ref,
                onDelete: () => _deleteTemplate(ref, template),
              );
            },
          );
        },
      ),
    );
  }

  void _startWorkoutFromTemplate(
      BuildContext context, WidgetRef ref, WorkoutTemplate template) {
    final exercises = template.exercises
        .map((e) => WorkoutSetGroup(
              exerciseId: e.exerciseId,
              exerciseName: e.exerciseName,
              sets: [],
              restSeconds: e.restSeconds,
            ))
        .toList();
    ref.read(activeWorkoutProvider.notifier).startWorkout(
          template.name,
          exercises,
        );
    context.push('/workout/active');
  }

  Future<void> _deleteTemplate(
      WidgetRef ref, WorkoutTemplate template) async {
    final repo = ref.read(workoutRepositoryProvider);
    await repo.deleteWorkoutTemplate(template.id);
    ref.invalidate(workoutTemplatesProvider);
  }
}

class _TemplateCard extends StatelessWidget {
  final WorkoutTemplate template;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const _TemplateCard({
    required this.template,
    required this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.auto_stories_rounded,
                    color: AppColors.primary,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        template.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      if (template.description != null &&
                          template.description!.isNotEmpty)
                        Text(
                          template.description!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                            fontFamily: 'Poppins',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert_rounded,
                      color: AppColors.textHint),
                  onSelected: (v) {
                    if (v == 'edit') onEdit?.call();
                    if (v == 'delete') onDelete?.call();
                  },
                  itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit_rounded, size: 20),
                          SizedBox(width: 8),
                          Text('Edit'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete_rounded, size: 20, color: AppColors.error),
                          SizedBox(width: 8),
                          Text('Delete', style: TextStyle(color: AppColors.error)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _TemplateInfo(
                  icon: Icons.fitness_center_rounded,
                  label: '${template.exercises.length} exercises',
                ),
                const SizedBox(width: 16),
                _TemplateInfo(
                  icon: Icons.timer_outlined,
                  label: '${template.estimatedDuration} min',
                ),
                const Spacer(),
                _DifficultyLabel(difficulty: template.difficulty),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TemplateInfo extends StatelessWidget {
  final IconData icon;
  final String label;

  const _TemplateInfo({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.textHint),
        const SizedBox(width: 4),
        Text(
          label,
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

class _DifficultyLabel extends StatelessWidget {
  final Difficulty difficulty;

  const _DifficultyLabel({required this.difficulty});

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (difficulty) {
      Difficulty.beginner => ('Beginner', AppColors.success),
      Difficulty.intermediate => ('Intermediate', AppColors.warning),
      Difficulty.advanced => ('Advanced', AppColors.error),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: color,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
