import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../domain/entities/exercise.dart';
import '../../domain/entities/workout_program.dart';
import '../../domain/entities/workout_set_group.dart';
import '../../domain/entities/workout_template.dart';
import '../providers/workout_providers.dart';

class WorkoutProgramDetailScreen extends ConsumerWidget {
  final String id;

  const WorkoutProgramDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programsAsync = ref.watch(workoutProgramsProvider);

    return programsAsync.when(
      loading: () => const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        backgroundColor: AppColors.background,
        body: AppErrorWidget(message: e.toString()),
      ),
      data: (programs) {
        final program = programs.where((p) => p.id == id).firstOrNull;
        if (program == null) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(title: const Text('Program')),
            body: const AppErrorWidget(message: 'Program not found'),
          );
        }
        return _ProgramDetailContent(program: program);
      },
    );
  }
}

class _ProgramDetailContent extends StatefulWidget {
  final WorkoutProgram program;

  const _ProgramDetailContent({required this.program});

  @override
  State<_ProgramDetailContent> createState() => _ProgramDetailContentState();
}

class _ProgramDetailContentState extends State<_ProgramDetailContent> {
  int _currentWeek = 1;

  List<WorkoutTemplate> get _currentWeekTemplates {
    final start = (_currentWeek - 1) * widget.program.sessionsPerWeek;
    final end = start + widget.program.sessionsPerWeek;
    if (start >= widget.program.templates.length) return [];
    return widget.program.templates.sublist(
      start,
      end > widget.program.templates.length
          ? widget.program.templates.length
          : end,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(widget.program.name),
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
                  color: AppColors.primary.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Program Overview',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    fontFamily: 'Poppins',
                  ),
                ),
                if (widget.program.description != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    widget.program.description!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  children: [
                    _OverviewStat(
                      icon: Icons.calendar_today_rounded,
                      value: '${widget.program.durationWeeks} Weeks',
                    ),
                    const SizedBox(width: 20),
                    _OverviewStat(
                      icon: Icons.repeat_rounded,
                      value: '${widget.program.sessionsPerWeek}/week',
                    ),
                    const SizedBox(width: 20),
                    _OverviewStat(
                      icon: Icons.fitness_center_rounded,
                      value: '${widget.program.templates.length} sessions',
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _ProgramMetaBadge(
                  label: _goalName(widget.program.goal),
                  color: _goalColor(widget.program.goal),
                ),
                const SizedBox(height: 6),
                _ProgramMetaBadge(
                  label: _difficultyName(widget.program.difficulty),
                  color: _difficultyColor(widget.program.difficulty),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Text(
                'Weekly Schedule',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  fontFamily: 'Poppins',
                ),
              ),
              const Spacer(),
              DropdownButton<int>(
                value: _currentWeek,
                dropdownColor: AppColors.surface,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontFamily: 'Poppins',
                ),
                items: List.generate(
                  widget.program.durationWeeks,
                  (i) => DropdownMenuItem(
                    value: i + 1,
                    child: Text('Week ${i + 1}'),
                  ),
                ),
                onChanged: (v) => setState(() => _currentWeek = v!),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...List.generate(widget.program.sessionsPerWeek, (i) {
            final template = i < _currentWeekTemplates.length
                ? _currentWeekTemplates[i]
                : null;
            return _WeekDayCard(
              day: i + 1,
              template: template,
              onTap: template != null
                  ? () => _startTemplate(template)
                  : null,
            );
          }),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _startProgram(),
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('Start Program'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  void _startTemplate(WorkoutTemplate template) {
    final exercises = template.exercises
        .map((e) => WorkoutSetGroup(
              exerciseId: e.exerciseId,
              exerciseName: e.exerciseName,
              sets: [],
              restSeconds: e.restSeconds,
            ))
        .toList();
    context.read(activeWorkoutProvider.notifier)
        .startWorkout(template.name, exercises);
    context.push('/workout/active');
  }

  void _startProgram() {
    final firstTemplate = widget.program.templates.firstOrNull;
    if (firstTemplate != null) _startTemplate(firstTemplate);
  }

  String _goalName(Goal g) {
    switch (g) {
      case Goal.muscleGain: return 'Muscle Gain';
      case Goal.fatLoss: return 'Fat Loss';
      case Goal.strength: return 'Strength';
      case Goal.endurance: return 'Endurance';
    }
  }

  Color _goalColor(Goal g) {
    switch (g) {
      case Goal.muscleGain: return AppColors.primary;
      case Goal.fatLoss: return AppColors.warning;
      case Goal.strength: return AppColors.error;
      case Goal.endurance: return AppColors.info;
    }
  }

  String _difficultyName(Difficulty d) {
    switch (d) {
      case Difficulty.beginner: return 'Beginner';
      case Difficulty.intermediate: return 'Intermediate';
      case Difficulty.advanced: return 'Advanced';
    }
  }

  Color _difficultyColor(Difficulty d) {
    switch (d) {
      case Difficulty.beginner: return AppColors.success;
      case Difficulty.intermediate: return AppColors.warning;
      case Difficulty.advanced: return AppColors.error;
    }
  }
}

class _OverviewStat extends StatelessWidget {
  final IconData icon;
  final String value;

  const _OverviewStat({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primary),
        const SizedBox(width: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}

class _ProgramMetaBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _ProgramMetaBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}

class _WeekDayCard extends StatelessWidget {
  final int day;
  final WorkoutTemplate? template;
  final VoidCallback? onTap;

  const _WeekDayCard({
    required this.day,
    this.template,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dayNames = [
      'Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6', 'Day 7'
    ];
    final dayName = day <= dayNames.length ? dayNames[day - 1] : 'Day $day';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: template != null ? AppColors.card : AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: template != null
              ? AppColors.primary.withOpacity(0.2)
              : AppColors.border.withOpacity(0.3),
        ),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: template != null
                ? AppColors.primary.withOpacity(0.15)
                : AppColors.disabled.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$day',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: template != null
                    ? AppColors.primary
                    : AppColors.disabled,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
        title: Text(
          template?.name ?? 'Rest Day',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: template != null
                ? AppColors.textPrimary
                : AppColors.textHint,
            fontFamily: 'Poppins',
          ),
        ),
        subtitle: template != null
            ? Text(
                '${template.exercises.length} exercises \u2022 ${template.estimatedDuration} min',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                  fontFamily: 'Poppins',
                ),
              )
            : null,
        trailing: template != null
            ? const Icon(Icons.play_circle_fill_rounded,
                color: AppColors.primary, size: 28)
            : const Icon(Icons.check_circle_outline,
                color: AppColors.disabled, size: 24),
        onTap: onTap,
      ),
    );
  }
}
