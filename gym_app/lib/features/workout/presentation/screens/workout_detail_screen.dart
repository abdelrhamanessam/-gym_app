import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/error_widget.dart';
import '../../domain/entities/workout_session.dart';
import '../../domain/entities/workout_set_group.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/repositories/workout_repository.dart';
import '../providers/workout_providers.dart';

part 'workout_detail_screen.g.dart';

@riverpod
Future<WorkoutSession?> workoutSessionDetailProvider(
    WorkoutSessionDetailProviderRef ref, String id) async {
  final repo = ref.watch(workoutRepositoryProvider);
  return repo.getWorkoutSessionById(id);
}

class WorkoutDetailScreen extends ConsumerWidget {
  final String id;

  const WorkoutDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(workoutSessionDetailProvider(id));

    return sessionAsync.when(
      loading: () => const Scaffold(
        backgroundColor: AppColors.background,
        body: LoadingScreen(),
      ),
      error: (e, _) => Scaffold(
        backgroundColor: AppColors.background,
        body: AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(workoutSessionDetailProvider(id)),
        ),
      ),
      data: (session) {
        if (session == null) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: const AppErrorWidget(message: 'Workout not found'),
          );
        }
        return _WorkoutDetailContent(session: session);
      },
    );
  }
}

class _WorkoutDetailContent extends StatelessWidget {
  final WorkoutSession session;

  const _WorkoutDetailContent({required this.session});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('EEEE, MMMM d, yyyy').format(session.date);
    final totalSets =
        session.exercises.fold<int>(0, (sum, g) => sum + g.sets.length);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(session.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () => _showMenu(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.15),
                  AppColors.accent.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.2),
              ),
            ),
            child: Column(
              children: [
                Text(
                  dateStr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _QuickStat(
                      icon: Icons.timer_rounded,
                      value: '${session.durationMinutes}',
                      label: 'Minutes',
                    ),
                    _QuickStat(
                      icon: Icons.fitness_center_rounded,
                      value: session.totalVolumeKg.toStringAsFixed(0),
                      label: 'kg Volume',
                    ),
                    _QuickStat(
                      icon: Icons.repeat_rounded,
                      value: '$totalSets',
                      label: 'Sets',
                    ),
                    _QuickStat(
                      icon: Icons.extension_rounded,
                      value: '${session.exercises.length}',
                      label: 'Exercises',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          if (session.notes != null && session.notes!.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    session.notes!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
          const Text(
            'Exercises',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 12),
          ...session.exercises.map((group) => _ExerciseDetailGroup(
                group: group,
              )),
        ],
      ),
    );
  }

  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.replay_rounded, color: AppColors.primary),
              title: const Text('Repeat Workout'),
              onTap: () {
                Navigator.pop(ctx);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt_rounded, color: AppColors.primary),
              title: const Text('Save as Template'),
              onTap: () {
                Navigator.pop(ctx);
              },
            ),
            ListTile(
              leading: const Icon(Icons.share_rounded, color: AppColors.primary),
              title: const Text('Share'),
              onTap: () {
                Navigator.pop(ctx);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_rounded, color: AppColors.error),
              title: const Text('Delete', style: TextStyle(color: AppColors.error)),
              onTap: () {
                Navigator.pop(ctx);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickStat extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _QuickStat({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.textSecondary,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}

class _ExerciseDetailGroup extends StatelessWidget {
  final WorkoutSetGroup group;

  const _ExerciseDetailGroup({required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withOpacity(0.3)),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        title: Text(
          group.exerciseName,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            fontFamily: 'Poppins',
          ),
        ),
        subtitle: Text(
          '${group.sets.length} sets \u2022 ${group.restSeconds}s rest',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
            fontFamily: 'Poppins',
          ),
        ),
        children: [
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      flex: 2,
                      child: Text('Set',
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textHint,
                              fontFamily: 'Poppins')),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('Weight',
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textHint,
                              fontFamily: 'Poppins')),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('Reps',
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textHint,
                              fontFamily: 'Poppins')),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('RPE',
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textHint,
                              fontFamily: 'Poppins')),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...group.sets.map((set) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${set.setNumber}',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${set.weightKg.toStringAsFixed(1)}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textPrimary,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${set.reps}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textPrimary,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              set.rpe != null ? '${set.rpe}' : '-',
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textPrimary,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

@riverpod
Future<WorkoutSession?> workoutSessionDetailProvider(
    WorkoutSessionDetailProviderRef ref, String id) async {
  final repo = ref.watch(workoutRepositoryProvider);
  return repo.getWorkoutSessionById(id);
}
