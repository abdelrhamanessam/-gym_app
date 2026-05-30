import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/error_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../domain/entities/workout_session.dart';
import '../../domain/entities/workout_set_group.dart';
import '../../domain/repositories/workout_repository.dart';
import '../providers/workout_providers.dart';

class WorkoutListScreen extends ConsumerWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(workoutSessionsProvider());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Workouts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/workout/create'),
        icon: const Icon(Icons.add_rounded),
        label: const Text('New Workout'),
      ),
      body: sessionsAsync.when(
        loading: () => const LoadingScreen(),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(workoutSessionsProvider),
        ),
        data: (sessions) {
          if (sessions.isEmpty) {
            return _EmptyWorkoutState(onStart: () => context.push('/workout/create'));
          }
          final grouped = _groupByDate(sessions);
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
            itemCount: grouped.entries.length,
            itemBuilder: (context, index) {
              final entry = grouped.entries.elementAt(index);
              return _DateGroup(
                date: entry.key,
                sessions: entry.value,
                onTap: (session) => context.push('/workout/${session.id}'),
                onDelete: (session) => _deleteSession(ref, session),
              );
            },
          );
        },
      ),
    );
  }

  Map<String, List<WorkoutSession>> _groupByDate(
      List<WorkoutSession> sessions) {
    final map = <String, List<WorkoutSession>>{};
    for (final s in sessions) {
      final key = DateFormat('yyyy-MM-dd').format(s.date);
      map.putIfAbsent(key, () => []).add(s);
    }
    return Map.fromEntries(map.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key)));
  }

  Future<void> _deleteSession(WidgetRef ref, WorkoutSession session) async {
    final repo = ref.read(workoutRepositoryProvider);
    await repo.deleteWorkoutSession(session.id);
    ref.invalidate(workoutSessionsProvider);
  }
}

class _EmptyWorkoutState extends StatelessWidget {
  final VoidCallback onStart;

  const _EmptyWorkoutState({required this.onStart});

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget(
      icon: Icons.fitness_center_rounded,
      title: 'No Workouts Yet',
      message: 'Start your fitness journey by logging your first workout!',
      action: ElevatedButton.icon(
        onPressed: onStart,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Start Workout'),
      ),
    );
  }
}

class _DateGroup extends StatelessWidget {
  final String date;
  final List<WorkoutSession> sessions;
  final ValueChanged<WorkoutSession> onTap;
  final ValueChanged<WorkoutSession> onDelete;

  const _DateGroup({
    required this.date,
    required this.sessions,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final dateObj = DateTime.parse(date);
    final formatted = DateFormat('EEEE, MMMM d').format(dateObj);
    final totalVolume =
        sessions.fold<double>(0, (sum, s) => sum + s.totalVolumeKg);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 12),
          child: Row(
            children: [
              Text(
                formatted,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                  fontFamily: 'Poppins',
                ),
              ),
              const Spacer(),
              Text(
                '${sessions.length} workout${sessions.length > 1 ? 's' : ''}',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
        ...sessions.map(
          (session) => _WorkoutCard(
            session: session,
            onTap: () => onTap(session),
            onDelete: () => onDelete(session),
          ),
        ),
      ],
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  final WorkoutSession session;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _WorkoutCard({
    required this.session,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(session.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: AppColors.error,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.delete_rounded, color: Colors.white),
      ),
      onDismissed: (_) => onDelete(),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: session.isCompleted
                      ? AppColors.primary.withOpacity(0.15)
                      : AppColors.warning.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  session.isCompleted
                      ? Icons.check_circle_rounded
                      : Icons.timer_rounded,
                  color: session.isCompleted
                      ? AppColors.primary
                      : AppColors.warning,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      session.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        if (session.durationMinutes > 0) ...[
                          const Icon(Icons.timer_outlined,
                              size: 14, color: AppColors.textHint),
                          const SizedBox(width: 4),
                          Text(
                            '${session.durationMinutes} min',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textHint,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                        if (session.totalVolumeKg > 0) ...[
                          const Icon(Icons.fitness_center_rounded,
                              size: 14, color: AppColors.textHint),
                          const SizedBox(width: 4),
                          Text(
                            '${session.totalVolumeKg.toStringAsFixed(0)} kg',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textHint,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded,
                  color: AppColors.textHint),
            ],
          ),
        ),
      ),
    );
  }
}
